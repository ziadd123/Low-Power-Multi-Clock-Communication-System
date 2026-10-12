module edge_bit_counter(
    input clk,
    input rst,
    input counter_en,
    input [5:0] prescale,
    output reg [5:0] edge_cnt,
    output reg [3:0] bit_cnt
);

always@(posedge clk or negedge rst) begin
    if(!rst) begin
        edge_cnt <= 6'd0;
        bit_cnt <= 4'd0;
    end
    else if(counter_en) begin
        if(edge_cnt==prescale -6'd1)begin 
bit_cnt<=bit_cnt+4'd1;
edge_cnt<=6'd0;
 end else begin
 edge_cnt<=edge_cnt+6'd1;
end
    end else begin
        edge_cnt <= 6'd0;
        bit_cnt <= 4'd0;
    end
end
endmodule


