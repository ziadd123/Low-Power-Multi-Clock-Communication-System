module SYS_TOP # ( parameter DATA_WIDTH = 8 ,  RF_ADDR = 4 , NUM_OF_CHAINS=4)
(
 input   wire                          RST_N,
 input   wire                          UART_CLK,
 input   wire                          REF_CLK,
 input   wire                          UART_RX_IN,
 output  wire                          UART_TX_O,
 output  wire                          parity_error,
 output  wire                          framing_error,
//////////////////DFT SIGNALS/////////////////
input  wire   [NUM_OF_CHAINS-1:0]      SI,
input  wire                            SE,
input  wire                       scan_clk,
input  wire                       scan_rst,
input  wire                       test_mode,
output wire   [NUM_OF_CHAINS-1:0]      SO
);



wire                                   SYNC_UART_RST,
                                       SYNC_REF_RST;

wire                                   UART_TX_CLK;
wire                                   UART_RX_CLK;


wire      [DATA_WIDTH-1:0]             Operand_A,
                                       Operand_B,
                                       UART_Config,
                                       DIV_RATIO;

wire      [DATA_WIDTH-1:0]             DIV_RATIO_RX;

wire      [DATA_WIDTH-1:0]             UART_RX_OUT;
wire                                   UART_RX_V_OUT;
wire      [DATA_WIDTH-1:0]             UART_RX_SYNC;
wire                                   UART_RX_V_SYNC;

wire      [DATA_WIDTH-1:0]             UART_TX_IN;
wire                                   UART_TX_VLD;
wire      [DATA_WIDTH-1:0]             UART_TX_SYNC;
wire                                   UART_TX_V_SYNC;

wire                                   UART_TX_Busy;
wire                                   UART_TX_Busy_PULSE;

wire                                   RF_WrEn;
wire                                   RF_RdEn;
wire      [RF_ADDR-1:0]                RF_Address;
wire      [DATA_WIDTH-1:0]             RF_WrData;
wire      [DATA_WIDTH-1:0]             RF_RdData;
wire                                   RF_RdData_VLD;

wire                                   CLKG_EN;
wire                                   ALU_EN;
wire      [3:0]                        ALU_FUN;
wire      [DATA_WIDTH*2-1:0]           ALU_OUT;
wire                                   ALU_OUT_VLD;

wire                                   ALU_CLK ;

wire                                   FIFO_FULL ;

wire                                   CLKDIV_EN ;


//internal wires for DFT insertion
wire REF_CLK_i;
wire UART_CLK_i;
wire RST_N_i;
wire UART_TX_CLK_i;
wire UART_RX_CLK_i;
wire SYNC_UART_RST_i;
wire SYNC_REF_RST_i;
wire CLKG_EN_i;

// ---- Input clocks ----
mux2X1 U0_mux2X1 ( .IN_0(REF_CLK),  .IN_1(scan_clk), .SEL(test_mode), .OUT(REF_CLK_i)  );
mux2X1 U1_mux2X1 ( .IN_0(UART_CLK), .IN_1(scan_clk), .SEL(test_mode), .OUT(UART_CLK_i) );

// ---- Async reset input (feeds the RST_SYNC flops) ----
mux2X1 U2_mux2X1 ( .IN_0(RST_N),    .IN_1(scan_rst), .SEL(test_mode), .OUT(RST_N_i)    );

// ---- Synchronized resets (RST_SYNC outputs) ----
mux2X1 U3_mux2X1 ( .IN_0(SYNC_UART_RST), .IN_1(scan_rst), .SEL(test_mode), .OUT(SYNC_UART_RST_i) );
mux2X1 U4_mux2X1 ( .IN_0(SYNC_REF_RST),  .IN_1(scan_rst), .SEL(test_mode), .OUT(SYNC_REF_RST_i)  );

// ---- Divided clocks (CLK_DIV outputs) ----
mux2X1 U5_mux2X1 ( .IN_0(UART_TX_CLK), .IN_1(scan_clk), .SEL(test_mode), .OUT(UART_TX_CLK_i) );
mux2X1 U6_mux2X1 ( .IN_0(UART_RX_CLK), .IN_1(scan_clk), .SEL(test_mode), .OUT(UART_RX_CLK_i) );

// ---- Keep the ALU clock gate open in test mode ----
assign CLKG_EN_i = CLKG_EN | test_mode;

///********************************************************///
//////////////////// Reset synchronizers /////////////////////
///********************************************************///

RST_SYNC # (.NUM_STAGES(2)) U0_RST_SYNC (
.rst(RST_N_i),
.clk(UART_CLK_i),
.sync_rst(SYNC_UART_RST)
);

RST_SYNC # (.NUM_STAGES(2)) U1_RST_SYNC (
.rst(RST_N_i),
.clk(REF_CLK_i),
.sync_rst(SYNC_REF_RST)
);

///********************************************************///
////////////////////// Data Synchronizer /////////////////////
///********************************************************///

DATA_SYNC # (.N_stage(2) , .bus_width(8)) U0_ref_sync (
.dest_clk(REF_CLK_i),
.dest_rst(SYNC_REF_RST_i),
.unsync_bus(UART_RX_OUT),
.bus_enable(UART_RX_V_OUT),
.sync_bus(UART_RX_SYNC),
.enable_pulse(UART_RX_V_SYNC)
);

///********************************************************///
///////////////////////// Async FIFO /////////////////////////
///********************************************************///

ASYNC_FIFO_TOP #(.DATA_WIDTH(DATA_WIDTH) , .ptr_size(4)  , .addr_size(3)) U0_UART_FIFO (
.wclk(REF_CLK_i),
.wrst(SYNC_REF_RST_i),
.winc(UART_TX_VLD),
.wdata(UART_TX_IN),
.rclk(UART_TX_CLK_i),
.rrst(SYNC_UART_RST_i),
.rinc(UART_TX_Busy_PULSE),
.rdata(UART_TX_SYNC),
.full(FIFO_FULL),
.empty(UART_TX_V_SYNC)
);

///********************************************************///
//////////////////////// Pulse Generator /////////////////////
///********************************************************///

PUL_GEN U0_PULSE_GEN (
.clk(UART_TX_CLK_i),
.rst(SYNC_UART_RST_i),
.lvl_sig(UART_TX_Busy),
.pulse_sig(UART_TX_Busy_PULSE)
);

///********************************************************///
//////////// Clock Divider for UART_TX Clock /////////////////
///********************************************************///

CLK_DIV U0_ClkDiv (
.i_ref_clk(UART_CLK_i),
.i_rst_n(SYNC_UART_RST_i),
.i_clk_en(CLKDIV_EN),
.i_div_ratio(DIV_RATIO),
.o_div_clk(UART_TX_CLK)
);

///********************************************************///
/////////////////////// Custom Mux Clock /////////////////////
///********************************************************///

CLKDIV_MUX U0_CLKDIV_MUX (
.IN(UART_Config[7:2]),
.OUT(DIV_RATIO_RX)
);

///********************************************************///
//////////// Clock Divider for UART_RX Clock /////////////////
///********************************************************///

CLK_DIV U1_ClkDiv (
.i_ref_clk(UART_CLK_i),
.i_rst_n(SYNC_UART_RST_i),
.i_clk_en(CLKDIV_EN),
.i_div_ratio(DIV_RATIO_RX),
.o_div_clk(UART_RX_CLK)
);

///********************************************************///
/////////////////////////// UART /////////////////////////////
///********************************************************///

TOP_UART  U0_UART (
.RST(SYNC_UART_RST_i),
.TX_CLK(UART_TX_CLK_i),
.RX_CLK(UART_RX_CLK_i),
.parity_enable(UART_Config[0]),
.parity_type(UART_Config[1]),
.Prescale(UART_Config[7:2]),
.RX_IN_S(UART_RX_IN),
.RX_OUT_P(UART_RX_OUT),
.RX_OUT_V(UART_RX_V_OUT),
.TX_IN_P(UART_TX_SYNC),
.TX_IN_V(!UART_TX_V_SYNC),
.TX_OUT_S(UART_TX_O),
.TX_OUT_V(UART_TX_Busy),
.parity_error(parity_error),
.framing_error(framing_error)
);

///********************************************************///
//////////////////// System Controller ///////////////////////
///********************************************************///

SYS_CTRL U0_SYS_CTRL (
.CLK(REF_CLK_i),
.RST(SYNC_REF_RST_i),
.RdData(RF_RdData),
.RdData_Valid(RF_RdData_VLD),
.WrEn(RF_WrEn),
.RdEn(RF_RdEn),
.Address(RF_Address),
.WrData(RF_WrData),
.EN(ALU_EN),
.ALU_FUN(ALU_FUN),
.ALU_OUT(ALU_OUT),
.OUT_Valid(ALU_OUT_VLD),
.CLK_EN(CLKG_EN),
.clk_div_en(CLKDIV_EN),
.FIFO_FULL(FIFO_FULL),
.RX_P_DATA(UART_RX_SYNC),
.RX_D_VLD(UART_RX_V_SYNC),
.TX_P_DATA(UART_TX_IN),
.TX_D_VLD(UART_TX_VLD)
);

///********************************************************///
/////////////////////// Register File ////////////////////////
///********************************************************///

reg_file U0_RegFile (
.CLK(REF_CLK_i),
.rst(SYNC_REF_RST_i),
.WrEn(RF_WrEn),
.RdEn(RF_RdEn),
.Address(RF_Address),
.WrData(RF_WrData),
.RdData(RF_RdData),
.RdData_Valid(RF_RdData_VLD),
.REG0(Operand_A),
.REG1(Operand_B),
.REG2(UART_Config),
.REG3(DIV_RATIO)
);

///********************************************************///
//////////////////////////// ALU /////////////////////////////
///********************************************************///

ALU U0_ALU (
.CLK(ALU_CLK),
.RST(SYNC_REF_RST_i),
.A(Operand_A),
.B(Operand_B),
.EN(ALU_EN),
.ALU_FUN(ALU_FUN),
.ALU_OUT(ALU_OUT),
.OUT_VALID(ALU_OUT_VLD)
);

///********************************************************///
///////////////////////// Clock Gating ///////////////////////
///********************************************************///

CLK_GATE U0_CLK_GATE (
.CLK_EN(CLKG_EN_i),
.CLK(REF_CLK_i),
.GATED_CLK(ALU_CLK)
);


endmodule
