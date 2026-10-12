module data_sampling(
    input [5:0]prescale,
    input clk,
    input rst,
    input RX_IN,
    input data_samp_en,
    input [5:0] edge_cnt,
    output reg sampled_bit
);

reg [2:0]samples;//3 samples to select the majority of the three samples

wire [5:0] half_prescale = prescale >> 1;


always@(posedge clk or negedge rst) begin 
    
    if(!rst) begin
        sampled_bit <= 1'b0;
        samples <= 3'd0;
    end
    else if (data_samp_en) begin 

if (edge_cnt== half_prescale-6'd1) begin
samples[0] <= RX_IN;
end
else if (edge_cnt== half_prescale) begin
samples[1] <= RX_IN;
end
else if (edge_cnt== half_prescale+6'd1) begin
samples[2] <= RX_IN;

//select the majority of the three samples
//replace samples[2] with RX_IN to avoid the delay of one clock cycle in the sampled_bit output
sampled_bit <= (samples[0] & samples[1]) | (samples[1] & RX_IN) | (samples[0] & RX_IN);
end

 end else begin 
    
    sampled_bit <= 1'b0;
    samples <= 3'd0;
end
    
end
endmodule
