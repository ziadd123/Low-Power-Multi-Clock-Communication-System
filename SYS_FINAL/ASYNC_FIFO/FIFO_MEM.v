module FIFO_MEM #(parameter DATA_WIDTH=8,parameter addr_size=3)(
   input W_CLK,
   input W_EN,
   input rstn,
   input full,
   input [DATA_WIDTH-1:0] WR_DATA,
   input [addr_size-1:0] waddr,
   input [addr_size-1:0] raddr,
   output [DATA_WIDTH-1:0] RD_DATA
);
        integer i;

localparam DEPTH =1<<addr_size ;

//Dual port RAM
reg [DATA_WIDTH-1:0] FIFO_MEM [0:DEPTH-1];

// ASYNC_read operation 
assign RD_DATA=FIFO_MEM[raddr];

always @(posedge W_CLK or negedge rstn) begin
    if(!rstn) begin
        for (i=0;i<DEPTH;i=i+1) begin
            FIFO_MEM[i]<='b0;
        end
    end else if (W_EN && !full) begin
        FIFO_MEM[waddr]<=WR_DATA;
    end
end

endmodule
