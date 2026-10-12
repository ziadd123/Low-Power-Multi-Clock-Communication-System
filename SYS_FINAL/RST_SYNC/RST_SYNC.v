module RST_SYNC #(parameter NUM_STAGES=2)(
    input clk,
    input rst,
    output sync_rst
);

reg [NUM_STAGES-1:0] sync_reg;

assign sync_rst=sync_reg[NUM_STAGES-1];

always @(posedge clk or negedge rst) begin
    if(!rst) begin
        sync_reg<='b0;
    end else begin
        sync_reg<={sync_reg[NUM_STAGES-2:0],1'b1};
    end
    
end
endmodule
