module FIFO_WR #(parameter addr_size=3,parameter ptr_size=addr_size+1)(
    input wclk,
    input wrst,
    input winc,
    input [ptr_size-1:0] sync_rptr,
    output wire full,
    output wire [addr_size-1:0] waddr,
    output reg [ptr_size-1:0] gray_wptr
);

reg [ptr_size-1:0] bin_wptr;

assign full = (gray_wptr == {~sync_rptr[ptr_size-1:ptr_size-2], sync_rptr[ptr_size-3:0]}); 
 assign  waddr=bin_wptr[addr_size-1:0];



//binary to gray convertion is calculated as gray_wptr<=(bin_wptr>>1) ^ bin_wptr;

        
always @(posedge wclk or negedge wrst ) begin
    if(!wrst) begin
        gray_wptr<='b0;
        bin_wptr<='b0;
        
    end else 
        if(winc && !full)begin
            bin_wptr<=bin_wptr+'b1;
            gray_wptr<= ((bin_wptr+'b1)>>1) ^ (bin_wptr+'b1); 
        end 
end

endmodule
