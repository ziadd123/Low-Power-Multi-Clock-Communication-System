module ASYNC_FIFO_TOP #(parameter addr_size=3,parameter ptr_size=addr_size+1,parameter DATA_WIDTH=8)(
    //write domain signals
    input wclk,
    input wrst,
    input winc,
    input [DATA_WIDTH-1:0]wdata,
    output full,

    //read domain signals
    input rclk,
    input rrst,
    input rinc,
    output [DATA_WIDTH-1:0]rdata,
    output empty
);


wire [addr_size-1:0] raddr,waddr;
wire [ptr_size-1:0] gray_wptr,gray_rptr;
wire [ptr_size-1:0] sync_wptr,sync_rptr;

FIFO_WR #(
        .addr_size(addr_size),
        .ptr_size(ptr_size)
    ) u_fifo_wr (
        .wclk(wclk),
        .wrst(wrst),
        .winc(winc),
        .sync_rptr(sync_rptr),
        .full(full),
        .waddr(waddr),
        .gray_wptr(gray_wptr)
    );

    FIFO_RD #(
        .addr_size(addr_size),
        .ptr_size(ptr_size)
    ) u_fifo_rd (
        .rclk(rclk),
        .rrst(rrst),
        .rinc(rinc),
        .sync_wptr(sync_wptr),
        .empty(empty),
        .raddr(raddr),
        .gray_rptr(gray_rptr)
    );

    FIFO_MEM #(
        .DATA_WIDTH(DATA_WIDTH),
        .addr_size(addr_size)
    ) u_fifo_mem (
        .rstn(wrst),
        .full(full),
        .W_CLK(wclk),
        .W_EN(winc && !full),
        .WR_DATA(wdata),
        .waddr(waddr),
        .raddr(raddr),
        .RD_DATA(rdata)
    );

    //  Synchronize Read  Pointer into Write Clock Domain

    DF_SYNC #(
        .WIDTH(ptr_size)
    ) u_sync_r2w (
        .clk(wclk),
        .rst(wrst),
        .ASYNC_DATA(gray_rptr),
        .SYNC_DATA(sync_rptr)
    );

    //  Synchronize Write Pointer into Read Clock Domain
    DF_SYNC #(
        .WIDTH(ptr_size)
    ) u_sync_w2r (
        .clk(rclk),
        .rst(rrst),
        .ASYNC_DATA(gray_wptr),
        .SYNC_DATA(sync_wptr)
    );

endmodule

