module FIFO_RD #(parameter addr_size=3,parameter ptr_size=addr_size+1)(
    input rclk,
    input rrst,
    input rinc,
    input [ptr_size-1:0] sync_wptr,
    output wire empty,
    output wire [addr_size-1:0] raddr,
    output reg [ptr_size-1:0] gray_rptr
);
reg [ptr_size-1:0] bin_rptr;

assign empty= gray_rptr == sync_wptr;
assign raddr=bin_rptr[addr_size-1:0];


//binary to gray convertion is calculated as gray_wptr<=(bin_wptr>>1) ^ bin_wptr;

always @(posedge rclk or negedge rrst) begin
    if(!rrst) begin
        bin_rptr<='b0;
        gray_rptr<='b0;
    end else 
        if (rinc && !empty) begin
            bin_rptr<=bin_rptr+'b1;
            gray_rptr<=((bin_rptr+'b1)>>1) ^ (bin_rptr+'b1); 
        end     
end

endmodule
