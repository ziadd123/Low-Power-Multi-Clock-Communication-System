module MUX (
   
  input [1:0] sel,
  input start_bit,
  input stop_bit,
  input PAR_BIT,
  input ser_data,
  output reg TX_OUT  
);

reg mux_out;

always @(*) begin
        case(sel)    
            2'b00: TX_OUT = start_bit;
            2'b01: TX_OUT = ser_data;
            2'b10: TX_OUT = PAR_BIT;
            2'b11: TX_OUT = stop_bit;
            default: TX_OUT = 1'b1;
        endcase
    end


endmodule 

