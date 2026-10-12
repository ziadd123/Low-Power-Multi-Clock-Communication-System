module parity_check(
    input clk,
    input rst,
    input parity_check_en,
    input [5:0] prescale,
    input [5:0] edge_cnt,
    input [7:0] P_DATA,
    input sampled_bit,
    input PAR_TYP,
    output reg parity_error
);


wire [5:0] half_prescale = prescale >> 1;
wire calculated_parity = (PAR_TYP==1'b1) ? ~^P_DATA : ^P_DATA; //even parity if PAR_TYP=0, odd parity if PAR_TYP=1

always@(posedge clk or negedge rst) begin
    if(!rst) begin
        parity_error <= 1'b0;
    end
    else if(parity_check_en) begin
        if(edge_cnt == half_prescale+6'd2) begin // to check only after the samplid bit is ready 
            parity_error <= (sampled_bit != calculated_parity) ?  1'b1:1'b0; 
        end
    end else begin
        parity_error <= 1'b0;
    end
end



endmodule
