module serializer (
 input [7:0] P_DATA,
 input ser_en,
 input clk,
 input rst,
 input data_valid,
 output   ser_data, 
 output  ser_done  
);

reg [7:0] shift_reg;
reg [2:0] counter;

assign ser_data=shift_reg[0];
assign ser_done = (counter == 'b111) ? 1'b1 : 1'b0 ;


always @(posedge clk or negedge rst) begin
    if(!rst) begin
        shift_reg<=8'b0;
        counter<=3'b0;
    end  else if (data_valid && !ser_en) begin //load only if the TX is not busy with high data_valid signal
                shift_reg<=P_DATA;
                counter<=3'b0;
    end  else if (ser_en) begin
shift_reg<=shift_reg>>1;
counter<=counter+1'b1;

    end 
end
endmodule

