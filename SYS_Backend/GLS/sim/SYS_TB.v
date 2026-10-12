`timescale 1ns/1ps

module tb_SYS_TOP;

    localparam DATA_WIDTH = 8;
    localparam RF_ADDR    = 4;

    // ---- Clocks ------------------------------------------------------------
    localparam REF_CLK_PERIOD  = 20.0;      // 50 MHz
    localparam UART_CLK_PERIOD = 271.267;   // 3.6864 MHz
//note:if you want to test the case of NO parity bit exist you have to do two steps: 1) change the value of PARITY_EN to 0 in SYS_TB.v file, 2) change the value of Reg_file[2] to 8'b100000_00 in reg_file.v file
    // ---- UART framing -------------------------------
    real    BIT_PERIOD_NS = 1_000_000_000.0 / (3_686_400.0 / 32.0); // 271.267*32=~8680.56 ns
    localparam PARITY_EN   = 1'b1;
    localparam PARITY_EVEN = 1'b1;   // 1 = even parity, 0 = odd parity

    // ---- Opcodes (must match SYS_CTRL) --------------------------------------
    localparam [7:0] RF_WR_CMD   = 8'hAA;
    localparam [7:0] RF_RD_CMD   = 8'hBB;
    localparam [7:0] ALU_OP_CMD  = 8'hCC;
    localparam [7:0] ALU_NOP_CMD = 8'hDD;

    // ALU function codes (from ALU.v)
    localparam [3:0] FUN_ADD = 4'b0000;
    localparam [3:0] FUN_AND = 4'b0100;

    // ---- DUT I/O -------------------------------------------------------------
    reg  RST_N;
    reg  REF_CLK;
    reg  UART_CLK;
    reg  UART_RX_IN;
    wire UART_TX_O;
    wire parity_error;
    wire framing_error;
    reg test_mode = 1'b0;
    reg SE        = 1'b0;
    reg [3:0] SI  = 'b0;      // match the port width
    reg scan_clk  = 1'b0;
    reg scan_rst  = 1'b1;

    SYS_TOP DUT (
        .RST_N       (RST_N),
        .UART_CLK    (UART_CLK),
        .REF_CLK     (REF_CLK),
        .UART_RX_IN  (UART_RX_IN),
        .UART_TX_O   (UART_TX_O),
        .parity_error(parity_error),
        .framing_error(framing_error),
        .test_mode    (test_mode),
        .SE           (SE),
        .SI           (SI),
        .scan_clk     (scan_clk),
        .scan_rst     (scan_rst)
    );
    initial begin
        $dumpfile("SYS_TOP.vcd");
        $dumpvars(0, tb_SYS_TOP.DUT);  
    end

    // ---- Clock generation ------------------------------------------------
    initial REF_CLK = 1'b0;
    always #(REF_CLK_PERIOD/2.0) REF_CLK = ~REF_CLK;

    initial UART_CLK = 1'b0;
    always #(UART_CLK_PERIOD/2.0) UART_CLK = ~UART_CLK;

    // ---- Reset -------------------------------------------------------------
    initial begin
        RST_N      = 1'b0;
        UART_RX_IN = 1'b1;   // idle line is high
        repeat (5) @(posedge REF_CLK);
        RST_N = 1'b1;
        $display("[%0t] Reset released", $time);
    end

    // ---- Error flag monitors -------------------------------------------------
    always @(posedge parity_error)  $display("[%0t] *** parity_error asserted ***", $time);
    always @(posedge framing_error) $display("[%0t] *** framing_error asserted ***", $time);

    //--------------------------------------------------------------------
    // UART master: send one byte, LSB first, with optional parity.
    //--------------------------------------------------------------------
    task send_uart_byte(input [7:0] data);
        integer i;
        reg parity_bit;
        begin
            parity_bit = ^data;                       //even parity of data bits
            if (!PARITY_EVEN) parity_bit = ~parity_bit; // invert for odd parity

            UART_RX_IN = 1'b0;                         // start bit
            #(BIT_PERIOD_NS);

            for (i = 0; i < 8; i = i + 1) begin         // data bits, LSB first
                UART_RX_IN = data[i];
                #(BIT_PERIOD_NS);
            end

            if (PARITY_EN) begin
                UART_RX_IN = parity_bit;
                #(BIT_PERIOD_NS);
            end

            UART_RX_IN = 1'b1;                         // stop bit
            #(BIT_PERIOD_NS);

            $display("[%0t] MASTER sent byte 0x%02h", $time, data);
        end
    endtask

    //--------------------------------------------------------------------
    // UART monitor: passively decode bytes appearing on UART_TX_O.
    //--------------------------------------------------------------------
    reg [7:0] rx_byte;
    integer   rx_count = 0;

    task  uart_monitor;
        integer i;
        begin
            forever begin
                @(negedge UART_TX_O);        // start bit edge
                #(BIT_PERIOD_NS * 1.5);      // move to centre of bit 0
                for (i = 0; i < 8; i = i + 1) begin
                    rx_byte[i] = UART_TX_O;
                    #(BIT_PERIOD_NS);
                end
                // (parity/stop bits not checked here - simple TB)
                rx_count = rx_count + 1;
                $display("[%0t] >>> UART_TX_O byte #%0d = 0x%02h", $time, rx_count, rx_byte);
            end
        end
    endtask

    initial uart_monitor;

    //--------------------------------------------------------------------
    // Stimulus sequence: send the four commands and check results.
    //--------------------------------------------------------------------
    initial begin
        UART_RX_IN = 1'b1;
        wait (RST_N === 1'b1);
        repeat (50) @(posedge REF_CLK);

        // ---- Test 1: RF_Wr_CMD -> write 0x55 to address 0x4 ------------
        $display("\n=== TEST 1: RF_Wr_CMD - write 0x55 to addr 0x4 ===");
        send_uart_byte(RF_WR_CMD);
        send_uart_byte(8'h04);   // address
        send_uart_byte(8'h55);  // data
        #(BIT_PERIOD_NS * 20);   

        // ---- Test 2: RF_Rd_CMD -> read addr 0x4, expect 0x55 -----------
        $display("\n=== TEST 2: RF_Rd_CMD - read addr 0x4 (expect 0x55) ===");
        send_uart_byte(RF_RD_CMD);
        send_uart_byte(8'h04);
        #(BIT_PERIOD_NS * 30); 

        // ---- Test 3: ALU_OP_W_OP_CMD -> 10 + 20, expect 0x001E ---------
        $display("\n=== TEST 3: ALU_OP_W_OP_CMD - 10 + 20 (expect hi=0x00 lo=0x1E) ===");
        send_uart_byte(ALU_OP_CMD);
        send_uart_byte(8'd10);                 // Operand A
        send_uart_byte(8'd20);                 // Operand B
        send_uart_byte({4'b0000, FUN_ADD});    // Fun
        #(BIT_PERIOD_NS * 50);  

        // ---- Test 4: ALU_OP_W_NOP_CMD -> reuse 10,20 with AND ----------
        $display("\n=== TEST 4: ALU_OP_W_NOP_CMD - 10 AND 20 (expect hi=0x00 lo=0x00) ===");
        send_uart_byte(ALU_NOP_CMD);
        send_uart_byte({4'b0000, FUN_AND});
        #(BIT_PERIOD_NS * 50); 

        $display("\n=== All 4 commands completed successfully. ===");
        $finish;
    
    end

endmodule
