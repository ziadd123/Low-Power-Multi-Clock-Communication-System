module TX_TOP (
 input [7:0] P_DATA,
 input data_valid,
 input PAR_EN,
 input PAR_TYP,
 input clk,
 input rst,
 output busy,
 output TX_OUT
);

///////////// internal wires ////////

wire ser_done;
wire ser_en;
wire ser_data;
wire PAR_BIT;

wire [1:0] sel;
///// const values for STP, STR
wire start_bit = 1'b0;
wire stop_bit  = 1'b1;

serializer u_serializer (
 .clk(clk),
 .rst(rst),
 .ser_en(ser_en),
 .P_DATA(P_DATA),
 .data_valid(data_valid),
 .ser_data(ser_data),
 .ser_done(ser_done)
);

PAR_CALC u_PAR_CALC (
  .clk(clk),
  .rst(rst),
  .data_valid(data_valid),
  .P_DATA(P_DATA),
  .PAR_TYP(PAR_TYP),
  .PAR_BIT(PAR_BIT)
);

MUX U_MUX (
  
  .sel(sel),
  .start_bit(start_bit),
  .stop_bit(stop_bit),
  .PAR_BIT(PAR_BIT),
  .ser_data(ser_data),
  .TX_OUT(TX_OUT)
);

FSM U_FSM (
 .clk(clk),
 .rst(rst),  
 .data_valid(data_valid),
 .PAR_EN(PAR_EN),
 .ser_done(ser_done),
 .ser_en(ser_en),
 .sel(sel),
 .busy(busy)
);

endmodule