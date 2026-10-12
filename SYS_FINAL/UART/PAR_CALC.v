module PAR_CALC (
input [7:0] P_DATA,
input PAR_TYP,
input clk,
input rst,
input data_valid,
output reg PAR_BIT
);

always @(posedge clk or negedge rst) begin
    if(!rst) begin
        PAR_BIT <= 1'b0;
    end else if(data_valid) begin
        if(PAR_TYP) begin
         PAR_BIT<=~^P_DATA; //odd parity   
        end 
        else begin
       PAR_BIT<= ^P_DATA; //even parity

        end
    end
end
endmodule
