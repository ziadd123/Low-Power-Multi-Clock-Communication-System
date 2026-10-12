
module SYS_CTRL #(
    parameter ADDR_WIDTH = 4,
    parameter DATA_WIDTH = 8,
    parameter FUN_WIDTH  = 4
)(
    input  wire                        CLK,
    input  wire                        RST,          // active-low, synchronized

    // From ALU (double-width result: multiplication / wide ops)
    input  wire [2*DATA_WIDTH-1:0]     ALU_OUT,
    input  wire                        OUT_Valid,

    // To ALU
    output reg  [FUN_WIDTH-1:0]        ALU_FUN,
    output reg                         EN,


    // From RegFile
    input  wire [DATA_WIDTH-1:0]       RdData,
    input  wire                        RdData_Valid,

     // To RegFile
    output reg  [ADDR_WIDTH-1:0]       Address,
    output reg                         WrEn,
    output reg                         RdEn,
    output reg  [DATA_WIDTH-1:0]       WrData,


    // From UART_RX (through Data_Sync)
    input  wire [DATA_WIDTH-1:0]       RX_P_DATA,
    input  wire                        RX_D_VLD,

    // From ASYNC_FIFO
    input  wire                        FIFO_FULL,

    // To ASYNC_FIFO write side (-> UART_TX)
    output reg  [DATA_WIDTH-1:0]       TX_P_DATA,
    output reg                         TX_D_VLD,

    // To Clock Divider
    output wire                        clk_div_en,

     // To Clock Gating
    output wire                        CLK_EN

);

    //--------------------------------------------------------------------
    // Opcodes
    //--------------------------------------------------------------------
    localparam [7:0] RF_WR_CMD   = 8'hAA;
    localparam [7:0] RF_RD_CMD   = 8'hBB;
    localparam [7:0] ALU_OP_CMD  = 8'hCC;
    localparam [7:0] ALU_NOP_CMD = 8'hDD;

    // Reserved RegFile addresses used to stage ALU operands
    localparam [ADDR_WIDTH-1:0] REG0_ADDR = {ADDR_WIDTH{1'b0}};
    localparam [ADDR_WIDTH-1:0] REG1_ADDR = {{(ADDR_WIDTH-1){1'b0}}, 1'b1};

    //--------------------------------------------------------------------
    // State encoding (13 states -> 4-bit state register)
    //--------------------------------------------------------------------
    localparam [3:0]
        S_IDLE        = 4'd0,
        S_RFWR_ADDR   = 4'd1,   // wait Addr byte
        S_RFWR_DATA   = 4'd2,   // wait Data byte; WrEn pulses THIS cycle
        S_RFRD_ADDR   = 4'd3,   // wait Addr byte; RdEn pulses THIS cycle
        S_RFRD_WAIT   = 4'd4,   // wait RdData_Valid
        S_RFRD_SEND   = 4'd5,   // send RdData byte
        S_ALUOP_A     = 4'd6,   // wait OperandA byte
        S_ALUOP_B     = 4'd7,   // wait OperandB byte; write OpA->REG0 THIS cycle
        S_ALUOP_FUN   = 4'd8,   // wait Fun byte; write OpB->REG1 + CLK_EN THIS cycle
        S_ALUNOP_FUN  = 4'd9,   // wait Fun byte; CLK_EN THIS cycle
        S_ALU_EXEC    = 4'd10,  // EN+ALU_FUN held until OUT_Valid
        S_ALU_SEND_HI = 4'd11,  // send high byte of ALU result
        S_ALU_SEND_LO = 4'd12;  // send low byte of ALU result

    reg [3:0] state, nstate;

    // captured command fields
    reg [ADDR_WIDTH-1:0]   addr_r;           // held only for RF write (addr arrives before data)
    reg [DATA_WIDTH-1:0]   opa_r, opb_r;
    reg [FUN_WIDTH-1:0]    fun_r;
    reg [DATA_WIDTH-1:0]   rd_result_r;      // RegFile-read result (8-bit)
    reg [2*DATA_WIDTH-1:0] alu_result_r;     // ALU result (16-bit, full width)

    //--------------------------------------------------------------------
    // State register
    //--------------------------------------------------------------------
    always @(posedge CLK or negedge RST) begin
        if (!RST)
            state <= S_IDLE;
        else
            state <= nstate;
    end

    //--------------------------------------------------------------------
    // Next-state logic
    //--------------------------------------------------------------------
    always @(*) begin
        nstate = state;
        case (state)

            S_IDLE: begin
                if (RX_D_VLD) begin
                    case (RX_P_DATA)
                        RF_WR_CMD  : nstate = S_RFWR_ADDR;
                        RF_RD_CMD  : nstate = S_RFRD_ADDR;
                        ALU_OP_CMD : nstate = S_ALUOP_A;
                        ALU_NOP_CMD: nstate = S_ALUNOP_FUN;
                        default    : nstate = S_IDLE;   // unknown opcode -> ignore
                    endcase
                end
            end

            // ---- RegFile write (0xAA) : write fires same cycle as data byte ----
            S_RFWR_ADDR : if (RX_D_VLD) nstate = S_RFWR_DATA;
            S_RFWR_DATA : if (RX_D_VLD) nstate = S_IDLE;

            // ---- RegFile read (0xBB) : read fires same cycle as addr byte ----
            S_RFRD_ADDR : if (RX_D_VLD)     nstate = S_RFRD_WAIT;
            S_RFRD_WAIT : if (RdData_Valid) nstate = S_RFRD_SEND;
            S_RFRD_SEND : if (!FIFO_FULL)   nstate = S_IDLE;

            // ---- ALU op with operands (0xCC) : REG0/REG1 writes piggyback on byte capture ----
            S_ALUOP_A   : if (RX_D_VLD) nstate = S_ALUOP_B;
            S_ALUOP_B   : if (RX_D_VLD) nstate = S_ALUOP_FUN;
            S_ALUOP_FUN : if (RX_D_VLD) nstate = S_ALU_EXEC;   // CLK_EN already high this cycle

            // ---- ALU op, no operand (0xDD) ----
            S_ALUNOP_FUN: if (RX_D_VLD) nstate = S_ALU_EXEC;   // CLK_EN already high this cycle

            // ---- shared ALU execute / send (used by both 0xCC and 0xDD) ----
            S_ALU_EXEC   : if (OUT_Valid)   nstate = S_ALU_SEND_HI; // EN held until valid
            S_ALU_SEND_HI: if (!FIFO_FULL)  nstate = S_ALU_SEND_LO;
            S_ALU_SEND_LO: if (!FIFO_FULL)  nstate = S_IDLE;

            default: nstate = S_IDLE;
        endcase
    end

    //--------------------------------------------------------------------
    // Frame capture registers
    //--------------------------------------------------------------------
    //for the data bytes only(not the address bytes) comes from the UART RX to use this data later
    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            addr_r <= {ADDR_WIDTH{1'b0}};
            opa_r  <= {DATA_WIDTH{1'b0}};
            opb_r  <= {DATA_WIDTH{1'b0}};
            fun_r  <= {FUN_WIDTH{1'b0}};
        end else begin
            case (state)
                S_RFWR_ADDR : if (RX_D_VLD) addr_r <= RX_P_DATA[ADDR_WIDTH-1:0];
                S_ALUOP_A   : if (RX_D_VLD) opa_r  <= RX_P_DATA;
                S_ALUOP_B   : if (RX_D_VLD) opb_r  <= RX_P_DATA;
                S_ALUOP_FUN : if (RX_D_VLD) fun_r  <= RX_P_DATA[FUN_WIDTH-1:0];
                S_ALUNOP_FUN: if (RX_D_VLD) fun_r  <= RX_P_DATA[FUN_WIDTH-1:0];
                default: ;
            endcase
        end
    end

    // result registers: hold the value(s) to send back to the master
    always @(posedge CLK or negedge RST) begin
        if (!RST)
            rd_result_r <= {DATA_WIDTH{1'b0}};
        else if (state == S_RFRD_WAIT && RdData_Valid)
            rd_result_r <= RdData;
    end

    always @(posedge CLK or negedge RST) begin
        if (!RST)
            alu_result_r <= {2*DATA_WIDTH{1'b0}};
        else if (state == S_ALU_EXEC && OUT_Valid)
            alu_result_r <= ALU_OUT;   // full 16-bit result, no truncation
    end

    //--------------------------------------------------------------------
    // Output logic (state + live RX_P_DATA/FIFO_FULL -> Mealy)
    //--------------------------------------------------------------------
    always @(*) begin
        // safe defaults every cycle
        WrEn      = 1'b0;
        RdEn      = 1'b0;
        Address   = {ADDR_WIDTH{1'b0}};
        WrData    = {DATA_WIDTH{1'b0}};
        EN        = 1'b0;
        ALU_FUN   = {FUN_WIDTH{1'b0}};
        TX_D_VLD  = 1'b0;
        TX_P_DATA = {DATA_WIDTH{1'b0}};

        case (state)
            // Mealy: fire the RegFile write the instant the data byte lands
            S_RFWR_DATA: begin
                if (RX_D_VLD) begin
                    WrEn    = 1'b1;
                    Address = addr_r;
                    WrData  = RX_P_DATA;
                end
            end

            // Mealy: fire the RegFile read the instant the addr byte lands
            S_RFRD_ADDR: begin
                if (RX_D_VLD) begin
                    RdEn    = 1'b1;
                    Address = RX_P_DATA[ADDR_WIDTH-1:0];
                end
            end

            S_RFRD_SEND: begin
                TX_P_DATA = rd_result_r;
                TX_D_VLD  = ~FIFO_FULL;
            end

            // Mealy: stage OpA into REG0 while OpB is being captured
            S_ALUOP_B: begin
                if (RX_D_VLD) begin
                    WrEn    = 1'b1;
                    Address = REG0_ADDR;
                    WrData  = opa_r;
                end
            end

            // Mealy: stage OpB into REG1 while Fun is being captured
            S_ALUOP_FUN: begin
                if (RX_D_VLD) begin
                    WrEn    = 1'b1;
                    Address = REG1_ADDR;
                    WrData  = opb_r;
                end
            end

            S_ALU_EXEC: begin
                EN      = 1'b1;             // held until OUT_Valid (see next-state)
                ALU_FUN = fun_r;
            end

            S_ALU_SEND_HI: begin
                TX_P_DATA = alu_result_r[2*DATA_WIDTH-1:DATA_WIDTH]; // high byte first
                TX_D_VLD  = ~FIFO_FULL;
            end

            S_ALU_SEND_LO: begin
                TX_P_DATA = alu_result_r[DATA_WIDTH-1:0];            // then low byte
                TX_D_VLD  = ~FIFO_FULL;
            end

            default: ; // outputs stay at default (0)
        endcase
    end

    //--------------------------------------------------------------------
    // Misc outputs
    //--------------------------------------------------------------------
    // Gate the ALU's clock on one state before it's actually driven, so the
    // clock tree has a full cycle to settle before EN/ALU_FUN are applied.
    assign CLK_EN = (state == S_ALUOP_FUN)  ||
                    (state == S_ALUNOP_FUN) ||
                    (state == S_ALU_EXEC);

    // "Clock Divider is always on" per system specification.
    assign clk_div_en = 1'b1;

endmodule