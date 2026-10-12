module stop_check(
    input clk,
    input rst,
    input stop_check_en,
    input sampled_bit,
    input [5:0] prescale,
    input [5:0] edge_cnt,
    output reg stop_error
);

wire [5:0] half_prescale = prescale >> 1;

always@(posedge clk or negedge rst) begin
    if(!rst) begin
        stop_error <= 1'b0;
    end
    else if(stop_check_en) begin
     if(edge_cnt == half_prescale+6'd2) begin// to check only after the samplid bit is ready 
        stop_error <= (sampled_bit !=1'b1) ? 1'b1:1'b0;
     end
    end else begin
        stop_error <= 1'b0;
    end
end


endmodule
