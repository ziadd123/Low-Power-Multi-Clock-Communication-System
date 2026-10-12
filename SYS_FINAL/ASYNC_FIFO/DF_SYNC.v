module DF_SYNC #(parameter WIDTH=4)(
    input clk,
    input rst,
    input [WIDTH-1:0] ASYNC_DATA,
    output reg [WIDTH-1:0] SYNC_DATA
);

reg [WIDTH-1:0] sync_reg;

always @(posedge clk or negedge rst) begin
    if (!rst) begin
        sync_reg<='b0;
        SYNC_DATA<='b0;
    end else begin
        sync_reg<=ASYNC_DATA;
        SYNC_DATA<=sync_reg;
    end

end

endmodule
