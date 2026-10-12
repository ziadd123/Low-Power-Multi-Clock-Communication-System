/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Wed Sep 30 00:54:29 2026
/////////////////////////////////////////////////////////////


module RST_SYNC_NUM_STAGES2_0 ( clk, rst, sync_rst );
  input clk, rst;
  output sync_rst;
  wire   \sync_reg[0] ;

  DFFRQX2M \sync_reg_reg[1]  ( .D(\sync_reg[0] ), .CK(clk), .RN(rst), .Q(
        sync_rst) );
  DFFRQX2M \sync_reg_reg[0]  ( .D(1'b1), .CK(clk), .RN(rst), .Q(\sync_reg[0] )
         );
endmodule


module RST_SYNC_NUM_STAGES2_1 ( clk, rst, sync_rst );
  input clk, rst;
  output sync_rst;
  wire   \sync_reg[0] ;

  DFFRQX2M \sync_reg_reg[1]  ( .D(\sync_reg[0] ), .CK(clk), .RN(rst), .Q(
        sync_rst) );
  DFFRQX2M \sync_reg_reg[0]  ( .D(1'b1), .CK(clk), .RN(rst), .Q(\sync_reg[0] )
         );
endmodule


module DATA_SYNC_bus_width8_N_stage2 ( unsync_bus, bus_enable, dest_rst, 
        dest_clk, enable_pulse, sync_bus );
  input [7:0] unsync_bus;
  output [7:0] sync_bus;
  input bus_enable, dest_rst, dest_clk;
  output enable_pulse;
  wire   pulse_gen_flop, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [1:0] sync_reg;

  DFFRQX2M pulse_gen_flop_reg ( .D(sync_reg[1]), .CK(dest_clk), .RN(dest_rst), 
        .Q(pulse_gen_flop) );
  DFFRQX2M \sync_reg_reg[1]  ( .D(sync_reg[0]), .CK(dest_clk), .RN(dest_rst), 
        .Q(sync_reg[1]) );
  DFFRQX2M \sync_bus_reg[7]  ( .D(n9), .CK(dest_clk), .RN(dest_rst), .Q(
        sync_bus[7]) );
  DFFRQX2M \sync_bus_reg[6]  ( .D(n8), .CK(dest_clk), .RN(dest_rst), .Q(
        sync_bus[6]) );
  DFFRQX2M \sync_bus_reg[5]  ( .D(n7), .CK(dest_clk), .RN(dest_rst), .Q(
        sync_bus[5]) );
  DFFRQX2M \sync_bus_reg[4]  ( .D(n6), .CK(dest_clk), .RN(dest_rst), .Q(
        sync_bus[4]) );
  DFFRQX2M \sync_bus_reg[3]  ( .D(n5), .CK(dest_clk), .RN(dest_rst), .Q(
        sync_bus[3]) );
  DFFRQX2M \sync_bus_reg[2]  ( .D(n4), .CK(dest_clk), .RN(dest_rst), .Q(
        sync_bus[2]) );
  DFFRQX2M enable_pulse_reg ( .D(n10), .CK(dest_clk), .RN(dest_rst), .Q(
        enable_pulse) );
  DFFRQX2M \sync_bus_reg[0]  ( .D(n2), .CK(dest_clk), .RN(dest_rst), .Q(
        sync_bus[0]) );
  DFFRQX2M \sync_bus_reg[1]  ( .D(n3), .CK(dest_clk), .RN(dest_rst), .Q(
        sync_bus[1]) );
  DFFRQX2M \sync_reg_reg[0]  ( .D(bus_enable), .CK(dest_clk), .RN(dest_rst), 
        .Q(sync_reg[0]) );
  INVX2M U3 ( .A(n1), .Y(n10) );
  NAND2BX2M U4 ( .AN(pulse_gen_flop), .B(sync_reg[1]), .Y(n1) );
  AO22X1M U5 ( .A0(unsync_bus[0]), .A1(n10), .B0(sync_bus[0]), .B1(n1), .Y(n2)
         );
  AO22X1M U6 ( .A0(unsync_bus[1]), .A1(n10), .B0(sync_bus[1]), .B1(n1), .Y(n3)
         );
  AO22X1M U7 ( .A0(unsync_bus[2]), .A1(n10), .B0(sync_bus[2]), .B1(n1), .Y(n4)
         );
  AO22X1M U8 ( .A0(unsync_bus[3]), .A1(n10), .B0(sync_bus[3]), .B1(n1), .Y(n5)
         );
  AO22X1M U9 ( .A0(unsync_bus[4]), .A1(n10), .B0(sync_bus[4]), .B1(n1), .Y(n6)
         );
  AO22X1M U10 ( .A0(unsync_bus[5]), .A1(n10), .B0(sync_bus[5]), .B1(n1), .Y(n7) );
  AO22X1M U11 ( .A0(unsync_bus[6]), .A1(n10), .B0(sync_bus[6]), .B1(n1), .Y(n8) );
  AO22X1M U12 ( .A0(unsync_bus[7]), .A1(n10), .B0(sync_bus[7]), .B1(n1), .Y(n9) );
endmodule


module FIFO_WR_addr_size3_ptr_size4 ( wclk, wrst, winc, sync_rptr, full, waddr, 
        gray_wptr );
  input [3:0] sync_rptr;
  output [2:0] waddr;
  output [3:0] gray_wptr;
  input wclk, wrst, winc;
  output full;
  wire   \bin_wptr[3] , N5, N6, N7, N8, N12, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, \r58/carry[3] ,
         \r58/carry[2] , n1;

  DFFRQX2M \bin_wptr_reg[3]  ( .D(n15), .CK(wclk), .RN(wrst), .Q(\bin_wptr[3] ) );
  DFFRQX2M \bin_wptr_reg[2]  ( .D(n17), .CK(wclk), .RN(wrst), .Q(waddr[2]) );
  DFFRQX2M \bin_wptr_reg[0]  ( .D(n18), .CK(wclk), .RN(wrst), .Q(waddr[0]) );
  DFFRQX2M \bin_wptr_reg[1]  ( .D(n19), .CK(wclk), .RN(wrst), .Q(waddr[1]) );
  DFFRQX2M \gray_wptr_reg[0]  ( .D(n20), .CK(wclk), .RN(wrst), .Q(gray_wptr[0]) );
  DFFRQX2M \gray_wptr_reg[1]  ( .D(n16), .CK(wclk), .RN(wrst), .Q(gray_wptr[1]) );
  DFFRQX2M \gray_wptr_reg[2]  ( .D(n14), .CK(wclk), .RN(wrst), .Q(gray_wptr[2]) );
  DFFRQX2M \gray_wptr_reg[3]  ( .D(n13), .CK(wclk), .RN(wrst), .Q(gray_wptr[3]) );
  INVX2M U3 ( .A(n4), .Y(n1) );
  NAND2X2M U4 ( .A(winc), .B(n8), .Y(n4) );
  INVX2M U5 ( .A(n8), .Y(full) );
  NAND4X2M U6 ( .A(n9), .B(n10), .C(n11), .D(n12), .Y(n8) );
  XNOR2X2M U7 ( .A(gray_wptr[1]), .B(sync_rptr[1]), .Y(n9) );
  XNOR2X2M U8 ( .A(gray_wptr[0]), .B(sync_rptr[0]), .Y(n10) );
  CLKXOR2X2M U9 ( .A(sync_rptr[3]), .B(gray_wptr[3]), .Y(n11) );
  OAI2BB2X1M U10 ( .B0(n3), .B1(n4), .A0N(n4), .A1N(gray_wptr[3]), .Y(n13) );
  XNOR2X2M U11 ( .A(N8), .B(N12), .Y(n3) );
  OAI2BB2X1M U12 ( .B0(n5), .B1(n4), .A0N(n4), .A1N(gray_wptr[2]), .Y(n14) );
  XNOR2X2M U13 ( .A(N7), .B(N8), .Y(n5) );
  OAI2BB2X1M U14 ( .B0(n6), .B1(n4), .A0N(n4), .A1N(gray_wptr[1]), .Y(n16) );
  XNOR2X2M U15 ( .A(N6), .B(N7), .Y(n6) );
  OAI2BB2X1M U16 ( .B0(n7), .B1(n4), .A0N(n4), .A1N(gray_wptr[0]), .Y(n20) );
  XNOR2X2M U17 ( .A(N5), .B(N6), .Y(n7) );
  CLKXOR2X2M U18 ( .A(sync_rptr[2]), .B(gray_wptr[2]), .Y(n12) );
  AO22X1M U19 ( .A0(N8), .A1(n1), .B0(\bin_wptr[3] ), .B1(n4), .Y(n15) );
  AO22X1M U20 ( .A0(n1), .A1(N5), .B0(waddr[0]), .B1(n4), .Y(n18) );
  AO22X1M U21 ( .A0(n1), .A1(N7), .B0(waddr[2]), .B1(n4), .Y(n17) );
  AO22X1M U22 ( .A0(n1), .A1(N6), .B0(waddr[1]), .B1(n4), .Y(n19) );
  ADDHX1M U23 ( .A(\bin_wptr[3] ), .B(\r58/carry[3] ), .CO(N12), .S(N8) );
  INVX2M U24 ( .A(waddr[0]), .Y(N5) );
  ADDHX1M U25 ( .A(waddr[1]), .B(waddr[0]), .CO(\r58/carry[2] ), .S(N6) );
  ADDHX1M U26 ( .A(waddr[2]), .B(\r58/carry[2] ), .CO(\r58/carry[3] ), .S(N7)
         );
endmodule


module FIFO_RD_addr_size3_ptr_size4 ( rclk, rrst, rinc, sync_wptr, empty, 
        raddr, gray_rptr );
  input [3:0] sync_wptr;
  output [2:0] raddr;
  output [3:0] gray_rptr;
  input rclk, rrst, rinc;
  output empty;
  wire   \bin_rptr[3] , N3, N4, N5, N6, N10, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, \r58/carry[3] ,
         \r58/carry[2] , n2;

  DFFRQX2M \bin_rptr_reg[3]  ( .D(n15), .CK(rclk), .RN(rrst), .Q(\bin_rptr[3] ) );
  DFFRQX2M \gray_rptr_reg[0]  ( .D(n20), .CK(rclk), .RN(rrst), .Q(gray_rptr[0]) );
  DFFRQX2M \gray_rptr_reg[1]  ( .D(n16), .CK(rclk), .RN(rrst), .Q(gray_rptr[1]) );
  DFFRQX2M \gray_rptr_reg[2]  ( .D(n14), .CK(rclk), .RN(rrst), .Q(gray_rptr[2]) );
  DFFRQX2M \gray_rptr_reg[3]  ( .D(n13), .CK(rclk), .RN(rrst), .Q(gray_rptr[3]) );
  DFFRQX2M \bin_rptr_reg[0]  ( .D(n18), .CK(rclk), .RN(rrst), .Q(raddr[0]) );
  DFFRQX2M \bin_rptr_reg[1]  ( .D(n19), .CK(rclk), .RN(rrst), .Q(raddr[1]) );
  DFFRQX2M \bin_rptr_reg[2]  ( .D(n17), .CK(rclk), .RN(rrst), .Q(raddr[2]) );
  INVX2M U3 ( .A(n8), .Y(empty) );
  INVX2M U4 ( .A(n4), .Y(n2) );
  XNOR2X2M U5 ( .A(gray_rptr[1]), .B(sync_wptr[1]), .Y(n9) );
  NAND4X2M U6 ( .A(n9), .B(n10), .C(n11), .D(n12), .Y(n8) );
  XNOR2X2M U7 ( .A(gray_rptr[3]), .B(sync_wptr[3]), .Y(n11) );
  XNOR2X2M U8 ( .A(gray_rptr[2]), .B(sync_wptr[2]), .Y(n12) );
  XNOR2X2M U9 ( .A(gray_rptr[0]), .B(sync_wptr[0]), .Y(n10) );
  ADDHX1M U10 ( .A(\bin_rptr[3] ), .B(\r58/carry[3] ), .CO(N10), .S(N6) );
  NAND2X2M U11 ( .A(rinc), .B(n8), .Y(n4) );
  OAI2BB2X1M U12 ( .B0(n3), .B1(n4), .A0N(n4), .A1N(gray_rptr[3]), .Y(n13) );
  XNOR2X2M U13 ( .A(N6), .B(N10), .Y(n3) );
  OAI2BB2X1M U14 ( .B0(n5), .B1(n4), .A0N(n4), .A1N(gray_rptr[2]), .Y(n14) );
  XNOR2X2M U15 ( .A(N5), .B(N6), .Y(n5) );
  OAI2BB2X1M U16 ( .B0(n6), .B1(n4), .A0N(n4), .A1N(gray_rptr[1]), .Y(n16) );
  XNOR2X2M U17 ( .A(N4), .B(N5), .Y(n6) );
  OAI2BB2X1M U18 ( .B0(n7), .B1(n4), .A0N(n4), .A1N(gray_rptr[0]), .Y(n20) );
  XNOR2X2M U19 ( .A(N3), .B(N4), .Y(n7) );
  INVX2M U20 ( .A(raddr[0]), .Y(N3) );
  ADDHX1M U21 ( .A(raddr[2]), .B(\r58/carry[2] ), .CO(\r58/carry[3] ), .S(N5)
         );
  ADDHX1M U22 ( .A(raddr[1]), .B(raddr[0]), .CO(\r58/carry[2] ), .S(N4) );
  AO22X1M U23 ( .A0(N6), .A1(n2), .B0(\bin_rptr[3] ), .B1(n4), .Y(n15) );
  AO22X1M U24 ( .A0(n2), .A1(N3), .B0(raddr[0]), .B1(n4), .Y(n18) );
  AO22X1M U25 ( .A0(n2), .A1(N5), .B0(raddr[2]), .B1(n4), .Y(n17) );
  AO22X1M U26 ( .A0(n2), .A1(N4), .B0(raddr[1]), .B1(n4), .Y(n19) );
endmodule


module FIFO_MEM_DATA_WIDTH8_addr_size3 ( W_CLK, W_EN, rstn, full, WR_DATA, 
        waddr, raddr, RD_DATA );
  input [7:0] WR_DATA;
  input [2:0] waddr;
  input [2:0] raddr;
  output [7:0] RD_DATA;
  input W_CLK, W_EN, rstn, full;
  wire   N9, N10, N11, \FIFO_MEM[0][7] , \FIFO_MEM[0][6] , \FIFO_MEM[0][5] ,
         \FIFO_MEM[0][4] , \FIFO_MEM[0][3] , \FIFO_MEM[0][2] ,
         \FIFO_MEM[0][1] , \FIFO_MEM[0][0] , \FIFO_MEM[1][7] ,
         \FIFO_MEM[1][6] , \FIFO_MEM[1][5] , \FIFO_MEM[1][4] ,
         \FIFO_MEM[1][3] , \FIFO_MEM[1][2] , \FIFO_MEM[1][1] ,
         \FIFO_MEM[1][0] , \FIFO_MEM[2][7] , \FIFO_MEM[2][6] ,
         \FIFO_MEM[2][5] , \FIFO_MEM[2][4] , \FIFO_MEM[2][3] ,
         \FIFO_MEM[2][2] , \FIFO_MEM[2][1] , \FIFO_MEM[2][0] ,
         \FIFO_MEM[3][7] , \FIFO_MEM[3][6] , \FIFO_MEM[3][5] ,
         \FIFO_MEM[3][4] , \FIFO_MEM[3][3] , \FIFO_MEM[3][2] ,
         \FIFO_MEM[3][1] , \FIFO_MEM[3][0] , \FIFO_MEM[4][7] ,
         \FIFO_MEM[4][6] , \FIFO_MEM[4][5] , \FIFO_MEM[4][4] ,
         \FIFO_MEM[4][3] , \FIFO_MEM[4][2] , \FIFO_MEM[4][1] ,
         \FIFO_MEM[4][0] , \FIFO_MEM[5][7] , \FIFO_MEM[5][6] ,
         \FIFO_MEM[5][5] , \FIFO_MEM[5][4] , \FIFO_MEM[5][3] ,
         \FIFO_MEM[5][2] , \FIFO_MEM[5][1] , \FIFO_MEM[5][0] ,
         \FIFO_MEM[6][7] , \FIFO_MEM[6][6] , \FIFO_MEM[6][5] ,
         \FIFO_MEM[6][4] , \FIFO_MEM[6][3] , \FIFO_MEM[6][2] ,
         \FIFO_MEM[6][1] , \FIFO_MEM[6][0] , \FIFO_MEM[7][7] ,
         \FIFO_MEM[7][6] , \FIFO_MEM[7][5] , \FIFO_MEM[7][4] ,
         \FIFO_MEM[7][3] , \FIFO_MEM[7][2] , \FIFO_MEM[7][1] ,
         \FIFO_MEM[7][0] , n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n1, n2, n3, n4, n5, n6,
         n7, n8, n9, n10, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134;
  assign N9 = raddr[0];
  assign N10 = raddr[1];
  assign N11 = raddr[2];

  DFFRQX2M \FIFO_MEM_reg[0][7]  ( .D(n85), .CK(W_CLK), .RN(n121), .Q(
        \FIFO_MEM[0][7] ) );
  DFFRQX2M \FIFO_MEM_reg[0][6]  ( .D(n84), .CK(W_CLK), .RN(n121), .Q(
        \FIFO_MEM[0][6] ) );
  DFFRQX2M \FIFO_MEM_reg[0][5]  ( .D(n83), .CK(W_CLK), .RN(n121), .Q(
        \FIFO_MEM[0][5] ) );
  DFFRQX2M \FIFO_MEM_reg[0][4]  ( .D(n82), .CK(W_CLK), .RN(n121), .Q(
        \FIFO_MEM[0][4] ) );
  DFFRQX2M \FIFO_MEM_reg[0][3]  ( .D(n81), .CK(W_CLK), .RN(n121), .Q(
        \FIFO_MEM[0][3] ) );
  DFFRQX2M \FIFO_MEM_reg[0][2]  ( .D(n80), .CK(W_CLK), .RN(n121), .Q(
        \FIFO_MEM[0][2] ) );
  DFFRQX2M \FIFO_MEM_reg[0][1]  ( .D(n79), .CK(W_CLK), .RN(n121), .Q(
        \FIFO_MEM[0][1] ) );
  DFFRQX2M \FIFO_MEM_reg[0][0]  ( .D(n78), .CK(W_CLK), .RN(n121), .Q(
        \FIFO_MEM[0][0] ) );
  DFFRQX2M \FIFO_MEM_reg[1][7]  ( .D(n77), .CK(W_CLK), .RN(n121), .Q(
        \FIFO_MEM[1][7] ) );
  DFFRQX2M \FIFO_MEM_reg[1][6]  ( .D(n76), .CK(W_CLK), .RN(n121), .Q(
        \FIFO_MEM[1][6] ) );
  DFFRQX2M \FIFO_MEM_reg[1][5]  ( .D(n75), .CK(W_CLK), .RN(n121), .Q(
        \FIFO_MEM[1][5] ) );
  DFFRQX2M \FIFO_MEM_reg[1][4]  ( .D(n74), .CK(W_CLK), .RN(n121), .Q(
        \FIFO_MEM[1][4] ) );
  DFFRQX2M \FIFO_MEM_reg[1][3]  ( .D(n73), .CK(W_CLK), .RN(n120), .Q(
        \FIFO_MEM[1][3] ) );
  DFFRQX2M \FIFO_MEM_reg[1][2]  ( .D(n72), .CK(W_CLK), .RN(n120), .Q(
        \FIFO_MEM[1][2] ) );
  DFFRQX2M \FIFO_MEM_reg[1][1]  ( .D(n71), .CK(W_CLK), .RN(n120), .Q(
        \FIFO_MEM[1][1] ) );
  DFFRQX2M \FIFO_MEM_reg[1][0]  ( .D(n70), .CK(W_CLK), .RN(n120), .Q(
        \FIFO_MEM[1][0] ) );
  DFFRQX2M \FIFO_MEM_reg[4][7]  ( .D(n53), .CK(W_CLK), .RN(n119), .Q(
        \FIFO_MEM[4][7] ) );
  DFFRQX2M \FIFO_MEM_reg[4][6]  ( .D(n52), .CK(W_CLK), .RN(n119), .Q(
        \FIFO_MEM[4][6] ) );
  DFFRQX2M \FIFO_MEM_reg[4][5]  ( .D(n51), .CK(W_CLK), .RN(n119), .Q(
        \FIFO_MEM[4][5] ) );
  DFFRQX2M \FIFO_MEM_reg[4][4]  ( .D(n50), .CK(W_CLK), .RN(n119), .Q(
        \FIFO_MEM[4][4] ) );
  DFFRQX2M \FIFO_MEM_reg[4][3]  ( .D(n49), .CK(W_CLK), .RN(n119), .Q(
        \FIFO_MEM[4][3] ) );
  DFFRQX2M \FIFO_MEM_reg[4][2]  ( .D(n48), .CK(W_CLK), .RN(n119), .Q(
        \FIFO_MEM[4][2] ) );
  DFFRQX2M \FIFO_MEM_reg[4][1]  ( .D(n47), .CK(W_CLK), .RN(n118), .Q(
        \FIFO_MEM[4][1] ) );
  DFFRQX2M \FIFO_MEM_reg[4][0]  ( .D(n46), .CK(W_CLK), .RN(n118), .Q(
        \FIFO_MEM[4][0] ) );
  DFFRQX2M \FIFO_MEM_reg[5][7]  ( .D(n45), .CK(W_CLK), .RN(n118), .Q(
        \FIFO_MEM[5][7] ) );
  DFFRQX2M \FIFO_MEM_reg[5][6]  ( .D(n44), .CK(W_CLK), .RN(n118), .Q(
        \FIFO_MEM[5][6] ) );
  DFFRQX2M \FIFO_MEM_reg[5][5]  ( .D(n43), .CK(W_CLK), .RN(n118), .Q(
        \FIFO_MEM[5][5] ) );
  DFFRQX2M \FIFO_MEM_reg[5][4]  ( .D(n42), .CK(W_CLK), .RN(n118), .Q(
        \FIFO_MEM[5][4] ) );
  DFFRQX2M \FIFO_MEM_reg[5][3]  ( .D(n41), .CK(W_CLK), .RN(n118), .Q(
        \FIFO_MEM[5][3] ) );
  DFFRQX2M \FIFO_MEM_reg[5][2]  ( .D(n40), .CK(W_CLK), .RN(n118), .Q(
        \FIFO_MEM[5][2] ) );
  DFFRQX2M \FIFO_MEM_reg[5][1]  ( .D(n39), .CK(W_CLK), .RN(n118), .Q(
        \FIFO_MEM[5][1] ) );
  DFFRQX2M \FIFO_MEM_reg[5][0]  ( .D(n38), .CK(W_CLK), .RN(n118), .Q(
        \FIFO_MEM[5][0] ) );
  DFFRQX2M \FIFO_MEM_reg[6][7]  ( .D(n37), .CK(W_CLK), .RN(n118), .Q(
        \FIFO_MEM[6][7] ) );
  DFFRQX2M \FIFO_MEM_reg[6][6]  ( .D(n36), .CK(W_CLK), .RN(n118), .Q(
        \FIFO_MEM[6][6] ) );
  DFFRQX2M \FIFO_MEM_reg[6][5]  ( .D(n35), .CK(W_CLK), .RN(n118), .Q(
        \FIFO_MEM[6][5] ) );
  DFFRQX2M \FIFO_MEM_reg[6][4]  ( .D(n34), .CK(W_CLK), .RN(n117), .Q(
        \FIFO_MEM[6][4] ) );
  DFFRQX2M \FIFO_MEM_reg[6][3]  ( .D(n33), .CK(W_CLK), .RN(n117), .Q(
        \FIFO_MEM[6][3] ) );
  DFFRQX2M \FIFO_MEM_reg[6][2]  ( .D(n32), .CK(W_CLK), .RN(n117), .Q(
        \FIFO_MEM[6][2] ) );
  DFFRQX2M \FIFO_MEM_reg[6][1]  ( .D(n31), .CK(W_CLK), .RN(n117), .Q(
        \FIFO_MEM[6][1] ) );
  DFFRQX2M \FIFO_MEM_reg[6][0]  ( .D(n30), .CK(W_CLK), .RN(n117), .Q(
        \FIFO_MEM[6][0] ) );
  DFFRQX2M \FIFO_MEM_reg[7][7]  ( .D(n29), .CK(W_CLK), .RN(n117), .Q(
        \FIFO_MEM[7][7] ) );
  DFFRQX2M \FIFO_MEM_reg[7][6]  ( .D(n28), .CK(W_CLK), .RN(n117), .Q(
        \FIFO_MEM[7][6] ) );
  DFFRQX2M \FIFO_MEM_reg[7][5]  ( .D(n27), .CK(W_CLK), .RN(n117), .Q(
        \FIFO_MEM[7][5] ) );
  DFFRQX2M \FIFO_MEM_reg[7][4]  ( .D(n26), .CK(W_CLK), .RN(n117), .Q(
        \FIFO_MEM[7][4] ) );
  DFFRQX2M \FIFO_MEM_reg[7][3]  ( .D(n25), .CK(W_CLK), .RN(n117), .Q(
        \FIFO_MEM[7][3] ) );
  DFFRQX2M \FIFO_MEM_reg[7][2]  ( .D(n24), .CK(W_CLK), .RN(n117), .Q(
        \FIFO_MEM[7][2] ) );
  DFFRQX2M \FIFO_MEM_reg[7][1]  ( .D(n23), .CK(W_CLK), .RN(n117), .Q(
        \FIFO_MEM[7][1] ) );
  DFFRQX2M \FIFO_MEM_reg[7][0]  ( .D(n22), .CK(W_CLK), .RN(n117), .Q(
        \FIFO_MEM[7][0] ) );
  DFFRQX2M \FIFO_MEM_reg[2][7]  ( .D(n69), .CK(W_CLK), .RN(n120), .Q(
        \FIFO_MEM[2][7] ) );
  DFFRQX2M \FIFO_MEM_reg[2][6]  ( .D(n68), .CK(W_CLK), .RN(n120), .Q(
        \FIFO_MEM[2][6] ) );
  DFFRQX2M \FIFO_MEM_reg[2][5]  ( .D(n67), .CK(W_CLK), .RN(n120), .Q(
        \FIFO_MEM[2][5] ) );
  DFFRQX2M \FIFO_MEM_reg[2][4]  ( .D(n66), .CK(W_CLK), .RN(n120), .Q(
        \FIFO_MEM[2][4] ) );
  DFFRQX2M \FIFO_MEM_reg[2][3]  ( .D(n65), .CK(W_CLK), .RN(n120), .Q(
        \FIFO_MEM[2][3] ) );
  DFFRQX2M \FIFO_MEM_reg[2][2]  ( .D(n64), .CK(W_CLK), .RN(n120), .Q(
        \FIFO_MEM[2][2] ) );
  DFFRQX2M \FIFO_MEM_reg[2][1]  ( .D(n63), .CK(W_CLK), .RN(n120), .Q(
        \FIFO_MEM[2][1] ) );
  DFFRQX2M \FIFO_MEM_reg[2][0]  ( .D(n62), .CK(W_CLK), .RN(n120), .Q(
        \FIFO_MEM[2][0] ) );
  DFFRQX2M \FIFO_MEM_reg[3][7]  ( .D(n61), .CK(W_CLK), .RN(n120), .Q(
        \FIFO_MEM[3][7] ) );
  DFFRQX2M \FIFO_MEM_reg[3][6]  ( .D(n60), .CK(W_CLK), .RN(n119), .Q(
        \FIFO_MEM[3][6] ) );
  DFFRQX2M \FIFO_MEM_reg[3][5]  ( .D(n59), .CK(W_CLK), .RN(n119), .Q(
        \FIFO_MEM[3][5] ) );
  DFFRQX2M \FIFO_MEM_reg[3][4]  ( .D(n58), .CK(W_CLK), .RN(n119), .Q(
        \FIFO_MEM[3][4] ) );
  DFFRQX2M \FIFO_MEM_reg[3][3]  ( .D(n57), .CK(W_CLK), .RN(n119), .Q(
        \FIFO_MEM[3][3] ) );
  DFFRQX2M \FIFO_MEM_reg[3][2]  ( .D(n56), .CK(W_CLK), .RN(n119), .Q(
        \FIFO_MEM[3][2] ) );
  DFFRQX2M \FIFO_MEM_reg[3][1]  ( .D(n55), .CK(W_CLK), .RN(n119), .Q(
        \FIFO_MEM[3][1] ) );
  DFFRQX2M \FIFO_MEM_reg[3][0]  ( .D(n54), .CK(W_CLK), .RN(n119), .Q(
        \FIFO_MEM[3][0] ) );
  BUFX2M U2 ( .A(n20), .Y(n122) );
  BUFX2M U3 ( .A(n17), .Y(n124) );
  BUFX2M U4 ( .A(n19), .Y(n123) );
  BUFX2M U5 ( .A(n115), .Y(n117) );
  BUFX2M U6 ( .A(n115), .Y(n118) );
  BUFX2M U7 ( .A(n115), .Y(n119) );
  BUFX2M U8 ( .A(n116), .Y(n120) );
  BUFX2M U9 ( .A(n116), .Y(n121) );
  NOR2BX2M U10 ( .AN(W_EN), .B(full), .Y(n16) );
  BUFX2M U11 ( .A(rstn), .Y(n115) );
  BUFX2M U12 ( .A(rstn), .Y(n116) );
  NAND3X2M U13 ( .A(n126), .B(n125), .C(n12), .Y(n15) );
  NAND3X2M U14 ( .A(n126), .B(n125), .C(n18), .Y(n21) );
  INVX2M U15 ( .A(WR_DATA[0]), .Y(n127) );
  INVX2M U16 ( .A(WR_DATA[1]), .Y(n128) );
  INVX2M U17 ( .A(WR_DATA[2]), .Y(n129) );
  INVX2M U18 ( .A(WR_DATA[3]), .Y(n130) );
  INVX2M U19 ( .A(WR_DATA[4]), .Y(n131) );
  INVX2M U20 ( .A(WR_DATA[5]), .Y(n132) );
  INVX2M U21 ( .A(WR_DATA[6]), .Y(n133) );
  INVX2M U22 ( .A(WR_DATA[7]), .Y(n134) );
  NOR2X2M U23 ( .A(n112), .B(n114), .Y(n108) );
  NAND3X2M U24 ( .A(n12), .B(n126), .C(waddr[1]), .Y(n13) );
  NAND3X2M U25 ( .A(n12), .B(n125), .C(waddr[0]), .Y(n14) );
  NAND3X2M U26 ( .A(waddr[0]), .B(n12), .C(waddr[1]), .Y(n11) );
  NOR2BX2M U27 ( .AN(n16), .B(waddr[2]), .Y(n18) );
  OAI2BB2X1M U28 ( .B0(n11), .B1(n127), .A0N(\FIFO_MEM[7][0] ), .A1N(n11), .Y(
        n22) );
  OAI2BB2X1M U29 ( .B0(n11), .B1(n128), .A0N(\FIFO_MEM[7][1] ), .A1N(n11), .Y(
        n23) );
  OAI2BB2X1M U30 ( .B0(n11), .B1(n129), .A0N(\FIFO_MEM[7][2] ), .A1N(n11), .Y(
        n24) );
  OAI2BB2X1M U31 ( .B0(n11), .B1(n130), .A0N(\FIFO_MEM[7][3] ), .A1N(n11), .Y(
        n25) );
  OAI2BB2X1M U32 ( .B0(n11), .B1(n131), .A0N(\FIFO_MEM[7][4] ), .A1N(n11), .Y(
        n26) );
  OAI2BB2X1M U33 ( .B0(n11), .B1(n132), .A0N(\FIFO_MEM[7][5] ), .A1N(n11), .Y(
        n27) );
  OAI2BB2X1M U34 ( .B0(n11), .B1(n133), .A0N(\FIFO_MEM[7][6] ), .A1N(n11), .Y(
        n28) );
  OAI2BB2X1M U35 ( .B0(n11), .B1(n134), .A0N(\FIFO_MEM[7][7] ), .A1N(n11), .Y(
        n29) );
  OAI2BB2X1M U36 ( .B0(n127), .B1(n13), .A0N(\FIFO_MEM[6][0] ), .A1N(n13), .Y(
        n30) );
  OAI2BB2X1M U37 ( .B0(n128), .B1(n13), .A0N(\FIFO_MEM[6][1] ), .A1N(n13), .Y(
        n31) );
  OAI2BB2X1M U38 ( .B0(n129), .B1(n13), .A0N(\FIFO_MEM[6][2] ), .A1N(n13), .Y(
        n32) );
  OAI2BB2X1M U39 ( .B0(n130), .B1(n13), .A0N(\FIFO_MEM[6][3] ), .A1N(n13), .Y(
        n33) );
  OAI2BB2X1M U40 ( .B0(n131), .B1(n13), .A0N(\FIFO_MEM[6][4] ), .A1N(n13), .Y(
        n34) );
  OAI2BB2X1M U41 ( .B0(n132), .B1(n13), .A0N(\FIFO_MEM[6][5] ), .A1N(n13), .Y(
        n35) );
  OAI2BB2X1M U42 ( .B0(n133), .B1(n13), .A0N(\FIFO_MEM[6][6] ), .A1N(n13), .Y(
        n36) );
  OAI2BB2X1M U43 ( .B0(n134), .B1(n13), .A0N(\FIFO_MEM[6][7] ), .A1N(n13), .Y(
        n37) );
  OAI2BB2X1M U44 ( .B0(n127), .B1(n14), .A0N(\FIFO_MEM[5][0] ), .A1N(n14), .Y(
        n38) );
  OAI2BB2X1M U45 ( .B0(n128), .B1(n14), .A0N(\FIFO_MEM[5][1] ), .A1N(n14), .Y(
        n39) );
  OAI2BB2X1M U46 ( .B0(n129), .B1(n14), .A0N(\FIFO_MEM[5][2] ), .A1N(n14), .Y(
        n40) );
  OAI2BB2X1M U47 ( .B0(n130), .B1(n14), .A0N(\FIFO_MEM[5][3] ), .A1N(n14), .Y(
        n41) );
  OAI2BB2X1M U48 ( .B0(n131), .B1(n14), .A0N(\FIFO_MEM[5][4] ), .A1N(n14), .Y(
        n42) );
  OAI2BB2X1M U49 ( .B0(n132), .B1(n14), .A0N(\FIFO_MEM[5][5] ), .A1N(n14), .Y(
        n43) );
  OAI2BB2X1M U50 ( .B0(n133), .B1(n14), .A0N(\FIFO_MEM[5][6] ), .A1N(n14), .Y(
        n44) );
  OAI2BB2X1M U51 ( .B0(n134), .B1(n14), .A0N(\FIFO_MEM[5][7] ), .A1N(n14), .Y(
        n45) );
  OAI2BB2X1M U52 ( .B0(n127), .B1(n21), .A0N(\FIFO_MEM[0][0] ), .A1N(n21), .Y(
        n78) );
  OAI2BB2X1M U53 ( .B0(n128), .B1(n21), .A0N(\FIFO_MEM[0][1] ), .A1N(n21), .Y(
        n79) );
  OAI2BB2X1M U54 ( .B0(n129), .B1(n21), .A0N(\FIFO_MEM[0][2] ), .A1N(n21), .Y(
        n80) );
  OAI2BB2X1M U55 ( .B0(n130), .B1(n21), .A0N(\FIFO_MEM[0][3] ), .A1N(n21), .Y(
        n81) );
  OAI2BB2X1M U56 ( .B0(n131), .B1(n21), .A0N(\FIFO_MEM[0][4] ), .A1N(n21), .Y(
        n82) );
  OAI2BB2X1M U57 ( .B0(n132), .B1(n21), .A0N(\FIFO_MEM[0][5] ), .A1N(n21), .Y(
        n83) );
  OAI2BB2X1M U58 ( .B0(n133), .B1(n21), .A0N(\FIFO_MEM[0][6] ), .A1N(n21), .Y(
        n84) );
  OAI2BB2X1M U59 ( .B0(n134), .B1(n21), .A0N(\FIFO_MEM[0][7] ), .A1N(n21), .Y(
        n85) );
  OAI2BB2X1M U60 ( .B0(n127), .B1(n15), .A0N(\FIFO_MEM[4][0] ), .A1N(n15), .Y(
        n46) );
  OAI2BB2X1M U61 ( .B0(n128), .B1(n15), .A0N(\FIFO_MEM[4][1] ), .A1N(n15), .Y(
        n47) );
  OAI2BB2X1M U62 ( .B0(n129), .B1(n15), .A0N(\FIFO_MEM[4][2] ), .A1N(n15), .Y(
        n48) );
  OAI2BB2X1M U63 ( .B0(n130), .B1(n15), .A0N(\FIFO_MEM[4][3] ), .A1N(n15), .Y(
        n49) );
  OAI2BB2X1M U64 ( .B0(n131), .B1(n15), .A0N(\FIFO_MEM[4][4] ), .A1N(n15), .Y(
        n50) );
  OAI2BB2X1M U65 ( .B0(n132), .B1(n15), .A0N(\FIFO_MEM[4][5] ), .A1N(n15), .Y(
        n51) );
  OAI2BB2X1M U66 ( .B0(n133), .B1(n15), .A0N(\FIFO_MEM[4][6] ), .A1N(n15), .Y(
        n52) );
  OAI2BB2X1M U67 ( .B0(n134), .B1(n15), .A0N(\FIFO_MEM[4][7] ), .A1N(n15), .Y(
        n53) );
  OAI2BB2X1M U68 ( .B0(n127), .B1(n124), .A0N(\FIFO_MEM[3][0] ), .A1N(n124), 
        .Y(n54) );
  OAI2BB2X1M U69 ( .B0(n128), .B1(n124), .A0N(\FIFO_MEM[3][1] ), .A1N(n124), 
        .Y(n55) );
  OAI2BB2X1M U70 ( .B0(n129), .B1(n124), .A0N(\FIFO_MEM[3][2] ), .A1N(n124), 
        .Y(n56) );
  OAI2BB2X1M U71 ( .B0(n130), .B1(n124), .A0N(\FIFO_MEM[3][3] ), .A1N(n124), 
        .Y(n57) );
  OAI2BB2X1M U72 ( .B0(n131), .B1(n124), .A0N(\FIFO_MEM[3][4] ), .A1N(n124), 
        .Y(n58) );
  OAI2BB2X1M U73 ( .B0(n132), .B1(n124), .A0N(\FIFO_MEM[3][5] ), .A1N(n124), 
        .Y(n59) );
  OAI2BB2X1M U74 ( .B0(n133), .B1(n124), .A0N(\FIFO_MEM[3][6] ), .A1N(n124), 
        .Y(n60) );
  OAI2BB2X1M U75 ( .B0(n134), .B1(n124), .A0N(\FIFO_MEM[3][7] ), .A1N(n124), 
        .Y(n61) );
  OAI2BB2X1M U76 ( .B0(n127), .B1(n123), .A0N(\FIFO_MEM[2][0] ), .A1N(n123), 
        .Y(n62) );
  OAI2BB2X1M U77 ( .B0(n128), .B1(n123), .A0N(\FIFO_MEM[2][1] ), .A1N(n123), 
        .Y(n63) );
  OAI2BB2X1M U78 ( .B0(n129), .B1(n123), .A0N(\FIFO_MEM[2][2] ), .A1N(n123), 
        .Y(n64) );
  OAI2BB2X1M U79 ( .B0(n130), .B1(n123), .A0N(\FIFO_MEM[2][3] ), .A1N(n123), 
        .Y(n65) );
  OAI2BB2X1M U80 ( .B0(n131), .B1(n123), .A0N(\FIFO_MEM[2][4] ), .A1N(n123), 
        .Y(n66) );
  OAI2BB2X1M U81 ( .B0(n132), .B1(n123), .A0N(\FIFO_MEM[2][5] ), .A1N(n123), 
        .Y(n67) );
  OAI2BB2X1M U82 ( .B0(n133), .B1(n123), .A0N(\FIFO_MEM[2][6] ), .A1N(n123), 
        .Y(n68) );
  OAI2BB2X1M U83 ( .B0(n134), .B1(n123), .A0N(\FIFO_MEM[2][7] ), .A1N(n123), 
        .Y(n69) );
  OAI2BB2X1M U84 ( .B0(n127), .B1(n122), .A0N(\FIFO_MEM[1][0] ), .A1N(n122), 
        .Y(n70) );
  OAI2BB2X1M U85 ( .B0(n128), .B1(n122), .A0N(\FIFO_MEM[1][1] ), .A1N(n122), 
        .Y(n71) );
  OAI2BB2X1M U86 ( .B0(n129), .B1(n122), .A0N(\FIFO_MEM[1][2] ), .A1N(n122), 
        .Y(n72) );
  OAI2BB2X1M U87 ( .B0(n130), .B1(n122), .A0N(\FIFO_MEM[1][3] ), .A1N(n122), 
        .Y(n73) );
  OAI2BB2X1M U88 ( .B0(n131), .B1(n122), .A0N(\FIFO_MEM[1][4] ), .A1N(n122), 
        .Y(n74) );
  OAI2BB2X1M U89 ( .B0(n132), .B1(n122), .A0N(\FIFO_MEM[1][5] ), .A1N(n122), 
        .Y(n75) );
  OAI2BB2X1M U90 ( .B0(n133), .B1(n122), .A0N(\FIFO_MEM[1][6] ), .A1N(n122), 
        .Y(n76) );
  OAI2BB2X1M U91 ( .B0(n134), .B1(n122), .A0N(\FIFO_MEM[1][7] ), .A1N(n122), 
        .Y(n77) );
  AND2X2M U92 ( .A(waddr[2]), .B(n16), .Y(n12) );
  NAND3X2M U93 ( .A(waddr[1]), .B(waddr[0]), .C(n18), .Y(n17) );
  NAND3X2M U94 ( .A(waddr[1]), .B(n126), .C(n18), .Y(n19) );
  NAND3X2M U95 ( .A(waddr[0]), .B(n125), .C(n18), .Y(n20) );
  INVX2M U96 ( .A(waddr[1]), .Y(n125) );
  INVX2M U97 ( .A(waddr[0]), .Y(n126) );
  NOR2X2M U98 ( .A(N10), .B(N11), .Y(n105) );
  NOR2X2M U99 ( .A(n114), .B(N11), .Y(n106) );
  NOR2X2M U100 ( .A(n112), .B(N10), .Y(n109) );
  INVX2M U101 ( .A(N11), .Y(n112) );
  INVX2M U102 ( .A(N10), .Y(n114) );
  INVX2M U103 ( .A(N9), .Y(n113) );
  AO22X1M U104 ( .A0(\FIFO_MEM[3][0] ), .A1(n106), .B0(\FIFO_MEM[1][0] ), .B1(
        n105), .Y(n1) );
  AOI221XLM U105 ( .A0(\FIFO_MEM[5][0] ), .A1(n109), .B0(\FIFO_MEM[7][0] ), 
        .B1(n108), .C0(n1), .Y(n4) );
  AO22X1M U106 ( .A0(\FIFO_MEM[2][0] ), .A1(n106), .B0(\FIFO_MEM[0][0] ), .B1(
        n105), .Y(n2) );
  AOI221XLM U107 ( .A0(\FIFO_MEM[4][0] ), .A1(n109), .B0(\FIFO_MEM[6][0] ), 
        .B1(n108), .C0(n2), .Y(n3) );
  OAI22X1M U108 ( .A0(n113), .A1(n4), .B0(N9), .B1(n3), .Y(RD_DATA[0]) );
  AO22X1M U109 ( .A0(\FIFO_MEM[3][1] ), .A1(n106), .B0(\FIFO_MEM[1][1] ), .B1(
        n105), .Y(n5) );
  AOI221XLM U110 ( .A0(\FIFO_MEM[5][1] ), .A1(n109), .B0(\FIFO_MEM[7][1] ), 
        .B1(n108), .C0(n5), .Y(n8) );
  AO22X1M U111 ( .A0(\FIFO_MEM[2][1] ), .A1(n106), .B0(\FIFO_MEM[0][1] ), .B1(
        n105), .Y(n6) );
  AOI221XLM U112 ( .A0(\FIFO_MEM[4][1] ), .A1(n109), .B0(\FIFO_MEM[6][1] ), 
        .B1(n108), .C0(n6), .Y(n7) );
  OAI22X1M U113 ( .A0(n113), .A1(n8), .B0(N9), .B1(n7), .Y(RD_DATA[1]) );
  AO22X1M U114 ( .A0(\FIFO_MEM[3][2] ), .A1(n106), .B0(\FIFO_MEM[1][2] ), .B1(
        n105), .Y(n9) );
  AOI221XLM U115 ( .A0(\FIFO_MEM[5][2] ), .A1(n109), .B0(\FIFO_MEM[7][2] ), 
        .B1(n108), .C0(n9), .Y(n87) );
  AO22X1M U116 ( .A0(\FIFO_MEM[2][2] ), .A1(n106), .B0(\FIFO_MEM[0][2] ), .B1(
        n105), .Y(n10) );
  AOI221XLM U117 ( .A0(\FIFO_MEM[4][2] ), .A1(n109), .B0(\FIFO_MEM[6][2] ), 
        .B1(n108), .C0(n10), .Y(n86) );
  OAI22X1M U118 ( .A0(n113), .A1(n87), .B0(N9), .B1(n86), .Y(RD_DATA[2]) );
  AO22X1M U119 ( .A0(\FIFO_MEM[3][3] ), .A1(n106), .B0(\FIFO_MEM[1][3] ), .B1(
        n105), .Y(n88) );
  AOI221XLM U120 ( .A0(\FIFO_MEM[5][3] ), .A1(n109), .B0(\FIFO_MEM[7][3] ), 
        .B1(n108), .C0(n88), .Y(n91) );
  AO22X1M U121 ( .A0(\FIFO_MEM[2][3] ), .A1(n106), .B0(\FIFO_MEM[0][3] ), .B1(
        n105), .Y(n89) );
  AOI221XLM U122 ( .A0(\FIFO_MEM[4][3] ), .A1(n109), .B0(\FIFO_MEM[6][3] ), 
        .B1(n108), .C0(n89), .Y(n90) );
  OAI22X1M U123 ( .A0(n113), .A1(n91), .B0(N9), .B1(n90), .Y(RD_DATA[3]) );
  AO22X1M U124 ( .A0(\FIFO_MEM[3][4] ), .A1(n106), .B0(\FIFO_MEM[1][4] ), .B1(
        n105), .Y(n92) );
  AOI221XLM U125 ( .A0(\FIFO_MEM[5][4] ), .A1(n109), .B0(\FIFO_MEM[7][4] ), 
        .B1(n108), .C0(n92), .Y(n95) );
  AO22X1M U126 ( .A0(\FIFO_MEM[2][4] ), .A1(n106), .B0(\FIFO_MEM[0][4] ), .B1(
        n105), .Y(n93) );
  AOI221XLM U127 ( .A0(\FIFO_MEM[4][4] ), .A1(n109), .B0(\FIFO_MEM[6][4] ), 
        .B1(n108), .C0(n93), .Y(n94) );
  OAI22X1M U128 ( .A0(n113), .A1(n95), .B0(N9), .B1(n94), .Y(RD_DATA[4]) );
  AO22X1M U129 ( .A0(\FIFO_MEM[3][5] ), .A1(n106), .B0(\FIFO_MEM[1][5] ), .B1(
        n105), .Y(n96) );
  AOI221XLM U130 ( .A0(\FIFO_MEM[5][5] ), .A1(n109), .B0(\FIFO_MEM[7][5] ), 
        .B1(n108), .C0(n96), .Y(n99) );
  AO22X1M U131 ( .A0(\FIFO_MEM[2][5] ), .A1(n106), .B0(\FIFO_MEM[0][5] ), .B1(
        n105), .Y(n97) );
  AOI221XLM U132 ( .A0(\FIFO_MEM[4][5] ), .A1(n109), .B0(\FIFO_MEM[6][5] ), 
        .B1(n108), .C0(n97), .Y(n98) );
  OAI22X1M U133 ( .A0(n113), .A1(n99), .B0(N9), .B1(n98), .Y(RD_DATA[5]) );
  AO22X1M U134 ( .A0(\FIFO_MEM[3][6] ), .A1(n106), .B0(\FIFO_MEM[1][6] ), .B1(
        n105), .Y(n100) );
  AOI221XLM U135 ( .A0(\FIFO_MEM[5][6] ), .A1(n109), .B0(\FIFO_MEM[7][6] ), 
        .B1(n108), .C0(n100), .Y(n103) );
  AO22X1M U136 ( .A0(\FIFO_MEM[2][6] ), .A1(n106), .B0(\FIFO_MEM[0][6] ), .B1(
        n105), .Y(n101) );
  AOI221XLM U137 ( .A0(\FIFO_MEM[4][6] ), .A1(n109), .B0(\FIFO_MEM[6][6] ), 
        .B1(n108), .C0(n101), .Y(n102) );
  OAI22X1M U138 ( .A0(n113), .A1(n103), .B0(N9), .B1(n102), .Y(RD_DATA[6]) );
  AO22X1M U139 ( .A0(\FIFO_MEM[3][7] ), .A1(n106), .B0(\FIFO_MEM[1][7] ), .B1(
        n105), .Y(n104) );
  AOI221XLM U140 ( .A0(\FIFO_MEM[5][7] ), .A1(n109), .B0(\FIFO_MEM[7][7] ), 
        .B1(n108), .C0(n104), .Y(n111) );
  AO22X1M U141 ( .A0(\FIFO_MEM[2][7] ), .A1(n106), .B0(\FIFO_MEM[0][7] ), .B1(
        n105), .Y(n107) );
  AOI221XLM U142 ( .A0(\FIFO_MEM[4][7] ), .A1(n109), .B0(\FIFO_MEM[6][7] ), 
        .B1(n108), .C0(n107), .Y(n110) );
  OAI22X1M U143 ( .A0(n111), .A1(n113), .B0(N9), .B1(n110), .Y(RD_DATA[7]) );
endmodule


module DF_SYNC_WIDTH4_0 ( clk, rst, ASYNC_DATA, SYNC_DATA );
  input [3:0] ASYNC_DATA;
  output [3:0] SYNC_DATA;
  input clk, rst;

  wire   [3:0] sync_reg;

  DFFRQX2M \SYNC_DATA_reg[1]  ( .D(sync_reg[1]), .CK(clk), .RN(rst), .Q(
        SYNC_DATA[1]) );
  DFFRQX2M \SYNC_DATA_reg[0]  ( .D(sync_reg[0]), .CK(clk), .RN(rst), .Q(
        SYNC_DATA[0]) );
  DFFRQX2M \SYNC_DATA_reg[3]  ( .D(sync_reg[3]), .CK(clk), .RN(rst), .Q(
        SYNC_DATA[3]) );
  DFFRQX2M \SYNC_DATA_reg[2]  ( .D(sync_reg[2]), .CK(clk), .RN(rst), .Q(
        SYNC_DATA[2]) );
  DFFRQX2M \sync_reg_reg[3]  ( .D(ASYNC_DATA[3]), .CK(clk), .RN(rst), .Q(
        sync_reg[3]) );
  DFFRQX2M \sync_reg_reg[2]  ( .D(ASYNC_DATA[2]), .CK(clk), .RN(rst), .Q(
        sync_reg[2]) );
  DFFRQX2M \sync_reg_reg[1]  ( .D(ASYNC_DATA[1]), .CK(clk), .RN(rst), .Q(
        sync_reg[1]) );
  DFFRQX2M \sync_reg_reg[0]  ( .D(ASYNC_DATA[0]), .CK(clk), .RN(rst), .Q(
        sync_reg[0]) );
endmodule


module DF_SYNC_WIDTH4_1 ( clk, rst, ASYNC_DATA, SYNC_DATA );
  input [3:0] ASYNC_DATA;
  output [3:0] SYNC_DATA;
  input clk, rst;

  wire   [3:0] sync_reg;

  DFFRQX2M \SYNC_DATA_reg[3]  ( .D(sync_reg[3]), .CK(clk), .RN(rst), .Q(
        SYNC_DATA[3]) );
  DFFRQX2M \SYNC_DATA_reg[2]  ( .D(sync_reg[2]), .CK(clk), .RN(rst), .Q(
        SYNC_DATA[2]) );
  DFFRQX2M \SYNC_DATA_reg[1]  ( .D(sync_reg[1]), .CK(clk), .RN(rst), .Q(
        SYNC_DATA[1]) );
  DFFRQX2M \SYNC_DATA_reg[0]  ( .D(sync_reg[0]), .CK(clk), .RN(rst), .Q(
        SYNC_DATA[0]) );
  DFFRQX2M \sync_reg_reg[3]  ( .D(ASYNC_DATA[3]), .CK(clk), .RN(rst), .Q(
        sync_reg[3]) );
  DFFRQX2M \sync_reg_reg[2]  ( .D(ASYNC_DATA[2]), .CK(clk), .RN(rst), .Q(
        sync_reg[2]) );
  DFFRQX2M \sync_reg_reg[1]  ( .D(ASYNC_DATA[1]), .CK(clk), .RN(rst), .Q(
        sync_reg[1]) );
  DFFRQX2M \sync_reg_reg[0]  ( .D(ASYNC_DATA[0]), .CK(clk), .RN(rst), .Q(
        sync_reg[0]) );
endmodule


module ASYNC_FIFO_TOP_addr_size3_ptr_size4_DATA_WIDTH8 ( wclk, wrst, winc, 
        wdata, full, rclk, rrst, rinc, rdata, empty );
  input [7:0] wdata;
  output [7:0] rdata;
  input wclk, wrst, winc, rclk, rrst, rinc;
  output full, empty;
  wire   _0_net_;
  wire   [3:0] sync_rptr;
  wire   [2:0] waddr;
  wire   [3:0] gray_wptr;
  wire   [3:0] sync_wptr;
  wire   [2:0] raddr;
  wire   [3:0] gray_rptr;

  FIFO_WR_addr_size3_ptr_size4 u_fifo_wr ( .wclk(wclk), .wrst(wrst), .winc(
        winc), .sync_rptr(sync_rptr), .full(full), .waddr(waddr), .gray_wptr(
        gray_wptr) );
  FIFO_RD_addr_size3_ptr_size4 u_fifo_rd ( .rclk(rclk), .rrst(rrst), .rinc(
        rinc), .sync_wptr(sync_wptr), .empty(empty), .raddr(raddr), 
        .gray_rptr(gray_rptr) );
  FIFO_MEM_DATA_WIDTH8_addr_size3 u_fifo_mem ( .W_CLK(wclk), .W_EN(_0_net_), 
        .rstn(wrst), .full(full), .WR_DATA(wdata), .waddr(waddr), .raddr(raddr), .RD_DATA(rdata) );
  DF_SYNC_WIDTH4_0 u_sync_r2w ( .clk(wclk), .rst(wrst), .ASYNC_DATA(gray_rptr), 
        .SYNC_DATA(sync_rptr) );
  DF_SYNC_WIDTH4_1 u_sync_w2r ( .clk(rclk), .rst(rrst), .ASYNC_DATA(gray_wptr), 
        .SYNC_DATA(sync_wptr) );
  NOR2BX2M U1 ( .AN(winc), .B(full), .Y(_0_net_) );
endmodule


module PUL_GEN ( rst, clk, lvl_sig, pulse_sig );
  input rst, clk, lvl_sig;
  output pulse_sig;
  wire   pls_flop, rcv_flop;

  DFFRQX2M rcv_flop_reg ( .D(lvl_sig), .CK(clk), .RN(rst), .Q(rcv_flop) );
  DFFRQX2M pls_flop_reg ( .D(rcv_flop), .CK(clk), .RN(rst), .Q(pls_flop) );
  NOR2BX2M U3 ( .AN(rcv_flop), .B(pls_flop), .Y(pulse_sig) );
endmodule


module CLK_DIV_0_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  INVX2M U1 ( .A(A[0]), .Y(SUM[0]) );
  CLKXOR2X2M U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module CLK_DIV_0 ( i_ref_clk, i_rst_n, i_clk_en, i_div_ratio, o_div_clk );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst_n, i_clk_en;
  output o_div_clk;
  wire   div_clk_reg, N9, N10, N11, N12, N13, N14, N15, N16, N18, N19, N20,
         N21, N22, N23, N24, N25, N41, N42, N43, N44, N45, N46, N47, N48, N85,
         N86, N87, N88, N89, N90, N91, N92, n19, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42;
  wire   [7:0] counter;

  CLK_DIV_0_DW01_inc_0 r77 ( .A(counter), .SUM({N48, N47, N46, N45, N44, N43, 
        N42, N41}) );
  DFFRQX2M div_clk_reg_reg ( .D(n19), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        div_clk_reg) );
  DFFRQX2M \counter_reg[7]  ( .D(N92), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[7]) );
  DFFRQX2M \counter_reg[0]  ( .D(N85), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[0]) );
  DFFRQX2M \counter_reg[3]  ( .D(N88), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[3]) );
  DFFRQX2M \counter_reg[2]  ( .D(N87), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[2]) );
  DFFRQX2M \counter_reg[6]  ( .D(N91), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[6]) );
  DFFRQX2M \counter_reg[5]  ( .D(N90), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[5]) );
  DFFRQX2M \counter_reg[4]  ( .D(N89), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[4]) );
  DFFRQX2M \counter_reg[1]  ( .D(N86), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[1]) );
  MX2X2M U3 ( .A(i_ref_clk), .B(div_clk_reg), .S0(n42), .Y(o_div_clk) );
  INVX2M U4 ( .A(i_div_ratio[1]), .Y(N9) );
  INVX2M U5 ( .A(i_div_ratio[0]), .Y(N18) );
  INVX2M U6 ( .A(i_div_ratio[5]), .Y(n12) );
  NAND2BX1M U7 ( .AN(i_div_ratio[2]), .B(N9), .Y(n1) );
  OAI2BB1X1M U8 ( .A0N(i_div_ratio[1]), .A1N(i_div_ratio[2]), .B0(n1), .Y(N10)
         );
  OR2X1M U9 ( .A(n1), .B(i_div_ratio[3]), .Y(n2) );
  OAI2BB1X1M U10 ( .A0N(n1), .A1N(i_div_ratio[3]), .B0(n2), .Y(N11) );
  OR2X1M U11 ( .A(n2), .B(i_div_ratio[4]), .Y(n3) );
  OAI2BB1X1M U12 ( .A0N(n2), .A1N(i_div_ratio[4]), .B0(n3), .Y(N12) );
  OR2X1M U13 ( .A(n3), .B(i_div_ratio[5]), .Y(n4) );
  OAI2BB1X1M U14 ( .A0N(n3), .A1N(i_div_ratio[5]), .B0(n4), .Y(N13) );
  XNOR2X1M U15 ( .A(i_div_ratio[6]), .B(n4), .Y(N14) );
  NOR3X1M U16 ( .A(i_div_ratio[6]), .B(i_div_ratio[7]), .C(n4), .Y(N16) );
  OAI21X1M U17 ( .A0(i_div_ratio[6]), .A1(n4), .B0(i_div_ratio[7]), .Y(n5) );
  NAND2BX1M U18 ( .AN(N16), .B(n5), .Y(N15) );
  NAND2BX1M U19 ( .AN(i_div_ratio[1]), .B(N18), .Y(n6) );
  OAI2BB1X1M U20 ( .A0N(i_div_ratio[0]), .A1N(i_div_ratio[1]), .B0(n6), .Y(N19) );
  OR2X1M U21 ( .A(n6), .B(i_div_ratio[2]), .Y(n7) );
  OAI2BB1X1M U22 ( .A0N(n6), .A1N(i_div_ratio[2]), .B0(n7), .Y(N20) );
  OR2X1M U23 ( .A(n7), .B(i_div_ratio[3]), .Y(n8) );
  OAI2BB1X1M U24 ( .A0N(n7), .A1N(i_div_ratio[3]), .B0(n8), .Y(N21) );
  NOR2X1M U25 ( .A(n8), .B(i_div_ratio[4]), .Y(n9) );
  AO21XLM U26 ( .A0(n8), .A1(i_div_ratio[4]), .B0(n9), .Y(N22) );
  CLKNAND2X2M U27 ( .A(n9), .B(n12), .Y(n10) );
  OAI21X1M U28 ( .A0(n9), .A1(n12), .B0(n10), .Y(N23) );
  XNOR2X1M U29 ( .A(i_div_ratio[6]), .B(n10), .Y(N24) );
  NOR2X1M U30 ( .A(i_div_ratio[6]), .B(n10), .Y(n11) );
  CLKXOR2X2M U31 ( .A(i_div_ratio[7]), .B(n11), .Y(N25) );
  MXI2X1M U32 ( .A(n13), .B(n14), .S0(div_clk_reg), .Y(n19) );
  CLKNAND2X2M U33 ( .A(n42), .B(n14), .Y(n13) );
  NAND3X1M U34 ( .A(n15), .B(n16), .C(n42), .Y(n14) );
  NOR2BX1M U35 ( .AN(N48), .B(n17), .Y(N92) );
  NOR2BX1M U36 ( .AN(N47), .B(n17), .Y(N91) );
  NOR2BX1M U37 ( .AN(N46), .B(n17), .Y(N90) );
  NOR2BX1M U38 ( .AN(N45), .B(n17), .Y(N89) );
  NOR2BX1M U39 ( .AN(N44), .B(n17), .Y(N88) );
  NOR2BX1M U40 ( .AN(N43), .B(n17), .Y(N87) );
  NOR2BX1M U41 ( .AN(N42), .B(n17), .Y(N86) );
  NOR2BX1M U42 ( .AN(N41), .B(n17), .Y(N85) );
  CLKNAND2X2M U43 ( .A(n18), .B(n42), .Y(n17) );
  AOI21BX1M U44 ( .A0(n20), .A1(n21), .B0N(i_clk_en), .Y(n42) );
  NOR4X1M U45 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n21) );
  NOR3X1M U46 ( .A(i_div_ratio[1]), .B(i_div_ratio[3]), .C(i_div_ratio[2]), 
        .Y(n20) );
  CLKMX2X2M U47 ( .A(i_div_ratio[0]), .B(n15), .S0(n16), .Y(n18) );
  CLKNAND2X2M U48 ( .A(n22), .B(n23), .Y(n16) );
  NOR4X1M U49 ( .A(n24), .B(n25), .C(n26), .D(n27), .Y(n23) );
  CLKXOR2X2M U50 ( .A(counter[0]), .B(N9), .Y(n27) );
  CLKXOR2X2M U51 ( .A(counter[7]), .B(N16), .Y(n26) );
  CLKXOR2X2M U52 ( .A(counter[2]), .B(N11), .Y(n25) );
  CLKXOR2X2M U53 ( .A(counter[1]), .B(N10), .Y(n24) );
  NOR4X1M U54 ( .A(n28), .B(n29), .C(n30), .D(n31), .Y(n22) );
  CLKXOR2X2M U55 ( .A(counter[6]), .B(N15), .Y(n31) );
  CLKXOR2X2M U56 ( .A(counter[5]), .B(N14), .Y(n30) );
  CLKXOR2X2M U57 ( .A(counter[4]), .B(N13), .Y(n29) );
  CLKXOR2X2M U58 ( .A(counter[3]), .B(N12), .Y(n28) );
  NAND4X1M U59 ( .A(n32), .B(n33), .C(n34), .D(n35), .Y(n15) );
  NOR4X1M U60 ( .A(n36), .B(n37), .C(n38), .D(n39), .Y(n35) );
  CLKXOR2X2M U61 ( .A(counter[7]), .B(N25), .Y(n39) );
  CLKXOR2X2M U62 ( .A(counter[6]), .B(N24), .Y(n38) );
  CLKXOR2X2M U63 ( .A(counter[5]), .B(N23), .Y(n37) );
  CLKXOR2X2M U64 ( .A(counter[4]), .B(N22), .Y(n36) );
  NOR3BX1M U65 ( .AN(i_div_ratio[0]), .B(n40), .C(n41), .Y(n34) );
  CLKXOR2X2M U66 ( .A(counter[1]), .B(N19), .Y(n41) );
  CLKXOR2X2M U67 ( .A(counter[0]), .B(N18), .Y(n40) );
  XNOR2X1M U68 ( .A(counter[2]), .B(N20), .Y(n33) );
  XNOR2X1M U69 ( .A(counter[3]), .B(N21), .Y(n32) );
endmodule


module CLKDIV_MUX ( IN, OUT );
  input [5:0] IN;
  output [7:0] OUT;
  wire   n5, n6, n7, n8, n9, n1, n2, n3, n4;
  assign OUT[4] = 1'b0;
  assign OUT[5] = 1'b0;
  assign OUT[6] = 1'b0;
  assign OUT[7] = 1'b0;

  INVX2M U3 ( .A(IN[2]), .Y(n1) );
  NAND4BX1M U4 ( .AN(IN[4]), .B(IN[3]), .C(n1), .D(n2), .Y(n6) );
  NAND4BX1M U5 ( .AN(IN[3]), .B(IN[4]), .C(n1), .D(n2), .Y(n7) );
  NOR3X2M U6 ( .A(n7), .B(IN[1]), .C(IN[0]), .Y(OUT[1]) );
  OAI211X2M U7 ( .A0(n8), .A1(n9), .B0(n4), .C0(n3), .Y(OUT[0]) );
  NAND2X2M U8 ( .A(n7), .B(n6), .Y(n9) );
  NOR4X1M U9 ( .A(IN[5]), .B(IN[4]), .C(IN[3]), .D(n1), .Y(n8) );
  NOR4X1M U10 ( .A(n5), .B(IN[3]), .C(IN[5]), .D(IN[4]), .Y(OUT[3]) );
  NAND3X2M U11 ( .A(n4), .B(n3), .C(IN[2]), .Y(n5) );
  NOR3X2M U12 ( .A(n6), .B(IN[1]), .C(IN[0]), .Y(OUT[2]) );
  INVX2M U13 ( .A(IN[1]), .Y(n3) );
  INVX2M U14 ( .A(IN[0]), .Y(n4) );
  INVX2M U15 ( .A(IN[5]), .Y(n2) );
endmodule


module CLK_DIV_1_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  INVX2M U1 ( .A(A[0]), .Y(SUM[0]) );
  CLKXOR2X2M U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module CLK_DIV_1 ( i_ref_clk, i_rst_n, i_clk_en, i_div_ratio, o_div_clk );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst_n, i_clk_en;
  output o_div_clk;
  wire   div_clk_reg, N9, N10, N11, N12, N13, N14, N15, N16, N18, N19, N20,
         N21, N22, N23, N24, N25, N41, N42, N43, N44, N45, N46, N47, N48, N85,
         N86, N87, N88, N89, N90, N91, N92, n1, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n17, n18, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43;
  wire   [7:0] counter;

  CLK_DIV_1_DW01_inc_0 r77 ( .A(counter), .SUM({N48, N47, N46, N45, N44, N43, 
        N42, N41}) );
  DFFRQX2M div_clk_reg_reg ( .D(n43), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        div_clk_reg) );
  DFFRQX2M \counter_reg[7]  ( .D(N92), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[7]) );
  DFFRQX2M \counter_reg[0]  ( .D(N85), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[0]) );
  DFFRQX2M \counter_reg[3]  ( .D(N88), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[3]) );
  DFFRQX2M \counter_reg[2]  ( .D(N87), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[2]) );
  DFFRQX2M \counter_reg[6]  ( .D(N91), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[6]) );
  DFFRQX2M \counter_reg[5]  ( .D(N90), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[5]) );
  DFFRQX2M \counter_reg[4]  ( .D(N89), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[4]) );
  DFFRQX2M \counter_reg[1]  ( .D(N86), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[1]) );
  INVX2M U3 ( .A(i_div_ratio[1]), .Y(N9) );
  INVX2M U4 ( .A(i_div_ratio[0]), .Y(N18) );
  MX2X2M U5 ( .A(i_ref_clk), .B(div_clk_reg), .S0(n42), .Y(o_div_clk) );
  INVX2M U6 ( .A(i_div_ratio[5]), .Y(n12) );
  NAND2BX1M U7 ( .AN(i_div_ratio[2]), .B(N9), .Y(n1) );
  OAI2BB1X1M U8 ( .A0N(i_div_ratio[1]), .A1N(i_div_ratio[2]), .B0(n1), .Y(N10)
         );
  OR2X1M U9 ( .A(n1), .B(i_div_ratio[3]), .Y(n2) );
  OAI2BB1X1M U10 ( .A0N(n1), .A1N(i_div_ratio[3]), .B0(n2), .Y(N11) );
  OR2X1M U11 ( .A(n2), .B(i_div_ratio[4]), .Y(n3) );
  OAI2BB1X1M U12 ( .A0N(n2), .A1N(i_div_ratio[4]), .B0(n3), .Y(N12) );
  OR2X1M U13 ( .A(n3), .B(i_div_ratio[5]), .Y(n4) );
  OAI2BB1X1M U14 ( .A0N(n3), .A1N(i_div_ratio[5]), .B0(n4), .Y(N13) );
  XNOR2X1M U15 ( .A(i_div_ratio[6]), .B(n4), .Y(N14) );
  NOR3X1M U16 ( .A(i_div_ratio[6]), .B(i_div_ratio[7]), .C(n4), .Y(N16) );
  OAI21X1M U17 ( .A0(i_div_ratio[6]), .A1(n4), .B0(i_div_ratio[7]), .Y(n5) );
  NAND2BX1M U18 ( .AN(N16), .B(n5), .Y(N15) );
  NAND2BX1M U19 ( .AN(i_div_ratio[1]), .B(N18), .Y(n6) );
  OAI2BB1X1M U20 ( .A0N(i_div_ratio[0]), .A1N(i_div_ratio[1]), .B0(n6), .Y(N19) );
  OR2X1M U21 ( .A(n6), .B(i_div_ratio[2]), .Y(n7) );
  OAI2BB1X1M U22 ( .A0N(n6), .A1N(i_div_ratio[2]), .B0(n7), .Y(N20) );
  OR2X1M U23 ( .A(n7), .B(i_div_ratio[3]), .Y(n8) );
  OAI2BB1X1M U24 ( .A0N(n7), .A1N(i_div_ratio[3]), .B0(n8), .Y(N21) );
  NOR2X1M U25 ( .A(n8), .B(i_div_ratio[4]), .Y(n9) );
  AO21XLM U26 ( .A0(n8), .A1(i_div_ratio[4]), .B0(n9), .Y(N22) );
  CLKNAND2X2M U27 ( .A(n9), .B(n12), .Y(n10) );
  OAI21X1M U28 ( .A0(n9), .A1(n12), .B0(n10), .Y(N23) );
  XNOR2X1M U29 ( .A(i_div_ratio[6]), .B(n10), .Y(N24) );
  NOR2X1M U30 ( .A(i_div_ratio[6]), .B(n10), .Y(n11) );
  CLKXOR2X2M U31 ( .A(i_div_ratio[7]), .B(n11), .Y(N25) );
  MXI2X1M U32 ( .A(n13), .B(n14), .S0(div_clk_reg), .Y(n43) );
  CLKNAND2X2M U33 ( .A(n42), .B(n14), .Y(n13) );
  NAND3X1M U34 ( .A(n15), .B(n16), .C(n42), .Y(n14) );
  NOR2BX1M U35 ( .AN(N48), .B(n17), .Y(N92) );
  NOR2BX1M U36 ( .AN(N47), .B(n17), .Y(N91) );
  NOR2BX1M U37 ( .AN(N46), .B(n17), .Y(N90) );
  NOR2BX1M U38 ( .AN(N45), .B(n17), .Y(N89) );
  NOR2BX1M U39 ( .AN(N44), .B(n17), .Y(N88) );
  NOR2BX1M U40 ( .AN(N43), .B(n17), .Y(N87) );
  NOR2BX1M U41 ( .AN(N42), .B(n17), .Y(N86) );
  NOR2BX1M U42 ( .AN(N41), .B(n17), .Y(N85) );
  CLKNAND2X2M U43 ( .A(n18), .B(n42), .Y(n17) );
  AOI21BX1M U44 ( .A0(n20), .A1(n21), .B0N(i_clk_en), .Y(n42) );
  NOR4X1M U45 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n21) );
  NOR3X1M U46 ( .A(i_div_ratio[1]), .B(i_div_ratio[3]), .C(i_div_ratio[2]), 
        .Y(n20) );
  CLKMX2X2M U47 ( .A(i_div_ratio[0]), .B(n15), .S0(n16), .Y(n18) );
  CLKNAND2X2M U48 ( .A(n22), .B(n23), .Y(n16) );
  NOR4X1M U49 ( .A(n24), .B(n25), .C(n26), .D(n27), .Y(n23) );
  CLKXOR2X2M U50 ( .A(counter[0]), .B(N9), .Y(n27) );
  CLKXOR2X2M U51 ( .A(counter[7]), .B(N16), .Y(n26) );
  CLKXOR2X2M U52 ( .A(counter[2]), .B(N11), .Y(n25) );
  CLKXOR2X2M U53 ( .A(counter[1]), .B(N10), .Y(n24) );
  NOR4X1M U54 ( .A(n28), .B(n29), .C(n30), .D(n31), .Y(n22) );
  CLKXOR2X2M U55 ( .A(counter[6]), .B(N15), .Y(n31) );
  CLKXOR2X2M U56 ( .A(counter[5]), .B(N14), .Y(n30) );
  CLKXOR2X2M U57 ( .A(counter[4]), .B(N13), .Y(n29) );
  CLKXOR2X2M U58 ( .A(counter[3]), .B(N12), .Y(n28) );
  NAND4X1M U59 ( .A(n32), .B(n33), .C(n34), .D(n35), .Y(n15) );
  NOR4X1M U60 ( .A(n36), .B(n37), .C(n38), .D(n39), .Y(n35) );
  CLKXOR2X2M U61 ( .A(counter[7]), .B(N25), .Y(n39) );
  CLKXOR2X2M U62 ( .A(counter[6]), .B(N24), .Y(n38) );
  CLKXOR2X2M U63 ( .A(counter[5]), .B(N23), .Y(n37) );
  CLKXOR2X2M U64 ( .A(counter[4]), .B(N22), .Y(n36) );
  NOR3BX1M U65 ( .AN(i_div_ratio[0]), .B(n40), .C(n41), .Y(n34) );
  CLKXOR2X2M U66 ( .A(counter[1]), .B(N19), .Y(n41) );
  CLKXOR2X2M U67 ( .A(counter[0]), .B(N18), .Y(n40) );
  XNOR2X1M U68 ( .A(counter[2]), .B(N20), .Y(n33) );
  XNOR2X1M U69 ( .A(counter[3]), .B(N21), .Y(n32) );
endmodule


module serializer ( P_DATA, ser_en, clk, rst, data_valid, ser_data, ser_done
 );
  input [7:0] P_DATA;
  input ser_en, clk, rst, data_valid;
  output ser_data, ser_done;
  wire   N23, n1, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n2, n3, n4, n28;
  wire   [7:1] shift_reg;
  wire   [2:0] counter;
  assign ser_done = N23;

  DFFRQX2M \shift_reg_reg[6]  ( .D(n19), .CK(clk), .RN(rst), .Q(shift_reg[6])
         );
  DFFRQX2M \shift_reg_reg[5]  ( .D(n20), .CK(clk), .RN(rst), .Q(shift_reg[5])
         );
  DFFRQX2M \shift_reg_reg[4]  ( .D(n21), .CK(clk), .RN(rst), .Q(shift_reg[4])
         );
  DFFRQX2M \shift_reg_reg[3]  ( .D(n22), .CK(clk), .RN(rst), .Q(shift_reg[3])
         );
  DFFRQX2M \shift_reg_reg[2]  ( .D(n23), .CK(clk), .RN(rst), .Q(shift_reg[2])
         );
  DFFRQX2M \shift_reg_reg[1]  ( .D(n24), .CK(clk), .RN(rst), .Q(shift_reg[1])
         );
  DFFRQX2M \shift_reg_reg[7]  ( .D(n18), .CK(clk), .RN(rst), .Q(shift_reg[7])
         );
  DFFRQX2M \counter_reg[1]  ( .D(n26), .CK(clk), .RN(rst), .Q(counter[1]) );
  DFFRQX2M \counter_reg[0]  ( .D(n27), .CK(clk), .RN(rst), .Q(counter[0]) );
  DFFRX1M \counter_reg[2]  ( .D(n25), .CK(clk), .RN(rst), .QN(n1) );
  DFFRQX2M \shift_reg_reg[0]  ( .D(n17), .CK(clk), .RN(rst), .Q(ser_data) );
  NOR2X2M U3 ( .A(n2), .B(n7), .Y(n5) );
  AND2X2M U4 ( .A(data_valid), .B(n3), .Y(n7) );
  INVX2M U5 ( .A(n2), .Y(n3) );
  AOI21X2M U6 ( .A0(n4), .A1(n2), .B0(n5), .Y(n16) );
  BUFX2M U7 ( .A(ser_en), .Y(n2) );
  OAI32X1M U8 ( .A0(n4), .A1(counter[1]), .A2(n3), .B0(n16), .B1(n28), .Y(n26)
         );
  OAI2BB2X1M U9 ( .B0(counter[0]), .B1(n3), .A0N(n5), .A1N(counter[0]), .Y(n27) );
  OAI21X2M U10 ( .A0(n14), .A1(n1), .B0(n15), .Y(n25) );
  NAND4X2M U11 ( .A(counter[1]), .B(counter[0]), .C(n2), .D(n1), .Y(n15) );
  AOI21BX2M U12 ( .A0(n2), .A1(n28), .B0N(n16), .Y(n14) );
  OAI2BB1X2M U13 ( .A0N(n5), .A1N(shift_reg[6]), .B0(n8), .Y(n19) );
  AOI22X1M U14 ( .A0(P_DATA[6]), .A1(n7), .B0(shift_reg[7]), .B1(n2), .Y(n8)
         );
  OAI2BB1X2M U15 ( .A0N(n5), .A1N(shift_reg[2]), .B0(n12), .Y(n23) );
  AOI22X1M U16 ( .A0(P_DATA[2]), .A1(n7), .B0(shift_reg[3]), .B1(n2), .Y(n12)
         );
  OAI2BB1X2M U17 ( .A0N(n5), .A1N(shift_reg[3]), .B0(n11), .Y(n22) );
  AOI22X1M U18 ( .A0(P_DATA[3]), .A1(n7), .B0(shift_reg[4]), .B1(n2), .Y(n11)
         );
  OAI2BB1X2M U19 ( .A0N(ser_data), .A1N(n5), .B0(n6), .Y(n17) );
  AOI22X1M U20 ( .A0(P_DATA[0]), .A1(n7), .B0(shift_reg[1]), .B1(n2), .Y(n6)
         );
  OAI2BB1X2M U21 ( .A0N(n5), .A1N(shift_reg[4]), .B0(n10), .Y(n21) );
  AOI22X1M U22 ( .A0(P_DATA[4]), .A1(n7), .B0(shift_reg[5]), .B1(n2), .Y(n10)
         );
  OAI2BB1X2M U23 ( .A0N(shift_reg[1]), .A1N(n5), .B0(n13), .Y(n24) );
  AOI22X1M U24 ( .A0(P_DATA[1]), .A1(n7), .B0(shift_reg[2]), .B1(n2), .Y(n13)
         );
  OAI2BB1X2M U25 ( .A0N(n5), .A1N(shift_reg[5]), .B0(n9), .Y(n20) );
  AOI22X1M U26 ( .A0(P_DATA[5]), .A1(n7), .B0(shift_reg[6]), .B1(n2), .Y(n9)
         );
  AO22X1M U27 ( .A0(n5), .A1(shift_reg[7]), .B0(P_DATA[7]), .B1(n7), .Y(n18)
         );
  NOR3X2M U28 ( .A(n1), .B(n4), .C(n28), .Y(N23) );
  INVX2M U29 ( .A(counter[0]), .Y(n4) );
  INVX2M U30 ( .A(counter[1]), .Y(n28) );
endmodule


module PAR_CALC ( P_DATA, PAR_TYP, clk, rst, data_valid, PAR_BIT );
  input [7:0] P_DATA;
  input PAR_TYP, clk, rst, data_valid;
  output PAR_BIT;
  wire   n1, n3, n4, n5, n6, n7, n2;

  DFFRQX2M PAR_BIT_reg ( .D(n7), .CK(clk), .RN(rst), .Q(PAR_BIT) );
  XNOR2X2M U2 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n5) );
  XOR3XLM U3 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n6), .Y(n3) );
  CLKXOR2X2M U4 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n6) );
  OAI2BB2X1M U5 ( .B0(n1), .B1(n2), .A0N(PAR_BIT), .A1N(n2), .Y(n7) );
  INVX2M U6 ( .A(data_valid), .Y(n2) );
  XOR3XLM U7 ( .A(n3), .B(PAR_TYP), .C(n4), .Y(n1) );
  XOR3XLM U8 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n5), .Y(n4) );
endmodule


module MUX ( sel, start_bit, stop_bit, PAR_BIT, ser_data, TX_OUT );
  input [1:0] sel;
  input start_bit, stop_bit, PAR_BIT, ser_data;
  output TX_OUT;
  wire   n2, n3, n1;

  OAI2B2X2M U1 ( .A1N(sel[1]), .A0(n2), .B0(sel[1]), .B1(n3), .Y(TX_OUT) );
  AOI22X1M U2 ( .A0(start_bit), .A1(n1), .B0(ser_data), .B1(sel[0]), .Y(n3) );
  AOI22X1M U3 ( .A0(PAR_BIT), .A1(n1), .B0(stop_bit), .B1(sel[0]), .Y(n2) );
  INVX2M U4 ( .A(sel[0]), .Y(n1) );
endmodule


module FSM ( data_valid, PAR_EN, ser_done, clk, rst, sel, busy, ser_en );
  output [1:0] sel;
  input data_valid, PAR_EN, ser_done, clk, rst;
  output busy, ser_en;
  wire   n3, n4, n5, n6, n1, n2;
  wire   [2:0] current_state;
  wire   [2:0] next_state;

  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(clk), .RN(rst), .Q(
        current_state[2]) );
  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(clk), .RN(rst), .Q(
        current_state[1]) );
  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(clk), .RN(rst), .Q(
        current_state[0]) );
  NAND2X2M U3 ( .A(n3), .B(n2), .Y(sel[0]) );
  NAND3BX2M U4 ( .AN(n3), .B(n5), .C(n2), .Y(busy) );
  AO21XLM U5 ( .A0(n2), .A1(n3), .B0(ser_en), .Y(next_state[1]) );
  XNOR2X2M U6 ( .A(n1), .B(current_state[1]), .Y(n3) );
  INVX2M U7 ( .A(current_state[0]), .Y(n1) );
  NAND2X2M U8 ( .A(current_state[0]), .B(n2), .Y(sel[1]) );
  INVX2M U9 ( .A(current_state[2]), .Y(n2) );
  NOR2X2M U10 ( .A(n5), .B(current_state[2]), .Y(ser_en) );
  NAND2X2M U11 ( .A(current_state[1]), .B(current_state[0]), .Y(n5) );
  OAI22X1M U12 ( .A0(ser_done), .A1(sel[1]), .B0(current_state[1]), .B1(n6), 
        .Y(next_state[0]) );
  AOI21BX2M U13 ( .A0(data_valid), .A1(n2), .B0N(sel[1]), .Y(n6) );
  NOR3BX2M U14 ( .AN(current_state[1]), .B(current_state[2]), .C(n4), .Y(
        next_state[2]) );
  AOI2B1X1M U15 ( .A1N(PAR_EN), .A0(ser_done), .B0(n1), .Y(n4) );
endmodule


module TX_TOP ( P_DATA, data_valid, PAR_EN, PAR_TYP, clk, rst, busy, TX_OUT );
  input [7:0] P_DATA;
  input data_valid, PAR_EN, PAR_TYP, clk, rst;
  output busy, TX_OUT;
  wire   ser_en, ser_data, ser_done, PAR_BIT;
  wire   [1:0] sel;

  serializer u_serializer ( .P_DATA(P_DATA), .ser_en(ser_en), .clk(clk), .rst(
        rst), .data_valid(data_valid), .ser_data(ser_data), .ser_done(ser_done) );
  PAR_CALC u_PAR_CALC ( .P_DATA(P_DATA), .PAR_TYP(PAR_TYP), .clk(clk), .rst(
        rst), .data_valid(data_valid), .PAR_BIT(PAR_BIT) );
  MUX U_MUX ( .sel(sel), .start_bit(1'b0), .stop_bit(1'b1), .PAR_BIT(PAR_BIT), 
        .ser_data(ser_data), .TX_OUT(TX_OUT) );
  FSM U_FSM ( .data_valid(data_valid), .PAR_EN(PAR_EN), .ser_done(ser_done), 
        .clk(clk), .rst(rst), .sel(sel), .busy(busy), .ser_en(ser_en) );
endmodule


module data_sampling ( prescale, clk, rst, RX_IN, data_samp_en, edge_cnt, 
        sampled_bit );
  input [5:0] prescale;
  input [5:0] edge_cnt;
  input clk, rst, RX_IN, data_samp_en;
  output sampled_bit;
  wire   N6, N7, N8, N9, N10, N11, N15, N16, N17, N18, N19, n22, n23, n24,
         \add_30/carry[4] , \add_30/carry[3] , \add_30/carry[2] , n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37;
  wire   [1:0] samples;

  DFFRQX2M \samples_reg[1]  ( .D(n24), .CK(clk), .RN(rst), .Q(samples[1]) );
  DFFRQX2M \samples_reg[0]  ( .D(n23), .CK(clk), .RN(rst), .Q(samples[0]) );
  DFFRQX2M sampled_bit_reg ( .D(n22), .CK(clk), .RN(rst), .Q(sampled_bit) );
  CLKXOR2X2M U3 ( .A(edge_cnt[0]), .B(prescale[1]), .Y(n25) );
  INVX2M U4 ( .A(prescale[1]), .Y(N6) );
  ADDHX1M U5 ( .A(prescale[3]), .B(\add_30/carry[2] ), .CO(\add_30/carry[3] ), 
        .S(N16) );
  ADDHX1M U6 ( .A(prescale[4]), .B(\add_30/carry[3] ), .CO(\add_30/carry[4] ), 
        .S(N17) );
  ADDHX1M U7 ( .A(prescale[2]), .B(prescale[1]), .CO(\add_30/carry[2] ), .S(
        N15) );
  ADDHX1M U8 ( .A(prescale[5]), .B(\add_30/carry[4] ), .CO(N19), .S(N18) );
  NAND2BX1M U9 ( .AN(prescale[2]), .B(N6), .Y(n1) );
  OAI2BB1X1M U10 ( .A0N(prescale[1]), .A1N(prescale[2]), .B0(n1), .Y(N7) );
  OR2X1M U11 ( .A(n1), .B(prescale[3]), .Y(n2) );
  OAI2BB1X1M U12 ( .A0N(n1), .A1N(prescale[3]), .B0(n2), .Y(N8) );
  XNOR2X1M U13 ( .A(prescale[4]), .B(n2), .Y(N9) );
  NOR3X1M U14 ( .A(prescale[4]), .B(prescale[5]), .C(n2), .Y(N11) );
  OAI21X1M U15 ( .A0(prescale[4]), .A1(n2), .B0(prescale[5]), .Y(n3) );
  NAND2BX1M U16 ( .AN(N11), .B(n3), .Y(N10) );
  NOR2X1M U17 ( .A(n4), .B(n5), .Y(n24) );
  MXI2X1M U18 ( .A(samples[1]), .B(RX_IN), .S0(n6), .Y(n5) );
  NOR2X1M U19 ( .A(n7), .B(n8), .Y(n6) );
  NOR2X1M U20 ( .A(n4), .B(n9), .Y(n23) );
  MXI2X1M U21 ( .A(samples[0]), .B(RX_IN), .S0(n7), .Y(n9) );
  NOR2X1M U22 ( .A(n4), .B(n10), .Y(n22) );
  MXI2X1M U23 ( .A(sampled_bit), .B(n11), .S0(n12), .Y(n10) );
  NOR4BX1M U24 ( .AN(n8), .B(n13), .C(n14), .D(n7), .Y(n12) );
  AND4X1M U25 ( .A(n15), .B(n16), .C(n17), .D(n18), .Y(n7) );
  NOR3X1M U26 ( .A(n19), .B(n20), .C(n21), .Y(n18) );
  CLKXOR2X2M U27 ( .A(edge_cnt[4]), .B(N10), .Y(n21) );
  CLKXOR2X2M U28 ( .A(edge_cnt[0]), .B(N6), .Y(n20) );
  CLKXOR2X2M U29 ( .A(edge_cnt[5]), .B(N11), .Y(n19) );
  XNOR2X1M U30 ( .A(edge_cnt[2]), .B(N8), .Y(n17) );
  XNOR2X1M U31 ( .A(edge_cnt[3]), .B(N9), .Y(n16) );
  XNOR2X1M U32 ( .A(edge_cnt[1]), .B(N7), .Y(n15) );
  CLKNAND2X2M U33 ( .A(n25), .B(n26), .Y(n14) );
  XNOR2X1M U34 ( .A(edge_cnt[4]), .B(N18), .Y(n26) );
  NAND4X1M U35 ( .A(n27), .B(n28), .C(n29), .D(n30), .Y(n13) );
  XNOR2X1M U36 ( .A(edge_cnt[1]), .B(N15), .Y(n30) );
  XNOR2X1M U37 ( .A(edge_cnt[5]), .B(N19), .Y(n29) );
  XNOR2X1M U38 ( .A(edge_cnt[2]), .B(N16), .Y(n28) );
  XNOR2X1M U39 ( .A(edge_cnt[3]), .B(N17), .Y(n27) );
  NAND4X1M U40 ( .A(n31), .B(n32), .C(n33), .D(n34), .Y(n8) );
  NOR3X1M U41 ( .A(n35), .B(edge_cnt[5]), .C(n36), .Y(n34) );
  CLKXOR2X2M U42 ( .A(prescale[1]), .B(edge_cnt[0]), .Y(n36) );
  CLKXOR2X2M U43 ( .A(prescale[5]), .B(edge_cnt[4]), .Y(n35) );
  XNOR2X1M U44 ( .A(edge_cnt[2]), .B(prescale[3]), .Y(n33) );
  XNOR2X1M U45 ( .A(edge_cnt[3]), .B(prescale[4]), .Y(n32) );
  XNOR2X1M U46 ( .A(edge_cnt[1]), .B(prescale[2]), .Y(n31) );
  OAI2BB1X1M U47 ( .A0N(RX_IN), .A1N(samples[0]), .B0(n37), .Y(n11) );
  OAI21X1M U48 ( .A0(RX_IN), .A1(samples[0]), .B0(samples[1]), .Y(n37) );
  CLKINVX1M U49 ( .A(data_samp_en), .Y(n4) );
endmodule


module edge_bit_counter ( clk, rst, counter_en, prescale, edge_cnt, bit_cnt );
  input [5:0] prescale;
  output [5:0] edge_cnt;
  output [3:0] bit_cnt;
  input clk, rst, counter_en;
  wire   N7, N8, N9, N10, N11, N12, N13, N20, N21, N22, N23, N31, N32, N33,
         N34, N35, N36, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         \add_20/carry[5] , \add_20/carry[4] , \add_20/carry[3] ,
         \add_20/carry[2] , n1, n2, n3, n4, n5, n6, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29;

  DFFRQX2M \bit_cnt_reg[3]  ( .D(n16), .CK(clk), .RN(rst), .Q(bit_cnt[3]) );
  DFFRQX2M \bit_cnt_reg[1]  ( .D(n14), .CK(clk), .RN(rst), .Q(bit_cnt[1]) );
  DFFRQX2M \bit_cnt_reg[2]  ( .D(n13), .CK(clk), .RN(rst), .Q(bit_cnt[2]) );
  DFFRQX2M \bit_cnt_reg[0]  ( .D(n15), .CK(clk), .RN(rst), .Q(bit_cnt[0]) );
  DFFRQX2M \edge_cnt_reg[5]  ( .D(N36), .CK(clk), .RN(rst), .Q(edge_cnt[5]) );
  DFFRQX2M \edge_cnt_reg[3]  ( .D(N34), .CK(clk), .RN(rst), .Q(edge_cnt[3]) );
  DFFRQX2M \edge_cnt_reg[2]  ( .D(N33), .CK(clk), .RN(rst), .Q(edge_cnt[2]) );
  DFFRQX2M \edge_cnt_reg[4]  ( .D(N35), .CK(clk), .RN(rst), .Q(edge_cnt[4]) );
  DFFRQX2M \edge_cnt_reg[0]  ( .D(N31), .CK(clk), .RN(rst), .Q(edge_cnt[0]) );
  DFFRQX2M \edge_cnt_reg[1]  ( .D(N32), .CK(clk), .RN(rst), .Q(edge_cnt[1]) );
  INVX2M U3 ( .A(n10), .Y(n26) );
  INVX2M U4 ( .A(counter_en), .Y(n27) );
  NOR2X2M U5 ( .A(n27), .B(N13), .Y(n10) );
  NOR2BX2M U6 ( .AN(N20), .B(n26), .Y(N32) );
  NOR2BX2M U7 ( .AN(N21), .B(n26), .Y(N33) );
  NOR2BX2M U8 ( .AN(N22), .B(n26), .Y(N34) );
  NOR2BX2M U9 ( .AN(N23), .B(n26), .Y(N35) );
  OAI32X1M U10 ( .A0(n27), .A1(bit_cnt[0]), .A2(n10), .B0(n28), .B1(n26), .Y(
        n15) );
  OAI22X1M U11 ( .A0(n29), .A1(n26), .B0(n9), .B1(n27), .Y(n14) );
  AOI32X1M U12 ( .A0(n26), .A1(n29), .A2(bit_cnt[0]), .B0(bit_cnt[1]), .B1(n28), .Y(n9) );
  INVX2M U13 ( .A(bit_cnt[1]), .Y(n29) );
  AND3X2M U14 ( .A(N13), .B(bit_cnt[1]), .C(bit_cnt[0]), .Y(n8) );
  NOR2X2M U15 ( .A(n1), .B(n26), .Y(N36) );
  XNOR2X2M U16 ( .A(\add_20/carry[5] ), .B(edge_cnt[5]), .Y(n1) );
  NOR2X2M U17 ( .A(edge_cnt[0]), .B(n26), .Y(N31) );
  NOR2X2M U18 ( .A(n11), .B(n27), .Y(n16) );
  CLKXOR2X2M U19 ( .A(n12), .B(bit_cnt[3]), .Y(n11) );
  NAND2X2M U20 ( .A(n8), .B(bit_cnt[2]), .Y(n12) );
  NOR2X2M U21 ( .A(n7), .B(n27), .Y(n13) );
  XNOR2X2M U22 ( .A(n8), .B(bit_cnt[2]), .Y(n7) );
  ADDHX1M U23 ( .A(edge_cnt[1]), .B(edge_cnt[0]), .CO(\add_20/carry[2] ), .S(
        N20) );
  ADDHX1M U24 ( .A(edge_cnt[2]), .B(\add_20/carry[2] ), .CO(\add_20/carry[3] ), 
        .S(N21) );
  ADDHX1M U25 ( .A(edge_cnt[3]), .B(\add_20/carry[3] ), .CO(\add_20/carry[4] ), 
        .S(N22) );
  ADDHX1M U26 ( .A(edge_cnt[4]), .B(\add_20/carry[4] ), .CO(\add_20/carry[5] ), 
        .S(N23) );
  INVX2M U27 ( .A(bit_cnt[0]), .Y(n28) );
  INVX2M U28 ( .A(prescale[3]), .Y(n6) );
  INVX2M U29 ( .A(prescale[0]), .Y(N7) );
  NAND2BX1M U30 ( .AN(prescale[1]), .B(N7), .Y(n2) );
  OAI2BB1X1M U31 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n2), .Y(N8) );
  NOR2X1M U32 ( .A(n2), .B(prescale[2]), .Y(n3) );
  AO21XLM U33 ( .A0(n2), .A1(prescale[2]), .B0(n3), .Y(N9) );
  CLKNAND2X2M U34 ( .A(n3), .B(n6), .Y(n4) );
  OAI21X1M U35 ( .A0(n3), .A1(n6), .B0(n4), .Y(N10) );
  XNOR2X1M U36 ( .A(prescale[4]), .B(n4), .Y(N11) );
  NOR2X1M U37 ( .A(prescale[4]), .B(n4), .Y(n5) );
  CLKXOR2X2M U38 ( .A(prescale[5]), .B(n5), .Y(N12) );
  NOR2BX1M U39 ( .AN(edge_cnt[0]), .B(N7), .Y(n17) );
  OAI2B2X1M U40 ( .A1N(N8), .A0(n17), .B0(edge_cnt[1]), .B1(n17), .Y(n21) );
  NOR2BX1M U41 ( .AN(N7), .B(edge_cnt[0]), .Y(n18) );
  OAI2B2X1M U42 ( .A1N(edge_cnt[1]), .A0(n18), .B0(N8), .B1(n18), .Y(n20) );
  XNOR2X1M U43 ( .A(N12), .B(edge_cnt[5]), .Y(n19) );
  NAND3X1M U44 ( .A(n21), .B(n20), .C(n19), .Y(n25) );
  CLKXOR2X2M U45 ( .A(N11), .B(edge_cnt[4]), .Y(n24) );
  CLKXOR2X2M U46 ( .A(N9), .B(edge_cnt[2]), .Y(n23) );
  CLKXOR2X2M U47 ( .A(N10), .B(edge_cnt[3]), .Y(n22) );
  NOR4X1M U48 ( .A(n25), .B(n24), .C(n23), .D(n22), .Y(N13) );
endmodule


module deserializer ( clk, rst, deser_en, sampled_bit, prescale, edge_cnt, 
        P_DATA );
  input [5:0] prescale;
  input [5:0] edge_cnt;
  output [7:0] P_DATA;
  input clk, rst, deser_en, sampled_bit;
  wire   N5, N7, N8, N9, N10, N11, n5, n6, n7, n8, n9, n10, n11, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, \add_18/carry[4] , \add_18/carry[3] ,
         n1, n2, n3, n4, n12, n22, n23, n24, n25, n26, n27;
  assign N5 = prescale[1];

  DFFRX1M \P_DATA_reg[5]  ( .D(n19), .CK(clk), .RN(rst), .Q(P_DATA[5]), .QN(n7) );
  DFFRX1M \P_DATA_reg[1]  ( .D(n15), .CK(clk), .RN(rst), .Q(P_DATA[1]), .QN(
        n11) );
  DFFRX1M \P_DATA_reg[4]  ( .D(n18), .CK(clk), .RN(rst), .Q(P_DATA[4]), .QN(n8) );
  DFFRQX2M \P_DATA_reg[0]  ( .D(n14), .CK(clk), .RN(rst), .Q(P_DATA[0]) );
  DFFRX1M \P_DATA_reg[7]  ( .D(n21), .CK(clk), .RN(rst), .Q(P_DATA[7]), .QN(n5) );
  DFFRX1M \P_DATA_reg[3]  ( .D(n17), .CK(clk), .RN(rst), .Q(P_DATA[3]), .QN(n9) );
  DFFRX1M \P_DATA_reg[6]  ( .D(n20), .CK(clk), .RN(rst), .Q(P_DATA[6]), .QN(n6) );
  DFFRX1M \P_DATA_reg[2]  ( .D(n16), .CK(clk), .RN(rst), .Q(P_DATA[2]), .QN(
        n10) );
  INVX2M U3 ( .A(prescale[2]), .Y(n1) );
  INVX2M U4 ( .A(n13), .Y(n27) );
  NAND2X2M U5 ( .A(deser_en), .B(N11), .Y(n13) );
  OAI22X1M U6 ( .A0(n13), .A1(n10), .B0(n27), .B1(n11), .Y(n15) );
  OAI22X1M U7 ( .A0(n13), .A1(n9), .B0(n27), .B1(n10), .Y(n16) );
  OAI22X1M U8 ( .A0(n13), .A1(n8), .B0(n27), .B1(n9), .Y(n17) );
  OAI22X1M U9 ( .A0(n13), .A1(n7), .B0(n27), .B1(n8), .Y(n18) );
  OAI22X1M U10 ( .A0(n13), .A1(n6), .B0(n27), .B1(n7), .Y(n19) );
  OAI22X1M U11 ( .A0(n13), .A1(n5), .B0(n27), .B1(n6), .Y(n20) );
  OAI2BB2X1M U12 ( .B0(n13), .B1(n11), .A0N(P_DATA[0]), .A1N(n13), .Y(n14) );
  OAI2BB2X1M U13 ( .B0(n27), .B1(n5), .A0N(sampled_bit), .A1N(n27), .Y(n21) );
  AND2X1M U14 ( .A(prescale[5]), .B(\add_18/carry[4] ), .Y(N10) );
  CLKXOR2X2M U15 ( .A(prescale[5]), .B(\add_18/carry[4] ), .Y(N9) );
  AND2X1M U16 ( .A(\add_18/carry[3] ), .B(prescale[4]), .Y(\add_18/carry[4] )
         );
  CLKXOR2X2M U17 ( .A(prescale[4]), .B(\add_18/carry[3] ), .Y(N8) );
  AND2X1M U18 ( .A(prescale[2]), .B(prescale[3]), .Y(\add_18/carry[3] ) );
  CLKXOR2X2M U19 ( .A(prescale[3]), .B(prescale[2]), .Y(N7) );
  NOR2BX1M U20 ( .AN(edge_cnt[0]), .B(N5), .Y(n2) );
  OAI2B2X1M U21 ( .A1N(n1), .A0(n2), .B0(edge_cnt[1]), .B1(n2), .Y(n22) );
  NOR2BX1M U22 ( .AN(N5), .B(edge_cnt[0]), .Y(n3) );
  OAI2B2X1M U23 ( .A1N(edge_cnt[1]), .A0(n3), .B0(n1), .B1(n3), .Y(n12) );
  XNOR2X1M U24 ( .A(N10), .B(edge_cnt[5]), .Y(n4) );
  NAND3X1M U25 ( .A(n22), .B(n12), .C(n4), .Y(n26) );
  CLKXOR2X2M U26 ( .A(N9), .B(edge_cnt[4]), .Y(n25) );
  CLKXOR2X2M U27 ( .A(N7), .B(edge_cnt[2]), .Y(n24) );
  CLKXOR2X2M U28 ( .A(N8), .B(edge_cnt[3]), .Y(n23) );
  NOR4X1M U29 ( .A(n26), .B(n25), .C(n24), .D(n23), .Y(N11) );
endmodule


module start_check ( clk, rst, start_check_en, sampled_bit, prescale, edge_cnt, 
        start_error );
  input [5:0] prescale;
  input [5:0] edge_cnt;
  input clk, rst, start_check_en, sampled_bit;
  output start_error;
  wire   N5, N7, N8, N9, N10, N11, n6, n7, \add_18/carry[4] ,
         \add_18/carry[3] , n1, n2, n3, n4, n5, n8, n9, n10, n11, n12, n13;
  assign N5 = prescale[1];

  DFFRQX2M start_error_reg ( .D(n7), .CK(clk), .RN(rst), .Q(start_error) );
  INVX2M U3 ( .A(prescale[2]), .Y(n1) );
  NOR2BX2M U4 ( .AN(start_check_en), .B(n6), .Y(n7) );
  AOI22X1M U5 ( .A0(start_error), .A1(n13), .B0(sampled_bit), .B1(N11), .Y(n6)
         );
  INVX2M U6 ( .A(N11), .Y(n13) );
  AND2X1M U7 ( .A(prescale[5]), .B(\add_18/carry[4] ), .Y(N10) );
  CLKXOR2X2M U8 ( .A(prescale[5]), .B(\add_18/carry[4] ), .Y(N9) );
  AND2X1M U9 ( .A(\add_18/carry[3] ), .B(prescale[4]), .Y(\add_18/carry[4] )
         );
  CLKXOR2X2M U10 ( .A(prescale[4]), .B(\add_18/carry[3] ), .Y(N8) );
  AND2X1M U11 ( .A(prescale[2]), .B(prescale[3]), .Y(\add_18/carry[3] ) );
  CLKXOR2X2M U12 ( .A(prescale[3]), .B(prescale[2]), .Y(N7) );
  NOR2BX1M U13 ( .AN(edge_cnt[0]), .B(N5), .Y(n2) );
  OAI2B2X1M U14 ( .A1N(n1), .A0(n2), .B0(edge_cnt[1]), .B1(n2), .Y(n8) );
  NOR2BX1M U15 ( .AN(N5), .B(edge_cnt[0]), .Y(n3) );
  OAI2B2X1M U16 ( .A1N(edge_cnt[1]), .A0(n3), .B0(n1), .B1(n3), .Y(n5) );
  XNOR2X1M U17 ( .A(N10), .B(edge_cnt[5]), .Y(n4) );
  NAND3X1M U18 ( .A(n8), .B(n5), .C(n4), .Y(n12) );
  CLKXOR2X2M U19 ( .A(N9), .B(edge_cnt[4]), .Y(n11) );
  CLKXOR2X2M U20 ( .A(N7), .B(edge_cnt[2]), .Y(n10) );
  CLKXOR2X2M U21 ( .A(N8), .B(edge_cnt[3]), .Y(n9) );
  NOR4X1M U22 ( .A(n12), .B(n11), .C(n10), .D(n9), .Y(N11) );
endmodule


module parity_check ( clk, rst, parity_check_en, prescale, edge_cnt, P_DATA, 
        sampled_bit, PAR_TYP, parity_error );
  input [5:0] prescale;
  input [5:0] edge_cnt;
  input [7:0] P_DATA;
  input clk, rst, parity_check_en, sampled_bit, PAR_TYP;
  output parity_error;
  wire   N10, N12, N13, N14, N15, N16, n6, n7, n8, n9, n10, n11, n12, n13,
         \add_22/carry[4] , \add_22/carry[3] , n1, n2, n3, n4, n5, n14, n15,
         n16, n17, n18, n19;
  assign N10 = prescale[1];

  DFFRQX2M parity_error_reg ( .D(n13), .CK(clk), .RN(rst), .Q(parity_error) );
  INVX2M U3 ( .A(prescale[2]), .Y(n1) );
  NOR2BX2M U4 ( .AN(parity_check_en), .B(n6), .Y(n13) );
  AOI22X1M U5 ( .A0(N16), .A1(n7), .B0(parity_error), .B1(n19), .Y(n6) );
  XOR3XLM U6 ( .A(n8), .B(n9), .C(n10), .Y(n7) );
  INVX2M U7 ( .A(N16), .Y(n19) );
  XOR3XLM U8 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n11), .Y(n10) );
  XNOR2X2M U9 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n11) );
  XOR3XLM U10 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n12), .Y(n9) );
  XNOR2X2M U11 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n12) );
  CLKXOR2X2M U12 ( .A(sampled_bit), .B(PAR_TYP), .Y(n8) );
  AND2X1M U13 ( .A(\add_22/carry[4] ), .B(prescale[5]), .Y(N15) );
  CLKXOR2X2M U14 ( .A(prescale[5]), .B(\add_22/carry[4] ), .Y(N14) );
  AND2X1M U15 ( .A(\add_22/carry[3] ), .B(prescale[4]), .Y(\add_22/carry[4] )
         );
  CLKXOR2X2M U16 ( .A(prescale[4]), .B(\add_22/carry[3] ), .Y(N13) );
  AND2X1M U17 ( .A(prescale[2]), .B(prescale[3]), .Y(\add_22/carry[3] ) );
  CLKXOR2X2M U18 ( .A(prescale[3]), .B(prescale[2]), .Y(N12) );
  NOR2BX1M U19 ( .AN(edge_cnt[0]), .B(N10), .Y(n2) );
  OAI2B2X1M U20 ( .A1N(n1), .A0(n2), .B0(edge_cnt[1]), .B1(n2), .Y(n14) );
  NOR2BX1M U21 ( .AN(N10), .B(edge_cnt[0]), .Y(n3) );
  OAI2B2X1M U22 ( .A1N(edge_cnt[1]), .A0(n3), .B0(n1), .B1(n3), .Y(n5) );
  XNOR2X1M U23 ( .A(N15), .B(edge_cnt[5]), .Y(n4) );
  NAND3X1M U24 ( .A(n14), .B(n5), .C(n4), .Y(n18) );
  CLKXOR2X2M U25 ( .A(N14), .B(edge_cnt[4]), .Y(n17) );
  CLKXOR2X2M U26 ( .A(N12), .B(edge_cnt[2]), .Y(n16) );
  CLKXOR2X2M U27 ( .A(N13), .B(edge_cnt[3]), .Y(n15) );
  NOR4X1M U28 ( .A(n18), .B(n17), .C(n16), .D(n15), .Y(N16) );
endmodule


module stop_check ( clk, rst, stop_check_en, sampled_bit, prescale, edge_cnt, 
        stop_error );
  input [5:0] prescale;
  input [5:0] edge_cnt;
  input clk, rst, stop_check_en, sampled_bit;
  output stop_error;
  wire   N5, N7, N8, N9, N10, n6, n7, \add_18/carry[4] , \add_18/carry[3] , n1,
         n2, n3, n4, n5, n8, n9, n10, n11, n12, n13;
  assign N5 = prescale[1];

  DFFRQX2M stop_error_reg ( .D(n7), .CK(clk), .RN(rst), .Q(stop_error) );
  OR4X1M U3 ( .A(n13), .B(n12), .C(n11), .D(n10), .Y(n1) );
  INVX2M U4 ( .A(prescale[2]), .Y(n2) );
  NOR2BX2M U5 ( .AN(stop_check_en), .B(n6), .Y(n7) );
  AOI2BB2XLM U6 ( .B0(stop_error), .B1(n1), .A0N(sampled_bit), .A1N(n1), .Y(n6) );
  AND2X1M U7 ( .A(prescale[5]), .B(\add_18/carry[4] ), .Y(N10) );
  CLKXOR2X2M U8 ( .A(prescale[5]), .B(\add_18/carry[4] ), .Y(N9) );
  AND2X1M U9 ( .A(\add_18/carry[3] ), .B(prescale[4]), .Y(\add_18/carry[4] )
         );
  CLKXOR2X2M U10 ( .A(prescale[4]), .B(\add_18/carry[3] ), .Y(N8) );
  AND2X1M U11 ( .A(prescale[2]), .B(prescale[3]), .Y(\add_18/carry[3] ) );
  CLKXOR2X2M U12 ( .A(prescale[3]), .B(prescale[2]), .Y(N7) );
  NOR2BX1M U13 ( .AN(edge_cnt[0]), .B(N5), .Y(n3) );
  OAI2B2X1M U14 ( .A1N(n2), .A0(n3), .B0(edge_cnt[1]), .B1(n3), .Y(n9) );
  NOR2BX1M U15 ( .AN(N5), .B(edge_cnt[0]), .Y(n4) );
  OAI2B2X1M U16 ( .A1N(edge_cnt[1]), .A0(n4), .B0(n2), .B1(n4), .Y(n8) );
  XNOR2X1M U17 ( .A(N10), .B(edge_cnt[5]), .Y(n5) );
  NAND3X1M U18 ( .A(n9), .B(n8), .C(n5), .Y(n13) );
  CLKXOR2X2M U19 ( .A(N9), .B(edge_cnt[4]), .Y(n12) );
  CLKXOR2X2M U20 ( .A(N7), .B(edge_cnt[2]), .Y(n11) );
  CLKXOR2X2M U21 ( .A(N8), .B(edge_cnt[3]), .Y(n10) );
endmodule


module RX_FSM ( clk, rst, RX_IN, prescale, parity_error, stop_error, 
        start_error, PAR_EN, bit_cnt, edge_cnt, data_samp_en, counter_en, 
        start_check_en, stop_check_en, parity_check_en, data_valid, deser_en
 );
  input [5:0] prescale;
  input [3:0] bit_cnt;
  input [5:0] edge_cnt;
  input clk, rst, RX_IN, parity_error, stop_error, start_error, PAR_EN;
  output data_samp_en, counter_en, start_check_en, stop_check_en,
         parity_check_en, data_valid, deser_en;
  wire   data_samp_en, data_valid_c, N39, N40, N41, N42, N43, N44, N45, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n1, n2, n3, n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n24, n25, n26, n27, n28, n29, n30,
         n31, n32;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  assign counter_en = data_samp_en;

  DFFRQX2M \current_state_reg[1]  ( .D(next_state[1]), .CK(clk), .RN(rst), .Q(
        current_state[1]) );
  DFFRQX2M \current_state_reg[2]  ( .D(next_state[2]), .CK(clk), .RN(rst), .Q(
        current_state[2]) );
  DFFRQX2M data_valid_reg ( .D(data_valid_c), .CK(clk), .RN(rst), .Q(
        data_valid) );
  DFFRX1M \current_state_reg[0]  ( .D(next_state[0]), .CK(clk), .RN(rst), .Q(
        current_state[0]), .QN(n26) );
  NOR3X2M U3 ( .A(current_state[0]), .B(current_state[2]), .C(n28), .Y(
        deser_en) );
  INVX2M U4 ( .A(N45), .Y(n31) );
  OAI211X2M U5 ( .A0(n31), .A1(n25), .B0(n14), .C0(n27), .Y(next_state[2]) );
  NAND3X2M U6 ( .A(deser_en), .B(n32), .C(n15), .Y(n14) );
  AOI21X2M U7 ( .A0(n18), .A1(n26), .B0(n23), .Y(data_samp_en) );
  INVX2M U8 ( .A(parity_check_en), .Y(n25) );
  INVX2M U9 ( .A(stop_check_en), .Y(n27) );
  OAI221X1M U10 ( .A0(RX_IN), .A1(n19), .B0(n31), .B1(n27), .C0(n20), .Y(
        next_state[0]) );
  AOI21X2M U11 ( .A0(n18), .A1(n26), .B0(data_valid_c), .Y(n19) );
  AOI32X1M U12 ( .A0(n15), .A1(deser_en), .A2(PAR_EN), .B0(n21), .B1(n31), .Y(
        n20) );
  OAI31X1M U13 ( .A0(n26), .A1(start_error), .A2(current_state[2]), .B0(n25), 
        .Y(n21) );
  OAI21X2M U14 ( .A0(N45), .A1(n25), .B0(n16), .Y(next_state[1]) );
  AOI31X2M U15 ( .A0(N45), .A1(n30), .A2(start_check_en), .B0(n17), .Y(n16) );
  INVX2M U16 ( .A(start_error), .Y(n30) );
  AOI21BX2M U17 ( .A0(n15), .A1(n32), .B0N(deser_en), .Y(n17) );
  AND3XLM U18 ( .A(bit_cnt[3]), .B(N45), .C(n22), .Y(n15) );
  NOR3X2M U19 ( .A(bit_cnt[0]), .B(bit_cnt[2]), .C(bit_cnt[1]), .Y(n22) );
  NOR3BX2M U20 ( .AN(n23), .B(stop_error), .C(parity_error), .Y(data_valid_c)
         );
  NOR3X2M U21 ( .A(n26), .B(current_state[2]), .C(n28), .Y(parity_check_en) );
  NOR3X2M U22 ( .A(current_state[0]), .B(current_state[1]), .C(n29), .Y(
        stop_check_en) );
  NOR3X2M U23 ( .A(n29), .B(current_state[1]), .C(n26), .Y(n23) );
  NOR2X2M U24 ( .A(current_state[2]), .B(current_state[1]), .Y(n18) );
  INVX2M U25 ( .A(current_state[2]), .Y(n29) );
  INVX2M U26 ( .A(current_state[1]), .Y(n28) );
  AND2X2M U27 ( .A(n18), .B(current_state[0]), .Y(start_check_en) );
  INVX2M U28 ( .A(prescale[3]), .Y(n5) );
  INVX2M U29 ( .A(prescale[0]), .Y(N39) );
  INVX2M U30 ( .A(PAR_EN), .Y(n32) );
  NAND2BX1M U31 ( .AN(prescale[1]), .B(N39), .Y(n1) );
  OAI2BB1X1M U32 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n1), .Y(N40) );
  NOR2X1M U33 ( .A(n1), .B(prescale[2]), .Y(n2) );
  AO21XLM U34 ( .A0(n1), .A1(prescale[2]), .B0(n2), .Y(N41) );
  CLKNAND2X2M U35 ( .A(n2), .B(n5), .Y(n3) );
  OAI21X1M U36 ( .A0(n2), .A1(n5), .B0(n3), .Y(N42) );
  XNOR2X1M U37 ( .A(prescale[4]), .B(n3), .Y(N43) );
  NOR2X1M U38 ( .A(prescale[4]), .B(n3), .Y(n4) );
  CLKXOR2X2M U39 ( .A(prescale[5]), .B(n4), .Y(N44) );
  NOR2BX1M U40 ( .AN(edge_cnt[0]), .B(N39), .Y(n6) );
  OAI2B2X1M U41 ( .A1N(N40), .A0(n6), .B0(edge_cnt[1]), .B1(n6), .Y(n10) );
  NOR2BX1M U42 ( .AN(N39), .B(edge_cnt[0]), .Y(n7) );
  OAI2B2X1M U43 ( .A1N(edge_cnt[1]), .A0(n7), .B0(N40), .B1(n7), .Y(n9) );
  XNOR2X1M U44 ( .A(N44), .B(edge_cnt[5]), .Y(n8) );
  NAND3X1M U45 ( .A(n10), .B(n9), .C(n8), .Y(n24) );
  CLKXOR2X2M U46 ( .A(N43), .B(edge_cnt[4]), .Y(n13) );
  CLKXOR2X2M U47 ( .A(N41), .B(edge_cnt[2]), .Y(n12) );
  CLKXOR2X2M U48 ( .A(N42), .B(edge_cnt[3]), .Y(n11) );
  NOR4X1M U49 ( .A(n24), .B(n13), .C(n12), .D(n11), .Y(N45) );
endmodule


module RX_TOP ( clk, rst, RX_IN, prescale, PAR_EN, PAR_TYP, P_DATA, data_valid, 
        parity_error, stop_error );
  input [5:0] prescale;
  output [7:0] P_DATA;
  input clk, rst, RX_IN, PAR_EN, PAR_TYP;
  output data_valid, parity_error, stop_error;
  wire   data_samp_en, sampled_bit, counter_en, deser_en, start_check_en,
         start_error, parity_check_en, stop_check_en, n1, n2;
  wire   [5:0] edge_cnt;
  wire   [3:0] bit_cnt;

  data_sampling u_data_sampling ( .prescale(prescale), .clk(clk), .rst(n1), 
        .RX_IN(RX_IN), .data_samp_en(data_samp_en), .edge_cnt(edge_cnt), 
        .sampled_bit(sampled_bit) );
  edge_bit_counter u_edge_bit_counter ( .clk(clk), .rst(n1), .counter_en(
        counter_en), .prescale(prescale), .edge_cnt(edge_cnt), .bit_cnt(
        bit_cnt) );
  deserializer u_deserializer ( .clk(clk), .rst(n1), .deser_en(deser_en), 
        .sampled_bit(sampled_bit), .prescale(prescale), .edge_cnt(edge_cnt), 
        .P_DATA(P_DATA) );
  start_check u_start_check ( .clk(clk), .rst(n1), .start_check_en(
        start_check_en), .sampled_bit(sampled_bit), .prescale(prescale), 
        .edge_cnt(edge_cnt), .start_error(start_error) );
  parity_check u_parity_check ( .clk(clk), .rst(n1), .parity_check_en(
        parity_check_en), .prescale(prescale), .edge_cnt(edge_cnt), .P_DATA(
        P_DATA), .sampled_bit(sampled_bit), .PAR_TYP(PAR_TYP), .parity_error(
        parity_error) );
  stop_check u_stop_check ( .clk(clk), .rst(n1), .stop_check_en(stop_check_en), 
        .sampled_bit(sampled_bit), .prescale(prescale), .edge_cnt(edge_cnt), 
        .stop_error(stop_error) );
  RX_FSM u_RX_FSM ( .clk(clk), .rst(n1), .RX_IN(RX_IN), .prescale(prescale), 
        .parity_error(parity_error), .stop_error(stop_error), .start_error(
        start_error), .PAR_EN(PAR_EN), .bit_cnt(bit_cnt), .edge_cnt(edge_cnt), 
        .data_samp_en(data_samp_en), .counter_en(counter_en), .start_check_en(
        start_check_en), .stop_check_en(stop_check_en), .parity_check_en(
        parity_check_en), .data_valid(data_valid), .deser_en(deser_en) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(rst), .Y(n2) );
endmodule


module TOP_UART ( RST, TX_CLK, RX_CLK, RX_IN_S, RX_OUT_P, RX_OUT_V, TX_IN_P, 
        TX_IN_V, TX_OUT_S, TX_OUT_V, Prescale, parity_enable, parity_type, 
        parity_error, framing_error );
  output [7:0] RX_OUT_P;
  input [7:0] TX_IN_P;
  input [5:0] Prescale;
  input RST, TX_CLK, RX_CLK, RX_IN_S, TX_IN_V, parity_enable, parity_type;
  output RX_OUT_V, TX_OUT_S, TX_OUT_V, parity_error, framing_error;


  TX_TOP U0_UART_TX ( .P_DATA(TX_IN_P), .data_valid(TX_IN_V), .PAR_EN(
        parity_enable), .PAR_TYP(parity_type), .clk(TX_CLK), .rst(RST), .busy(
        TX_OUT_V), .TX_OUT(TX_OUT_S) );
  RX_TOP U0_UART_RX ( .clk(RX_CLK), .rst(RST), .RX_IN(RX_IN_S), .prescale(
        Prescale), .PAR_EN(parity_enable), .PAR_TYP(parity_type), .P_DATA(
        RX_OUT_P), .data_valid(RX_OUT_V), .parity_error(parity_error), 
        .stop_error(framing_error) );
endmodule


module SYS_CTRL ( CLK, RST, ALU_OUT, OUT_Valid, ALU_FUN, EN, RdData, 
        RdData_Valid, Address, WrEn, RdEn, WrData, RX_P_DATA, RX_D_VLD, 
        FIFO_FULL, TX_P_DATA, TX_D_VLD, clk_div_en, CLK_EN );
  input [15:0] ALU_OUT;
  output [3:0] ALU_FUN;
  input [7:0] RdData;
  output [3:0] Address;
  output [7:0] WrData;
  input [7:0] RX_P_DATA;
  output [7:0] TX_P_DATA;
  input CLK, RST, OUT_Valid, RdData_Valid, RX_D_VLD, FIFO_FULL;
  output EN, WrEn, RdEn, TX_D_VLD, clk_div_en, CLK_EN;
  wire   n19, n20, n29, n30, n33, n41, n44, n58, n62, n72, n76, n77, n78, n79,
         n81, n84, n85, n86, n87, n88, n89, n91, n92, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n18, n22, n23, n24, n25, n26, n27, n28, n31, n32, n34, n35, n36, n37,
         n38, n39, n40, n42, n43, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n59, n60, n61, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n73, n74, n75, n80, n82, n83, n90, n93, n103, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127;
  wire   [3:0] state;
  wire   [7:0] rd_result_r;
  wire   [15:0] alu_result_r;
  assign clk_div_en = 1'b1;

  DFFRQX2M \rd_result_r_reg[7]  ( .D(n163), .CK(CLK), .RN(n7), .Q(
        rd_result_r[7]) );
  DFFRQX2M \rd_result_r_reg[6]  ( .D(n162), .CK(CLK), .RN(n7), .Q(
        rd_result_r[6]) );
  DFFRQX2M \rd_result_r_reg[5]  ( .D(n161), .CK(CLK), .RN(n7), .Q(
        rd_result_r[5]) );
  DFFRQX2M \rd_result_r_reg[4]  ( .D(n160), .CK(CLK), .RN(n7), .Q(
        rd_result_r[4]) );
  DFFRQX2M \rd_result_r_reg[3]  ( .D(n159), .CK(CLK), .RN(n7), .Q(
        rd_result_r[3]) );
  DFFRQX2M \rd_result_r_reg[2]  ( .D(n158), .CK(CLK), .RN(n7), .Q(
        rd_result_r[2]) );
  DFFRQX2M \rd_result_r_reg[1]  ( .D(n157), .CK(CLK), .RN(n6), .Q(
        rd_result_r[1]) );
  DFFRQX2M \rd_result_r_reg[0]  ( .D(n156), .CK(CLK), .RN(n6), .Q(
        rd_result_r[0]) );
  DFFRQX2M \alu_result_r_reg[15]  ( .D(n155), .CK(CLK), .RN(n6), .Q(
        alu_result_r[15]) );
  DFFRQX2M \alu_result_r_reg[14]  ( .D(n154), .CK(CLK), .RN(n6), .Q(
        alu_result_r[14]) );
  DFFRQX2M \alu_result_r_reg[13]  ( .D(n153), .CK(CLK), .RN(n6), .Q(
        alu_result_r[13]) );
  DFFRQX2M \alu_result_r_reg[12]  ( .D(n152), .CK(CLK), .RN(n6), .Q(
        alu_result_r[12]) );
  DFFRQX2M \alu_result_r_reg[11]  ( .D(n151), .CK(CLK), .RN(n6), .Q(
        alu_result_r[11]) );
  DFFRQX2M \alu_result_r_reg[10]  ( .D(n150), .CK(CLK), .RN(n6), .Q(
        alu_result_r[10]) );
  DFFRQX2M \alu_result_r_reg[9]  ( .D(n149), .CK(CLK), .RN(n6), .Q(
        alu_result_r[9]) );
  DFFRQX2M \alu_result_r_reg[8]  ( .D(n148), .CK(CLK), .RN(n6), .Q(
        alu_result_r[8]) );
  DFFRQX2M \alu_result_r_reg[7]  ( .D(n147), .CK(CLK), .RN(n6), .Q(
        alu_result_r[7]) );
  DFFRQX2M \alu_result_r_reg[6]  ( .D(n146), .CK(CLK), .RN(n6), .Q(
        alu_result_r[6]) );
  DFFRQX2M \alu_result_r_reg[5]  ( .D(n145), .CK(CLK), .RN(n6), .Q(
        alu_result_r[5]) );
  DFFRQX2M \alu_result_r_reg[4]  ( .D(n144), .CK(CLK), .RN(n6), .Q(
        alu_result_r[4]) );
  DFFRQX2M \alu_result_r_reg[3]  ( .D(n143), .CK(CLK), .RN(n6), .Q(
        alu_result_r[3]) );
  DFFRQX2M \alu_result_r_reg[2]  ( .D(n142), .CK(CLK), .RN(n6), .Q(
        alu_result_r[2]) );
  DFFRQX2M \alu_result_r_reg[1]  ( .D(n141), .CK(CLK), .RN(n6), .Q(
        alu_result_r[1]) );
  DFFRQX2M \alu_result_r_reg[0]  ( .D(n140), .CK(CLK), .RN(n6), .Q(
        alu_result_r[0]) );
  DFFRX1M \opb_r_reg[7]  ( .D(n185), .CK(CLK), .RN(n4), .QN(n37) );
  DFFRX1M \opb_r_reg[6]  ( .D(n184), .CK(CLK), .RN(n4), .QN(n38) );
  DFFRX1M \opb_r_reg[5]  ( .D(n183), .CK(CLK), .RN(n4), .QN(n39) );
  DFFRX1M \opb_r_reg[4]  ( .D(n182), .CK(CLK), .RN(n4), .QN(n40) );
  DFFRX1M \opb_r_reg[3]  ( .D(n181), .CK(CLK), .RN(n4), .QN(n42) );
  DFFRX1M \opb_r_reg[2]  ( .D(n180), .CK(CLK), .RN(n4), .QN(n43) );
  DFFRX1M \opb_r_reg[1]  ( .D(n179), .CK(CLK), .RN(n4), .QN(n45) );
  DFFRX1M \opb_r_reg[0]  ( .D(n178), .CK(CLK), .RN(n4), .QN(n46) );
  DFFRX1M \opa_r_reg[7]  ( .D(n177), .CK(CLK), .RN(n5), .QN(n47) );
  DFFRX1M \opa_r_reg[6]  ( .D(n176), .CK(CLK), .RN(n5), .QN(n48) );
  DFFRX1M \opa_r_reg[5]  ( .D(n175), .CK(CLK), .RN(n5), .QN(n49) );
  DFFRX1M \opa_r_reg[4]  ( .D(n174), .CK(CLK), .RN(n5), .QN(n50) );
  DFFRX1M \opa_r_reg[3]  ( .D(n173), .CK(CLK), .RN(n5), .QN(n51) );
  DFFRX1M \opa_r_reg[2]  ( .D(n172), .CK(CLK), .RN(n5), .QN(n52) );
  DFFRX1M \opa_r_reg[1]  ( .D(n171), .CK(CLK), .RN(n5), .QN(n53) );
  DFFRX1M \opa_r_reg[0]  ( .D(n170), .CK(CLK), .RN(n5), .QN(n54) );
  DFFRX1M \fun_r_reg[3]  ( .D(n189), .CK(CLK), .RN(n4), .QN(n32) );
  DFFRX1M \fun_r_reg[2]  ( .D(n188), .CK(CLK), .RN(n4), .QN(n34) );
  DFFRX1M \fun_r_reg[1]  ( .D(n187), .CK(CLK), .RN(n4), .QN(n35) );
  DFFRX1M \fun_r_reg[0]  ( .D(n186), .CK(CLK), .RN(n4), .QN(n36) );
  DFFRX1M \addr_r_reg[3]  ( .D(n169), .CK(CLK), .RN(n5), .QN(n55) );
  DFFRX1M \addr_r_reg[2]  ( .D(n168), .CK(CLK), .RN(n5), .QN(n56) );
  DFFRX1M \addr_r_reg[1]  ( .D(n167), .CK(CLK), .RN(n5), .QN(n57) );
  DFFRX1M \addr_r_reg[0]  ( .D(n166), .CK(CLK), .RN(n5), .QN(n59) );
  DFFRQX2M \state_reg[0]  ( .D(n193), .CK(CLK), .RN(n7), .Q(state[0]) );
  DFFRQX2M \state_reg[2]  ( .D(n191), .CK(CLK), .RN(n7), .Q(state[2]) );
  DFFRQX2M \state_reg[3]  ( .D(n190), .CK(CLK), .RN(n7), .Q(state[3]) );
  DFFRQX2M \state_reg[1]  ( .D(n192), .CK(CLK), .RN(n7), .Q(state[1]) );
  NOR2X2M U3 ( .A(n14), .B(n19), .Y(n1) );
  OAI221X1M U4 ( .A0(n126), .A1(n30), .B0(n59), .B1(n110), .C0(n111), .Y(
        Address[0]) );
  OAI22X1M U5 ( .A0(n57), .A1(n110), .B0(n125), .B1(n30), .Y(Address[1]) );
  NOR2X2M U6 ( .A(n19), .B(n34), .Y(ALU_FUN[2]) );
  NOR2X2M U7 ( .A(n19), .B(n36), .Y(ALU_FUN[0]) );
  OAI22X1M U8 ( .A0(n55), .A1(n110), .B0(n123), .B1(n30), .Y(Address[3]) );
  OAI22X1M U9 ( .A0(n56), .A1(n110), .B0(n124), .B1(n30), .Y(Address[2]) );
  BUFX2M U10 ( .A(n20), .Y(n11) );
  INVX2M U11 ( .A(n91), .Y(n16) );
  NAND2X2M U12 ( .A(n114), .B(n27), .Y(n87) );
  NOR2BX2M U13 ( .AN(n107), .B(FIFO_FULL), .Y(TX_D_VLD) );
  INVX2M U14 ( .A(n97), .Y(n24) );
  INVX2M U15 ( .A(n8), .Y(n18) );
  INVX2M U16 ( .A(n10), .Y(n15) );
  INVX2M U17 ( .A(n30), .Y(RdEn) );
  BUFX2M U18 ( .A(n3), .Y(n6) );
  BUFX2M U19 ( .A(n2), .Y(n5) );
  BUFX2M U20 ( .A(n2), .Y(n4) );
  BUFX2M U21 ( .A(n3), .Y(n7) );
  NOR2X2M U22 ( .A(n22), .B(n26), .Y(n114) );
  NAND2X2M U23 ( .A(n79), .B(n41), .Y(n30) );
  NOR2X2M U24 ( .A(n19), .B(n35), .Y(ALU_FUN[1]) );
  NAND2X2M U25 ( .A(n25), .B(n22), .Y(n111) );
  NAND2X2M U26 ( .A(n31), .B(n22), .Y(n91) );
  INVX2M U27 ( .A(n72), .Y(n25) );
  INVX2M U28 ( .A(n76), .Y(n27) );
  OAI222X1M U29 ( .A0(n46), .A1(n111), .B0(n54), .B1(n9), .C0(n126), .C1(n110), 
        .Y(WrData[0]) );
  OAI222X1M U30 ( .A0(n45), .A1(n111), .B0(n53), .B1(n8), .C0(n125), .C1(n110), 
        .Y(WrData[1]) );
  OAI222X1M U31 ( .A0(n43), .A1(n111), .B0(n52), .B1(n9), .C0(n124), .C1(n110), 
        .Y(WrData[2]) );
  OAI222X1M U32 ( .A0(n42), .A1(n111), .B0(n51), .B1(n8), .C0(n123), .C1(n110), 
        .Y(WrData[3]) );
  OAI222X1M U33 ( .A0(n40), .A1(n111), .B0(n50), .B1(n9), .C0(n122), .C1(n110), 
        .Y(WrData[4]) );
  OAI222X1M U34 ( .A0(n39), .A1(n111), .B0(n49), .B1(n8), .C0(n121), .C1(n110), 
        .Y(WrData[5]) );
  OAI222X1M U35 ( .A0(n38), .A1(n111), .B0(n48), .B1(n9), .C0(n120), .C1(n110), 
        .Y(WrData[6]) );
  OAI222X1M U36 ( .A0(n37), .A1(n111), .B0(n47), .B1(n8), .C0(n119), .C1(n110), 
        .Y(WrData[7]) );
  OAI221X1M U37 ( .A0(n88), .A1(n81), .B0(n12), .B1(n26), .C0(n84), .Y(n192)
         );
  AOI21X2M U38 ( .A0(n24), .A1(n91), .B0(n92), .Y(n88) );
  OAI222X1M U39 ( .A0(n68), .A1(n112), .B0(n82), .B1(n87), .C0(n118), .C1(n113), .Y(TX_P_DATA[0]) );
  OAI222X1M U40 ( .A0(n67), .A1(n112), .B0(n80), .B1(n87), .C0(n117), .C1(n113), .Y(TX_P_DATA[1]) );
  OAI222X1M U41 ( .A0(n66), .A1(n112), .B0(n75), .B1(n87), .C0(n116), .C1(n113), .Y(TX_P_DATA[2]) );
  OAI222X1M U42 ( .A0(n65), .A1(n112), .B0(n74), .B1(n87), .C0(n115), .C1(n113), .Y(TX_P_DATA[3]) );
  OAI222X1M U43 ( .A0(n64), .A1(n112), .B0(n73), .B1(n87), .C0(n103), .C1(n113), .Y(TX_P_DATA[4]) );
  OAI222X1M U44 ( .A0(n63), .A1(n112), .B0(n71), .B1(n87), .C0(n93), .C1(n113), 
        .Y(TX_P_DATA[5]) );
  OAI222X1M U45 ( .A0(n61), .A1(n112), .B0(n70), .B1(n87), .C0(n90), .C1(n113), 
        .Y(TX_P_DATA[6]) );
  OAI222X1M U46 ( .A0(n60), .A1(n112), .B0(n69), .B1(n87), .C0(n83), .C1(n113), 
        .Y(TX_P_DATA[7]) );
  OAI211X2M U47 ( .A0(n12), .A1(n28), .B0(n13), .C0(n84), .Y(n191) );
  INVX2M U48 ( .A(n85), .Y(n13) );
  AOI31X2M U49 ( .A0(n86), .A1(n87), .A2(n29), .B0(n81), .Y(n85) );
  AOI21BX2M U50 ( .A0(n28), .A1(n79), .B0N(n58), .Y(n86) );
  NAND2X2M U51 ( .A(n26), .B(n28), .Y(n97) );
  INVX2M U52 ( .A(n81), .Y(n12) );
  NAND2X2M U53 ( .A(n109), .B(n16), .Y(n29) );
  INVX2M U54 ( .A(n19), .Y(EN) );
  NAND3X2M U55 ( .A(n110), .B(n9), .C(n111), .Y(WrEn) );
  NAND3X2M U56 ( .A(n126), .B(n122), .C(n89), .Y(n84) );
  NOR2X2M U57 ( .A(n19), .B(n32), .Y(ALU_FUN[3]) );
  NAND3X2M U58 ( .A(n112), .B(n113), .C(n87), .Y(n107) );
  BUFX2M U59 ( .A(n62), .Y(n8) );
  BUFX2M U60 ( .A(n62), .Y(n9) );
  OAI22X1M U61 ( .A0(n23), .A1(n59), .B0(n33), .B1(n126), .Y(n166) );
  OAI22X1M U62 ( .A0(n23), .A1(n57), .B0(n33), .B1(n125), .Y(n167) );
  OAI22X1M U63 ( .A0(n23), .A1(n56), .B0(n33), .B1(n124), .Y(n168) );
  OAI22X1M U64 ( .A0(n23), .A1(n55), .B0(n33), .B1(n123), .Y(n169) );
  OAI22X1M U65 ( .A0(n25), .A1(n36), .B0(n126), .B1(n72), .Y(n186) );
  OAI22X1M U66 ( .A0(n25), .A1(n35), .B0(n125), .B1(n72), .Y(n187) );
  OAI22X1M U67 ( .A0(n25), .A1(n34), .B0(n124), .B1(n72), .Y(n188) );
  OAI22X1M U68 ( .A0(n25), .A1(n32), .B0(n123), .B1(n72), .Y(n189) );
  OAI22X1M U69 ( .A0(n10), .A1(n50), .B0(n15), .B1(n122), .Y(n174) );
  OAI22X1M U70 ( .A0(n10), .A1(n49), .B0(n15), .B1(n121), .Y(n175) );
  OAI22X1M U71 ( .A0(n18), .A1(n46), .B0(n126), .B1(n8), .Y(n178) );
  OAI22X1M U72 ( .A0(n18), .A1(n45), .B0(n125), .B1(n9), .Y(n179) );
  OAI22X1M U73 ( .A0(n18), .A1(n43), .B0(n124), .B1(n8), .Y(n180) );
  OAI22X1M U74 ( .A0(n18), .A1(n42), .B0(n123), .B1(n9), .Y(n181) );
  OAI22X1M U75 ( .A0(n18), .A1(n40), .B0(n122), .B1(n8), .Y(n182) );
  OAI22X1M U76 ( .A0(n18), .A1(n39), .B0(n121), .B1(n9), .Y(n183) );
  OAI22X1M U77 ( .A0(n18), .A1(n38), .B0(n120), .B1(n8), .Y(n184) );
  OAI22X1M U78 ( .A0(n18), .A1(n37), .B0(n119), .B1(n9), .Y(n185) );
  OAI22X1M U79 ( .A0(n10), .A1(n48), .B0(n15), .B1(n120), .Y(n176) );
  OAI22X1M U80 ( .A0(n10), .A1(n47), .B0(n15), .B1(n119), .Y(n177) );
  OAI22X1M U81 ( .A0(n10), .A1(n54), .B0(n126), .B1(n15), .Y(n170) );
  OAI22X1M U82 ( .A0(n10), .A1(n53), .B0(n125), .B1(n15), .Y(n171) );
  OAI22X1M U83 ( .A0(n10), .A1(n52), .B0(n124), .B1(n15), .Y(n172) );
  OAI22X1M U84 ( .A0(n10), .A1(n51), .B0(n123), .B1(n15), .Y(n173) );
  NOR2X2M U85 ( .A(n114), .B(n76), .Y(CLK_EN) );
  INVX2M U86 ( .A(n33), .Y(n23) );
  BUFX2M U87 ( .A(n44), .Y(n10) );
  NOR2X2M U88 ( .A(n58), .B(n127), .Y(n44) );
  BUFX2M U89 ( .A(RST), .Y(n3) );
  BUFX2M U90 ( .A(RST), .Y(n2) );
  NOR2BX2M U91 ( .AN(n114), .B(state[3]), .Y(n79) );
  INVX2M U92 ( .A(state[1]), .Y(n26) );
  NOR2X2M U93 ( .A(n127), .B(state[2]), .Y(n41) );
  NAND3X2M U94 ( .A(n27), .B(n22), .C(state[1]), .Y(n19) );
  NAND3X2M U95 ( .A(n16), .B(state[1]), .C(n41), .Y(n110) );
  NAND3X2M U96 ( .A(state[3]), .B(n26), .C(n41), .Y(n72) );
  NAND2X2M U97 ( .A(state[3]), .B(n28), .Y(n76) );
  INVX2M U98 ( .A(state[0]), .Y(n22) );
  INVX2M U99 ( .A(RX_P_DATA[0]), .Y(n126) );
  INVX2M U100 ( .A(state[2]), .Y(n28) );
  INVX2M U101 ( .A(state[3]), .Y(n31) );
  INVX2M U102 ( .A(RX_P_DATA[1]), .Y(n125) );
  INVX2M U103 ( .A(RX_D_VLD), .Y(n127) );
  OAI211X2M U104 ( .A0(RdData_Valid), .A1(n29), .B0(n105), .C0(n106), .Y(n81)
         );
  AOI22X1M U105 ( .A0(FIFO_FULL), .A1(n107), .B0(EN), .B1(n14), .Y(n106) );
  OAI31X1M U106 ( .A0(n108), .A1(n79), .A2(n24), .B0(n127), .Y(n105) );
  OAI21X2M U107 ( .A0(state[3]), .A1(state[2]), .B0(n58), .Y(n108) );
  NOR2X2M U108 ( .A(n28), .B(state[1]), .Y(n109) );
  NAND3X2M U109 ( .A(state[3]), .B(n22), .C(n109), .Y(n113) );
  NAND3X2M U110 ( .A(n109), .B(n31), .C(state[0]), .Y(n112) );
  OAI211X2M U111 ( .A0(n12), .A1(n22), .B0(n94), .C0(n77), .Y(n193) );
  OAI21X2M U112 ( .A0(n92), .A1(n98), .B0(n12), .Y(n94) );
  OAI31X1M U113 ( .A0(n99), .A1(RX_P_DATA[0]), .A2(n100), .B0(n29), .Y(n98) );
  NAND3X2M U114 ( .A(n122), .B(n120), .C(n124), .Y(n99) );
  NAND3X2M U115 ( .A(state[2]), .B(state[1]), .C(n16), .Y(n58) );
  AND4X2M U116 ( .A(RX_P_DATA[3]), .B(RX_P_DATA[2]), .C(n95), .D(n96), .Y(n89)
         );
  NOR3X2M U117 ( .A(n91), .B(RX_P_DATA[5]), .C(RX_P_DATA[1]), .Y(n95) );
  NOR4X1M U118 ( .A(n120), .B(n119), .C(n81), .D(n97), .Y(n96) );
  INVX2M U119 ( .A(RX_P_DATA[2]), .Y(n124) );
  NAND3X2M U120 ( .A(RX_P_DATA[4]), .B(RX_P_DATA[0]), .C(n89), .Y(n77) );
  NAND3X2M U121 ( .A(RX_D_VLD), .B(state[2]), .C(n79), .Y(n62) );
  INVX2M U122 ( .A(RX_P_DATA[3]), .Y(n123) );
  NAND3X2M U123 ( .A(n76), .B(n77), .C(n78), .Y(n190) );
  AOI32X1M U124 ( .A0(n79), .A1(state[2]), .A2(n12), .B0(state[3]), .B1(n81), 
        .Y(n78) );
  NAND4X2M U125 ( .A(n41), .B(state[0]), .C(n26), .D(n31), .Y(n33) );
  OAI2BB2X1M U126 ( .B0(n1), .B1(n118), .A0N(ALU_OUT[0]), .A1N(n1), .Y(n140)
         );
  OAI2BB2X1M U127 ( .B0(n1), .B1(n117), .A0N(ALU_OUT[1]), .A1N(n1), .Y(n141)
         );
  OAI2BB2X1M U128 ( .B0(n1), .B1(n116), .A0N(ALU_OUT[2]), .A1N(n1), .Y(n142)
         );
  OAI2BB2X1M U129 ( .B0(n1), .B1(n115), .A0N(ALU_OUT[3]), .A1N(n1), .Y(n143)
         );
  OAI2BB2X1M U130 ( .B0(n1), .B1(n103), .A0N(ALU_OUT[4]), .A1N(n1), .Y(n144)
         );
  OAI2BB2X1M U131 ( .B0(n1), .B1(n93), .A0N(ALU_OUT[5]), .A1N(n1), .Y(n145) );
  OAI2BB2X1M U132 ( .B0(n1), .B1(n90), .A0N(ALU_OUT[6]), .A1N(n1), .Y(n146) );
  OAI2BB2X1M U133 ( .B0(n1), .B1(n83), .A0N(ALU_OUT[7]), .A1N(n1), .Y(n147) );
  OAI2BB2X1M U134 ( .B0(n1), .B1(n82), .A0N(ALU_OUT[8]), .A1N(n1), .Y(n148) );
  OAI2BB2X1M U135 ( .B0(n1), .B1(n80), .A0N(ALU_OUT[9]), .A1N(n1), .Y(n149) );
  OAI2BB2X1M U136 ( .B0(n1), .B1(n75), .A0N(ALU_OUT[10]), .A1N(n1), .Y(n150)
         );
  OAI2BB2X1M U137 ( .B0(n1), .B1(n74), .A0N(ALU_OUT[11]), .A1N(n1), .Y(n151)
         );
  OAI2BB2X1M U138 ( .B0(n1), .B1(n73), .A0N(ALU_OUT[12]), .A1N(n1), .Y(n152)
         );
  OAI2BB2X1M U139 ( .B0(n1), .B1(n71), .A0N(ALU_OUT[13]), .A1N(n1), .Y(n153)
         );
  OAI2BB2X1M U140 ( .B0(n1), .B1(n70), .A0N(ALU_OUT[14]), .A1N(n1), .Y(n154)
         );
  OAI2BB2X1M U141 ( .B0(n1), .B1(n69), .A0N(ALU_OUT[15]), .A1N(n1), .Y(n155)
         );
  OAI2BB2X1M U142 ( .B0(n11), .B1(n68), .A0N(RdData[0]), .A1N(n11), .Y(n156)
         );
  OAI2BB2X1M U143 ( .B0(n11), .B1(n67), .A0N(RdData[1]), .A1N(n11), .Y(n157)
         );
  OAI2BB2X1M U144 ( .B0(n11), .B1(n66), .A0N(RdData[2]), .A1N(n11), .Y(n158)
         );
  OAI2BB2X1M U145 ( .B0(n11), .B1(n65), .A0N(RdData[3]), .A1N(n11), .Y(n159)
         );
  OAI2BB2X1M U146 ( .B0(n11), .B1(n64), .A0N(RdData[4]), .A1N(n11), .Y(n160)
         );
  OAI2BB2X1M U147 ( .B0(n11), .B1(n63), .A0N(RdData[5]), .A1N(n11), .Y(n161)
         );
  OAI2BB2X1M U148 ( .B0(n11), .B1(n61), .A0N(RdData[6]), .A1N(n11), .Y(n162)
         );
  OAI2BB2X1M U149 ( .B0(n11), .B1(n60), .A0N(RdData[7]), .A1N(n11), .Y(n163)
         );
  NAND3X2M U150 ( .A(n58), .B(n19), .C(n101), .Y(n92) );
  NAND3BX2M U151 ( .AN(n100), .B(RX_P_DATA[4]), .C(n102), .Y(n101) );
  NOR3X2M U152 ( .A(n126), .B(RX_P_DATA[6]), .C(RX_P_DATA[2]), .Y(n102) );
  NOR2BX2M U153 ( .AN(RdData_Valid), .B(n29), .Y(n20) );
  INVX2M U154 ( .A(RX_P_DATA[7]), .Y(n119) );
  INVX2M U155 ( .A(RX_P_DATA[6]), .Y(n120) );
  NAND4X2M U156 ( .A(RX_P_DATA[1]), .B(n16), .C(RX_P_DATA[3]), .D(n104), .Y(
        n100) );
  NOR3X2M U157 ( .A(n97), .B(n121), .C(n119), .Y(n104) );
  INVX2M U158 ( .A(RX_P_DATA[4]), .Y(n122) );
  INVX2M U159 ( .A(RX_P_DATA[5]), .Y(n121) );
  INVX2M U160 ( .A(OUT_Valid), .Y(n14) );
  INVX2M U161 ( .A(alu_result_r[0]), .Y(n118) );
  INVX2M U162 ( .A(alu_result_r[1]), .Y(n117) );
  INVX2M U163 ( .A(alu_result_r[2]), .Y(n116) );
  INVX2M U164 ( .A(alu_result_r[3]), .Y(n115) );
  INVX2M U165 ( .A(alu_result_r[4]), .Y(n103) );
  INVX2M U166 ( .A(alu_result_r[5]), .Y(n93) );
  INVX2M U167 ( .A(alu_result_r[6]), .Y(n90) );
  INVX2M U168 ( .A(alu_result_r[7]), .Y(n83) );
  INVX2M U169 ( .A(alu_result_r[8]), .Y(n82) );
  INVX2M U170 ( .A(alu_result_r[9]), .Y(n80) );
  INVX2M U171 ( .A(alu_result_r[10]), .Y(n75) );
  INVX2M U172 ( .A(alu_result_r[11]), .Y(n74) );
  INVX2M U173 ( .A(alu_result_r[12]), .Y(n73) );
  INVX2M U174 ( .A(alu_result_r[13]), .Y(n71) );
  INVX2M U175 ( .A(alu_result_r[14]), .Y(n70) );
  INVX2M U176 ( .A(alu_result_r[15]), .Y(n69) );
  INVX2M U177 ( .A(rd_result_r[0]), .Y(n68) );
  INVX2M U178 ( .A(rd_result_r[1]), .Y(n67) );
  INVX2M U179 ( .A(rd_result_r[2]), .Y(n66) );
  INVX2M U180 ( .A(rd_result_r[3]), .Y(n65) );
  INVX2M U181 ( .A(rd_result_r[4]), .Y(n64) );
  INVX2M U182 ( .A(rd_result_r[5]), .Y(n63) );
  INVX2M U183 ( .A(rd_result_r[6]), .Y(n61) );
  INVX2M U184 ( .A(rd_result_r[7]), .Y(n60) );
endmodule


module reg_file ( WrData, Address, WrEn, RdEn, CLK, rst, RdData, RdData_Valid, 
        REG0, REG1, REG2, REG3 );
  input [7:0] WrData;
  input [3:0] Address;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input WrEn, RdEn, CLK, rst;
  output RdData_Valid;
  wire   N12, N13, N14, N15, \Reg_file[4][7] , \Reg_file[4][6] ,
         \Reg_file[4][5] , \Reg_file[4][4] , \Reg_file[4][3] ,
         \Reg_file[4][2] , \Reg_file[4][1] , \Reg_file[4][0] ,
         \Reg_file[5][7] , \Reg_file[5][6] , \Reg_file[5][5] ,
         \Reg_file[5][4] , \Reg_file[5][3] , \Reg_file[5][2] ,
         \Reg_file[5][1] , \Reg_file[5][0] , \Reg_file[6][7] ,
         \Reg_file[6][6] , \Reg_file[6][5] , \Reg_file[6][4] ,
         \Reg_file[6][3] , \Reg_file[6][2] , \Reg_file[6][1] ,
         \Reg_file[6][0] , \Reg_file[7][7] , \Reg_file[7][6] ,
         \Reg_file[7][5] , \Reg_file[7][4] , \Reg_file[7][3] ,
         \Reg_file[7][2] , \Reg_file[7][1] , \Reg_file[7][0] ,
         \Reg_file[8][7] , \Reg_file[8][6] , \Reg_file[8][5] ,
         \Reg_file[8][4] , \Reg_file[8][3] , \Reg_file[8][2] ,
         \Reg_file[8][1] , \Reg_file[8][0] , \Reg_file[9][7] ,
         \Reg_file[9][6] , \Reg_file[9][5] , \Reg_file[9][4] ,
         \Reg_file[9][3] , \Reg_file[9][2] , \Reg_file[9][1] ,
         \Reg_file[9][0] , \Reg_file[10][7] , \Reg_file[10][6] ,
         \Reg_file[10][5] , \Reg_file[10][4] , \Reg_file[10][3] ,
         \Reg_file[10][2] , \Reg_file[10][1] , \Reg_file[10][0] ,
         \Reg_file[11][7] , \Reg_file[11][6] , \Reg_file[11][5] ,
         \Reg_file[11][4] , \Reg_file[11][3] , \Reg_file[11][2] ,
         \Reg_file[11][1] , \Reg_file[11][0] , \Reg_file[12][7] ,
         \Reg_file[12][6] , \Reg_file[12][5] , \Reg_file[12][4] ,
         \Reg_file[12][3] , \Reg_file[12][2] , \Reg_file[12][1] ,
         \Reg_file[12][0] , \Reg_file[13][7] , \Reg_file[13][6] ,
         \Reg_file[13][5] , \Reg_file[13][4] , \Reg_file[13][3] ,
         \Reg_file[13][2] , \Reg_file[13][1] , \Reg_file[13][0] ,
         \Reg_file[14][7] , \Reg_file[14][6] , \Reg_file[14][5] ,
         \Reg_file[14][4] , \Reg_file[14][3] , \Reg_file[14][2] ,
         \Reg_file[14][1] , \Reg_file[14][0] , \Reg_file[15][7] ,
         \Reg_file[15][6] , \Reg_file[15][5] , \Reg_file[15][4] ,
         \Reg_file[15][3] , \Reg_file[15][2] , \Reg_file[15][1] ,
         \Reg_file[15][0] , N52, N53, N54, N55, N56, N57, N58, N59, N60, N61,
         N62, N63, N64, N65, N66, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217,
         n218, n219, n220, n221, n222, n223, n224, n225, n226, n227, n228,
         n229, n230, n231, n232, n233, n234, n235, n236, n237, n238, n239,
         n240, n241, n242, n243, n244, n245, n246, n247, n248, n249, n250,
         n251, n252, n253, n254, n255, n256, n257, n258, n259, n260, n261,
         n262, n263, n264, n265, n266, n267, n268, n269, n270, n271, n272,
         n273, n274, n275, n276, n277, n278, n279, n280, n281, n282, n283,
         n284, n285, n286, n287, n288, n289, n290, n291;
  assign N12 = Address[0];
  assign N13 = Address[1];
  assign N14 = Address[2];
  assign N15 = Address[3];

  DFFRQX2M \RdData_reg[7]  ( .D(N66), .CK(CLK), .RN(n268), .Q(RdData[7]) );
  DFFRQX2M \RdData_reg[6]  ( .D(N65), .CK(CLK), .RN(n272), .Q(RdData[6]) );
  DFFRQX2M \RdData_reg[5]  ( .D(N64), .CK(CLK), .RN(n269), .Q(RdData[5]) );
  DFFRQX2M \RdData_reg[4]  ( .D(N63), .CK(CLK), .RN(n269), .Q(RdData[4]) );
  DFFRQX2M \RdData_reg[3]  ( .D(N62), .CK(CLK), .RN(n269), .Q(RdData[3]) );
  DFFRQX2M \RdData_reg[2]  ( .D(N61), .CK(CLK), .RN(n269), .Q(RdData[2]) );
  DFFRQX2M \RdData_reg[1]  ( .D(N60), .CK(CLK), .RN(n269), .Q(RdData[1]) );
  DFFRQX2M \RdData_reg[0]  ( .D(N59), .CK(CLK), .RN(n268), .Q(RdData[0]) );
  DFFRQX2M \Reg_file_reg[5][7]  ( .D(n125), .CK(CLK), .RN(n270), .Q(
        \Reg_file[5][7] ) );
  DFFRQX2M \Reg_file_reg[5][6]  ( .D(n124), .CK(CLK), .RN(n270), .Q(
        \Reg_file[5][6] ) );
  DFFRQX2M \Reg_file_reg[5][5]  ( .D(n123), .CK(CLK), .RN(n272), .Q(
        \Reg_file[5][5] ) );
  DFFRQX2M \Reg_file_reg[5][4]  ( .D(n122), .CK(CLK), .RN(n272), .Q(
        \Reg_file[5][4] ) );
  DFFRQX2M \Reg_file_reg[5][3]  ( .D(n121), .CK(CLK), .RN(n272), .Q(
        \Reg_file[5][3] ) );
  DFFRQX2M \Reg_file_reg[5][2]  ( .D(n120), .CK(CLK), .RN(n272), .Q(
        \Reg_file[5][2] ) );
  DFFRQX2M \Reg_file_reg[5][1]  ( .D(n119), .CK(CLK), .RN(n272), .Q(
        \Reg_file[5][1] ) );
  DFFRQX2M \Reg_file_reg[5][0]  ( .D(n118), .CK(CLK), .RN(n271), .Q(
        \Reg_file[5][0] ) );
  DFFRQX2M \Reg_file_reg[7][7]  ( .D(n109), .CK(CLK), .RN(n271), .Q(
        \Reg_file[7][7] ) );
  DFFRQX2M \Reg_file_reg[7][6]  ( .D(n108), .CK(CLK), .RN(n273), .Q(
        \Reg_file[7][6] ) );
  DFFRQX2M \Reg_file_reg[7][5]  ( .D(n107), .CK(CLK), .RN(n273), .Q(
        \Reg_file[7][5] ) );
  DFFRQX2M \Reg_file_reg[7][4]  ( .D(n106), .CK(CLK), .RN(n273), .Q(
        \Reg_file[7][4] ) );
  DFFRQX2M \Reg_file_reg[7][3]  ( .D(n105), .CK(CLK), .RN(n273), .Q(
        \Reg_file[7][3] ) );
  DFFRQX2M \Reg_file_reg[7][2]  ( .D(n104), .CK(CLK), .RN(n273), .Q(
        \Reg_file[7][2] ) );
  DFFRQX2M \Reg_file_reg[7][1]  ( .D(n103), .CK(CLK), .RN(n272), .Q(
        \Reg_file[7][1] ) );
  DFFRQX2M \Reg_file_reg[7][0]  ( .D(n102), .CK(CLK), .RN(n272), .Q(
        \Reg_file[7][0] ) );
  DFFRQX2M \Reg_file_reg[9][7]  ( .D(n93), .CK(CLK), .RN(n274), .Q(
        \Reg_file[9][7] ) );
  DFFRQX2M \Reg_file_reg[9][6]  ( .D(n92), .CK(CLK), .RN(n274), .Q(
        \Reg_file[9][6] ) );
  DFFRQX2M \Reg_file_reg[9][5]  ( .D(n91), .CK(CLK), .RN(n274), .Q(
        \Reg_file[9][5] ) );
  DFFRQX2M \Reg_file_reg[9][4]  ( .D(n90), .CK(CLK), .RN(n274), .Q(
        \Reg_file[9][4] ) );
  DFFRQX2M \Reg_file_reg[9][3]  ( .D(n89), .CK(CLK), .RN(n274), .Q(
        \Reg_file[9][3] ) );
  DFFRQX2M \Reg_file_reg[9][2]  ( .D(n88), .CK(CLK), .RN(n273), .Q(
        \Reg_file[9][2] ) );
  DFFRQX2M \Reg_file_reg[9][1]  ( .D(n87), .CK(CLK), .RN(n273), .Q(
        \Reg_file[9][1] ) );
  DFFRQX2M \Reg_file_reg[9][0]  ( .D(n86), .CK(CLK), .RN(n273), .Q(
        \Reg_file[9][0] ) );
  DFFRQX2M \Reg_file_reg[11][7]  ( .D(n77), .CK(CLK), .RN(n275), .Q(
        \Reg_file[11][7] ) );
  DFFRQX2M \Reg_file_reg[11][6]  ( .D(n76), .CK(CLK), .RN(n275), .Q(
        \Reg_file[11][6] ) );
  DFFRQX2M \Reg_file_reg[11][5]  ( .D(n75), .CK(CLK), .RN(n275), .Q(
        \Reg_file[11][5] ) );
  DFFRQX2M \Reg_file_reg[11][4]  ( .D(n74), .CK(CLK), .RN(n275), .Q(
        \Reg_file[11][4] ) );
  DFFRQX2M \Reg_file_reg[11][3]  ( .D(n73), .CK(CLK), .RN(n274), .Q(
        \Reg_file[11][3] ) );
  DFFRQX2M \Reg_file_reg[11][2]  ( .D(n72), .CK(CLK), .RN(n274), .Q(
        \Reg_file[11][2] ) );
  DFFRQX2M \Reg_file_reg[11][1]  ( .D(n71), .CK(CLK), .RN(n274), .Q(
        \Reg_file[11][1] ) );
  DFFRQX2M \Reg_file_reg[11][0]  ( .D(n70), .CK(CLK), .RN(n274), .Q(
        \Reg_file[11][0] ) );
  DFFRQX2M \Reg_file_reg[13][7]  ( .D(n61), .CK(CLK), .RN(n276), .Q(
        \Reg_file[13][7] ) );
  DFFRQX2M \Reg_file_reg[13][6]  ( .D(n60), .CK(CLK), .RN(n275), .Q(
        \Reg_file[13][6] ) );
  DFFRQX2M \Reg_file_reg[13][5]  ( .D(n59), .CK(CLK), .RN(n276), .Q(
        \Reg_file[13][5] ) );
  DFFRQX2M \Reg_file_reg[13][4]  ( .D(n58), .CK(CLK), .RN(n275), .Q(
        \Reg_file[13][4] ) );
  DFFRQX2M \Reg_file_reg[13][3]  ( .D(n57), .CK(CLK), .RN(n276), .Q(
        \Reg_file[13][3] ) );
  DFFRQX2M \Reg_file_reg[13][2]  ( .D(n56), .CK(CLK), .RN(n275), .Q(
        \Reg_file[13][2] ) );
  DFFRQX2M \Reg_file_reg[13][1]  ( .D(n55), .CK(CLK), .RN(n275), .Q(
        \Reg_file[13][1] ) );
  DFFRQX2M \Reg_file_reg[13][0]  ( .D(n54), .CK(CLK), .RN(n275), .Q(
        \Reg_file[13][0] ) );
  DFFRQX2M \Reg_file_reg[15][7]  ( .D(n45), .CK(CLK), .RN(n277), .Q(
        \Reg_file[15][7] ) );
  DFFRQX2M \Reg_file_reg[15][6]  ( .D(n44), .CK(CLK), .RN(n276), .Q(
        \Reg_file[15][6] ) );
  DFFRQX2M \Reg_file_reg[15][5]  ( .D(n43), .CK(CLK), .RN(n276), .Q(
        \Reg_file[15][5] ) );
  DFFRQX2M \Reg_file_reg[15][4]  ( .D(n42), .CK(CLK), .RN(n276), .Q(
        \Reg_file[15][4] ) );
  DFFRQX2M \Reg_file_reg[15][3]  ( .D(n41), .CK(CLK), .RN(n276), .Q(
        \Reg_file[15][3] ) );
  DFFRQX2M \Reg_file_reg[15][2]  ( .D(n40), .CK(CLK), .RN(n276), .Q(
        \Reg_file[15][2] ) );
  DFFRQX2M \Reg_file_reg[15][1]  ( .D(n39), .CK(CLK), .RN(n276), .Q(
        \Reg_file[15][1] ) );
  DFFRQX2M \Reg_file_reg[15][0]  ( .D(n38), .CK(CLK), .RN(n273), .Q(
        \Reg_file[15][0] ) );
  DFFRQX2M \Reg_file_reg[4][7]  ( .D(n133), .CK(CLK), .RN(n270), .Q(
        \Reg_file[4][7] ) );
  DFFRQX2M \Reg_file_reg[4][6]  ( .D(n132), .CK(CLK), .RN(n270), .Q(
        \Reg_file[4][6] ) );
  DFFRQX2M \Reg_file_reg[4][5]  ( .D(n131), .CK(CLK), .RN(n270), .Q(
        \Reg_file[4][5] ) );
  DFFRQX2M \Reg_file_reg[4][4]  ( .D(n130), .CK(CLK), .RN(n270), .Q(
        \Reg_file[4][4] ) );
  DFFRQX2M \Reg_file_reg[4][3]  ( .D(n129), .CK(CLK), .RN(n270), .Q(
        \Reg_file[4][3] ) );
  DFFRQX2M \Reg_file_reg[4][2]  ( .D(n128), .CK(CLK), .RN(n270), .Q(
        \Reg_file[4][2] ) );
  DFFRQX2M \Reg_file_reg[4][1]  ( .D(n127), .CK(CLK), .RN(n270), .Q(
        \Reg_file[4][1] ) );
  DFFRQX2M \Reg_file_reg[4][0]  ( .D(n126), .CK(CLK), .RN(n270), .Q(
        \Reg_file[4][0] ) );
  DFFRQX2M \Reg_file_reg[6][7]  ( .D(n117), .CK(CLK), .RN(n271), .Q(
        \Reg_file[6][7] ) );
  DFFRQX2M \Reg_file_reg[6][6]  ( .D(n116), .CK(CLK), .RN(n271), .Q(
        \Reg_file[6][6] ) );
  DFFRQX2M \Reg_file_reg[6][5]  ( .D(n115), .CK(CLK), .RN(n271), .Q(
        \Reg_file[6][5] ) );
  DFFRQX2M \Reg_file_reg[6][4]  ( .D(n114), .CK(CLK), .RN(n271), .Q(
        \Reg_file[6][4] ) );
  DFFRQX2M \Reg_file_reg[6][3]  ( .D(n113), .CK(CLK), .RN(n271), .Q(
        \Reg_file[6][3] ) );
  DFFRQX2M \Reg_file_reg[6][2]  ( .D(n112), .CK(CLK), .RN(n271), .Q(
        \Reg_file[6][2] ) );
  DFFRQX2M \Reg_file_reg[6][1]  ( .D(n111), .CK(CLK), .RN(n271), .Q(
        \Reg_file[6][1] ) );
  DFFRQX2M \Reg_file_reg[6][0]  ( .D(n110), .CK(CLK), .RN(n271), .Q(
        \Reg_file[6][0] ) );
  DFFRQX2M \Reg_file_reg[8][7]  ( .D(n101), .CK(CLK), .RN(n272), .Q(
        \Reg_file[8][7] ) );
  DFFRQX2M \Reg_file_reg[8][6]  ( .D(n100), .CK(CLK), .RN(n272), .Q(
        \Reg_file[8][6] ) );
  DFFRQX2M \Reg_file_reg[8][5]  ( .D(n99), .CK(CLK), .RN(n272), .Q(
        \Reg_file[8][5] ) );
  DFFRQX2M \Reg_file_reg[8][4]  ( .D(n98), .CK(CLK), .RN(n272), .Q(
        \Reg_file[8][4] ) );
  DFFRQX2M \Reg_file_reg[8][3]  ( .D(n97), .CK(CLK), .RN(n272), .Q(
        \Reg_file[8][3] ) );
  DFFRQX2M \Reg_file_reg[8][2]  ( .D(n96), .CK(CLK), .RN(n272), .Q(
        \Reg_file[8][2] ) );
  DFFRQX2M \Reg_file_reg[8][1]  ( .D(n95), .CK(CLK), .RN(n272), .Q(
        \Reg_file[8][1] ) );
  DFFRQX2M \Reg_file_reg[8][0]  ( .D(n94), .CK(CLK), .RN(n274), .Q(
        \Reg_file[8][0] ) );
  DFFRQX2M \Reg_file_reg[10][7]  ( .D(n85), .CK(CLK), .RN(n273), .Q(
        \Reg_file[10][7] ) );
  DFFRQX2M \Reg_file_reg[10][6]  ( .D(n84), .CK(CLK), .RN(n273), .Q(
        \Reg_file[10][6] ) );
  DFFRQX2M \Reg_file_reg[10][5]  ( .D(n83), .CK(CLK), .RN(n273), .Q(
        \Reg_file[10][5] ) );
  DFFRQX2M \Reg_file_reg[10][4]  ( .D(n82), .CK(CLK), .RN(n273), .Q(
        \Reg_file[10][4] ) );
  DFFRQX2M \Reg_file_reg[10][3]  ( .D(n81), .CK(CLK), .RN(n273), .Q(
        \Reg_file[10][3] ) );
  DFFRQX2M \Reg_file_reg[10][2]  ( .D(n80), .CK(CLK), .RN(n273), .Q(
        \Reg_file[10][2] ) );
  DFFRQX2M \Reg_file_reg[10][1]  ( .D(n79), .CK(CLK), .RN(n275), .Q(
        \Reg_file[10][1] ) );
  DFFRQX2M \Reg_file_reg[10][0]  ( .D(n78), .CK(CLK), .RN(n275), .Q(
        \Reg_file[10][0] ) );
  DFFRQX2M \Reg_file_reg[12][7]  ( .D(n69), .CK(CLK), .RN(n274), .Q(
        \Reg_file[12][7] ) );
  DFFRQX2M \Reg_file_reg[12][6]  ( .D(n68), .CK(CLK), .RN(n274), .Q(
        \Reg_file[12][6] ) );
  DFFRQX2M \Reg_file_reg[12][5]  ( .D(n67), .CK(CLK), .RN(n274), .Q(
        \Reg_file[12][5] ) );
  DFFRQX2M \Reg_file_reg[12][4]  ( .D(n66), .CK(CLK), .RN(n274), .Q(
        \Reg_file[12][4] ) );
  DFFRQX2M \Reg_file_reg[12][3]  ( .D(n65), .CK(CLK), .RN(n276), .Q(
        \Reg_file[12][3] ) );
  DFFRQX2M \Reg_file_reg[12][2]  ( .D(n64), .CK(CLK), .RN(n274), .Q(
        \Reg_file[12][2] ) );
  DFFRQX2M \Reg_file_reg[12][1]  ( .D(n63), .CK(CLK), .RN(n276), .Q(
        \Reg_file[12][1] ) );
  DFFRQX2M \Reg_file_reg[12][0]  ( .D(n62), .CK(CLK), .RN(n276), .Q(
        \Reg_file[12][0] ) );
  DFFRQX2M \Reg_file_reg[14][7]  ( .D(n53), .CK(CLK), .RN(n275), .Q(
        \Reg_file[14][7] ) );
  DFFRQX2M \Reg_file_reg[14][6]  ( .D(n52), .CK(CLK), .RN(n275), .Q(
        \Reg_file[14][6] ) );
  DFFRQX2M \Reg_file_reg[14][5]  ( .D(n51), .CK(CLK), .RN(n275), .Q(
        \Reg_file[14][5] ) );
  DFFRQX2M \Reg_file_reg[14][4]  ( .D(n50), .CK(CLK), .RN(n277), .Q(
        \Reg_file[14][4] ) );
  DFFRQX2M \Reg_file_reg[14][3]  ( .D(n49), .CK(CLK), .RN(n275), .Q(
        \Reg_file[14][3] ) );
  DFFRQX2M \Reg_file_reg[14][2]  ( .D(n48), .CK(CLK), .RN(n276), .Q(
        \Reg_file[14][2] ) );
  DFFRQX2M \Reg_file_reg[14][1]  ( .D(n47), .CK(CLK), .RN(n268), .Q(
        \Reg_file[14][1] ) );
  DFFRQX2M \Reg_file_reg[14][0]  ( .D(n46), .CK(CLK), .RN(n276), .Q(
        \Reg_file[14][0] ) );
  DFFRQX2M \Reg_file_reg[3][2]  ( .D(n136), .CK(CLK), .RN(n271), .Q(REG3[2])
         );
  DFFRQX2M \Reg_file_reg[3][3]  ( .D(n137), .CK(CLK), .RN(n271), .Q(REG3[3])
         );
  DFFRQX2M \Reg_file_reg[3][4]  ( .D(n138), .CK(CLK), .RN(n271), .Q(REG3[4])
         );
  DFFRQX2M \Reg_file_reg[3][7]  ( .D(n141), .CK(CLK), .RN(n269), .Q(REG3[7])
         );
  DFFSQX2M \Reg_file_reg[3][5]  ( .D(n139), .CK(CLK), .SN(n268), .Q(REG3[5])
         );
  DFFRQX2M RdData_Valid_reg ( .D(RdEn), .CK(CLK), .RN(n276), .Q(RdData_Valid)
         );
  DFFRQX2M \Reg_file_reg[3][6]  ( .D(n140), .CK(CLK), .RN(n269), .Q(REG3[6])
         );
  DFFSQX2M \Reg_file_reg[2][0]  ( .D(n142), .CK(CLK), .SN(n268), .Q(REG2[0])
         );
  DFFRQX2M \Reg_file_reg[2][1]  ( .D(n143), .CK(CLK), .RN(n269), .Q(REG2[1])
         );
  DFFRQX2M \Reg_file_reg[3][0]  ( .D(n134), .CK(CLK), .RN(n271), .Q(REG3[0])
         );
  DFFRQX2M \Reg_file_reg[3][1]  ( .D(n135), .CK(CLK), .RN(n271), .Q(REG3[1])
         );
  DFFRQX2M \Reg_file_reg[2][4]  ( .D(n146), .CK(CLK), .RN(n269), .Q(REG2[4])
         );
  DFFRQX2M \Reg_file_reg[2][2]  ( .D(n144), .CK(CLK), .RN(n269), .Q(REG2[2])
         );
  DFFRQX2M \Reg_file_reg[2][3]  ( .D(n145), .CK(CLK), .RN(n269), .Q(REG2[3])
         );
  DFFRQX2M \Reg_file_reg[0][1]  ( .D(n159), .CK(CLK), .RN(n268), .Q(REG0[1])
         );
  DFFRQX2M \Reg_file_reg[0][0]  ( .D(n158), .CK(CLK), .RN(n268), .Q(REG0[0])
         );
  DFFRQX2M \Reg_file_reg[0][2]  ( .D(n160), .CK(CLK), .RN(n268), .Q(REG0[2])
         );
  DFFRQX2M \Reg_file_reg[0][3]  ( .D(n161), .CK(CLK), .RN(n268), .Q(REG0[3])
         );
  DFFRQX2M \Reg_file_reg[0][4]  ( .D(n162), .CK(CLK), .RN(n268), .Q(REG0[4])
         );
  DFFRQX2M \Reg_file_reg[0][5]  ( .D(n163), .CK(CLK), .RN(n268), .Q(REG0[5])
         );
  DFFRQX2M \Reg_file_reg[0][7]  ( .D(n165), .CK(CLK), .RN(n268), .Q(REG0[7])
         );
  DFFRQX2M \Reg_file_reg[0][6]  ( .D(n164), .CK(CLK), .RN(n268), .Q(REG0[6])
         );
  DFFRQX2M \Reg_file_reg[1][6]  ( .D(n156), .CK(CLK), .RN(n270), .Q(REG1[6])
         );
  DFFRQX2M \Reg_file_reg[1][1]  ( .D(n151), .CK(CLK), .RN(n269), .Q(REG1[1])
         );
  DFFRQX2M \Reg_file_reg[1][5]  ( .D(n155), .CK(CLK), .RN(n270), .Q(REG1[5])
         );
  DFFRQX2M \Reg_file_reg[1][4]  ( .D(n154), .CK(CLK), .RN(n270), .Q(REG1[4])
         );
  DFFRQX2M \Reg_file_reg[1][7]  ( .D(n157), .CK(CLK), .RN(n268), .Q(REG1[7])
         );
  DFFRQX2M \Reg_file_reg[1][3]  ( .D(n153), .CK(CLK), .RN(n270), .Q(REG1[3])
         );
  DFFRQX2M \Reg_file_reg[1][2]  ( .D(n152), .CK(CLK), .RN(n270), .Q(REG1[2])
         );
  DFFRQX2M \Reg_file_reg[1][0]  ( .D(n150), .CK(CLK), .RN(n269), .Q(REG1[0])
         );
  DFFSQX2M \Reg_file_reg[2][7]  ( .D(n149), .CK(CLK), .SN(n268), .Q(REG2[7])
         );
  DFFRQX2M \Reg_file_reg[2][6]  ( .D(n148), .CK(CLK), .RN(n269), .Q(REG2[6])
         );
  DFFRQX2M \Reg_file_reg[2][5]  ( .D(n147), .CK(CLK), .RN(n269), .Q(REG2[5])
         );
  NOR2X2M U3 ( .A(N13), .B(N14), .Y(n24) );
  NOR2X2M U4 ( .A(n261), .B(N14), .Y(n21) );
  NOR2X2M U5 ( .A(n291), .B(N13), .Y(n18) );
  INVX2M U6 ( .A(n264), .Y(n265) );
  INVX2M U7 ( .A(n1), .Y(n263) );
  NAND2X2M U8 ( .A(n16), .B(n13), .Y(n15) );
  NAND2X2M U9 ( .A(n30), .B(n13), .Y(n29) );
  OR2X2M U10 ( .A(n261), .B(n262), .Y(n1) );
  BUFX2M U11 ( .A(n4), .Y(n264) );
  INVX2M U12 ( .A(n3), .Y(n267) );
  INVX2M U13 ( .A(n2), .Y(n266) );
  NOR2X2M U14 ( .A(n291), .B(n261), .Y(n13) );
  NAND2X2M U15 ( .A(n18), .B(n14), .Y(n17) );
  NAND2X2M U16 ( .A(n18), .B(n16), .Y(n19) );
  NAND2X2M U17 ( .A(n21), .B(n14), .Y(n20) );
  NAND2X2M U18 ( .A(n21), .B(n16), .Y(n22) );
  NAND2X2M U19 ( .A(n24), .B(n14), .Y(n23) );
  NAND2X2M U20 ( .A(n24), .B(n16), .Y(n26) );
  NAND2X2M U21 ( .A(n28), .B(n18), .Y(n31) );
  NAND2X2M U22 ( .A(n30), .B(n18), .Y(n32) );
  NAND2X2M U23 ( .A(n28), .B(n21), .Y(n33) );
  NAND2X2M U24 ( .A(n30), .B(n21), .Y(n34) );
  NAND2X2M U25 ( .A(n28), .B(n24), .Y(n35) );
  NAND2X2M U26 ( .A(n30), .B(n24), .Y(n37) );
  NAND2X2M U27 ( .A(n28), .B(n13), .Y(n27) );
  NAND2X2M U28 ( .A(n13), .B(n14), .Y(n12) );
  AND2X2M U29 ( .A(n25), .B(n262), .Y(n16) );
  AND2X2M U30 ( .A(n36), .B(n262), .Y(n30) );
  OR2X2M U31 ( .A(n262), .B(N13), .Y(n2) );
  INVX2M U32 ( .A(N12), .Y(n262) );
  OR2X2M U33 ( .A(N12), .B(N13), .Y(n3) );
  OR2X2M U34 ( .A(n261), .B(N12), .Y(n4) );
  INVX2M U35 ( .A(N13), .Y(n261) );
  INVX2M U36 ( .A(N14), .Y(n291) );
  AND2X2M U37 ( .A(n25), .B(N12), .Y(n14) );
  AND2X2M U38 ( .A(n36), .B(N12), .Y(n28) );
  NOR2BX2M U39 ( .AN(WrEn), .B(N15), .Y(n36) );
  INVX2M U40 ( .A(N15), .Y(n260) );
  AND2X2M U41 ( .A(WrEn), .B(N15), .Y(n25) );
  BUFX2M U42 ( .A(n282), .Y(n268) );
  BUFX2M U43 ( .A(n279), .Y(n275) );
  BUFX2M U44 ( .A(n279), .Y(n274) );
  BUFX2M U45 ( .A(n280), .Y(n273) );
  BUFX2M U46 ( .A(n281), .Y(n271) );
  BUFX2M U47 ( .A(n281), .Y(n270) );
  BUFX2M U48 ( .A(n282), .Y(n269) );
  BUFX2M U49 ( .A(n280), .Y(n272) );
  BUFX2M U50 ( .A(n278), .Y(n276) );
  BUFX2M U51 ( .A(n278), .Y(n277) );
  NOR2BX2M U52 ( .AN(RdEn), .B(n5), .Y(N66) );
  NOR4X1M U53 ( .A(n259), .B(n258), .C(n257), .D(n256), .Y(n5) );
  AND2X2M U54 ( .A(N55), .B(RdEn), .Y(N62) );
  AND2X2M U55 ( .A(N54), .B(RdEn), .Y(N63) );
  AND2X2M U56 ( .A(N53), .B(RdEn), .Y(N64) );
  AND2X2M U57 ( .A(N52), .B(RdEn), .Y(N65) );
  AND2X2M U58 ( .A(N58), .B(RdEn), .Y(N59) );
  AND2X2M U59 ( .A(N57), .B(RdEn), .Y(N60) );
  AND2X2M U60 ( .A(N56), .B(RdEn), .Y(N61) );
  INVX2M U61 ( .A(WrData[0]), .Y(n283) );
  INVX2M U62 ( .A(WrData[1]), .Y(n284) );
  INVX2M U63 ( .A(WrData[2]), .Y(n285) );
  INVX2M U64 ( .A(WrData[3]), .Y(n286) );
  INVX2M U65 ( .A(WrData[4]), .Y(n287) );
  INVX2M U66 ( .A(WrData[5]), .Y(n288) );
  INVX2M U67 ( .A(WrData[6]), .Y(n289) );
  INVX2M U68 ( .A(WrData[7]), .Y(n290) );
  BUFX2M U69 ( .A(rst), .Y(n279) );
  BUFX2M U70 ( .A(rst), .Y(n281) );
  BUFX2M U71 ( .A(rst), .Y(n280) );
  BUFX2M U72 ( .A(rst), .Y(n282) );
  BUFX2M U73 ( .A(rst), .Y(n278) );
  OAI2BB2X1M U74 ( .B0(n12), .B1(n283), .A0N(\Reg_file[15][0] ), .A1N(n12), 
        .Y(n38) );
  OAI2BB2X1M U75 ( .B0(n12), .B1(n284), .A0N(\Reg_file[15][1] ), .A1N(n12), 
        .Y(n39) );
  OAI2BB2X1M U76 ( .B0(n12), .B1(n285), .A0N(\Reg_file[15][2] ), .A1N(n12), 
        .Y(n40) );
  OAI2BB2X1M U77 ( .B0(n12), .B1(n286), .A0N(\Reg_file[15][3] ), .A1N(n12), 
        .Y(n41) );
  OAI2BB2X1M U78 ( .B0(n12), .B1(n287), .A0N(\Reg_file[15][4] ), .A1N(n12), 
        .Y(n42) );
  OAI2BB2X1M U79 ( .B0(n12), .B1(n288), .A0N(\Reg_file[15][5] ), .A1N(n12), 
        .Y(n43) );
  OAI2BB2X1M U80 ( .B0(n12), .B1(n289), .A0N(\Reg_file[15][6] ), .A1N(n12), 
        .Y(n44) );
  OAI2BB2X1M U81 ( .B0(n12), .B1(n290), .A0N(\Reg_file[15][7] ), .A1N(n12), 
        .Y(n45) );
  OAI2BB2X1M U82 ( .B0(n283), .B1(n17), .A0N(\Reg_file[13][0] ), .A1N(n17), 
        .Y(n54) );
  OAI2BB2X1M U83 ( .B0(n284), .B1(n17), .A0N(\Reg_file[13][1] ), .A1N(n17), 
        .Y(n55) );
  OAI2BB2X1M U84 ( .B0(n285), .B1(n17), .A0N(\Reg_file[13][2] ), .A1N(n17), 
        .Y(n56) );
  OAI2BB2X1M U85 ( .B0(n286), .B1(n17), .A0N(\Reg_file[13][3] ), .A1N(n17), 
        .Y(n57) );
  OAI2BB2X1M U86 ( .B0(n287), .B1(n17), .A0N(\Reg_file[13][4] ), .A1N(n17), 
        .Y(n58) );
  OAI2BB2X1M U87 ( .B0(n288), .B1(n17), .A0N(\Reg_file[13][5] ), .A1N(n17), 
        .Y(n59) );
  OAI2BB2X1M U88 ( .B0(n289), .B1(n17), .A0N(\Reg_file[13][6] ), .A1N(n17), 
        .Y(n60) );
  OAI2BB2X1M U89 ( .B0(n290), .B1(n17), .A0N(\Reg_file[13][7] ), .A1N(n17), 
        .Y(n61) );
  OAI2BB2X1M U90 ( .B0(n283), .B1(n19), .A0N(\Reg_file[12][0] ), .A1N(n19), 
        .Y(n62) );
  OAI2BB2X1M U91 ( .B0(n284), .B1(n19), .A0N(\Reg_file[12][1] ), .A1N(n19), 
        .Y(n63) );
  OAI2BB2X1M U92 ( .B0(n285), .B1(n19), .A0N(\Reg_file[12][2] ), .A1N(n19), 
        .Y(n64) );
  OAI2BB2X1M U93 ( .B0(n286), .B1(n19), .A0N(\Reg_file[12][3] ), .A1N(n19), 
        .Y(n65) );
  OAI2BB2X1M U94 ( .B0(n287), .B1(n19), .A0N(\Reg_file[12][4] ), .A1N(n19), 
        .Y(n66) );
  OAI2BB2X1M U95 ( .B0(n288), .B1(n19), .A0N(\Reg_file[12][5] ), .A1N(n19), 
        .Y(n67) );
  OAI2BB2X1M U96 ( .B0(n289), .B1(n19), .A0N(\Reg_file[12][6] ), .A1N(n19), 
        .Y(n68) );
  OAI2BB2X1M U97 ( .B0(n290), .B1(n19), .A0N(\Reg_file[12][7] ), .A1N(n19), 
        .Y(n69) );
  OAI2BB2X1M U98 ( .B0(n283), .B1(n20), .A0N(\Reg_file[11][0] ), .A1N(n20), 
        .Y(n70) );
  OAI2BB2X1M U99 ( .B0(n284), .B1(n20), .A0N(\Reg_file[11][1] ), .A1N(n20), 
        .Y(n71) );
  OAI2BB2X1M U100 ( .B0(n285), .B1(n20), .A0N(\Reg_file[11][2] ), .A1N(n20), 
        .Y(n72) );
  OAI2BB2X1M U101 ( .B0(n286), .B1(n20), .A0N(\Reg_file[11][3] ), .A1N(n20), 
        .Y(n73) );
  OAI2BB2X1M U102 ( .B0(n287), .B1(n20), .A0N(\Reg_file[11][4] ), .A1N(n20), 
        .Y(n74) );
  OAI2BB2X1M U103 ( .B0(n288), .B1(n20), .A0N(\Reg_file[11][5] ), .A1N(n20), 
        .Y(n75) );
  OAI2BB2X1M U104 ( .B0(n289), .B1(n20), .A0N(\Reg_file[11][6] ), .A1N(n20), 
        .Y(n76) );
  OAI2BB2X1M U105 ( .B0(n290), .B1(n20), .A0N(\Reg_file[11][7] ), .A1N(n20), 
        .Y(n77) );
  OAI2BB2X1M U106 ( .B0(n283), .B1(n22), .A0N(\Reg_file[10][0] ), .A1N(n22), 
        .Y(n78) );
  OAI2BB2X1M U107 ( .B0(n284), .B1(n22), .A0N(\Reg_file[10][1] ), .A1N(n22), 
        .Y(n79) );
  OAI2BB2X1M U108 ( .B0(n285), .B1(n22), .A0N(\Reg_file[10][2] ), .A1N(n22), 
        .Y(n80) );
  OAI2BB2X1M U109 ( .B0(n286), .B1(n22), .A0N(\Reg_file[10][3] ), .A1N(n22), 
        .Y(n81) );
  OAI2BB2X1M U110 ( .B0(n287), .B1(n22), .A0N(\Reg_file[10][4] ), .A1N(n22), 
        .Y(n82) );
  OAI2BB2X1M U111 ( .B0(n288), .B1(n22), .A0N(\Reg_file[10][5] ), .A1N(n22), 
        .Y(n83) );
  OAI2BB2X1M U112 ( .B0(n289), .B1(n22), .A0N(\Reg_file[10][6] ), .A1N(n22), 
        .Y(n84) );
  OAI2BB2X1M U113 ( .B0(n290), .B1(n22), .A0N(\Reg_file[10][7] ), .A1N(n22), 
        .Y(n85) );
  OAI2BB2X1M U114 ( .B0(n283), .B1(n23), .A0N(\Reg_file[9][0] ), .A1N(n23), 
        .Y(n86) );
  OAI2BB2X1M U115 ( .B0(n284), .B1(n23), .A0N(\Reg_file[9][1] ), .A1N(n23), 
        .Y(n87) );
  OAI2BB2X1M U116 ( .B0(n285), .B1(n23), .A0N(\Reg_file[9][2] ), .A1N(n23), 
        .Y(n88) );
  OAI2BB2X1M U117 ( .B0(n286), .B1(n23), .A0N(\Reg_file[9][3] ), .A1N(n23), 
        .Y(n89) );
  OAI2BB2X1M U118 ( .B0(n287), .B1(n23), .A0N(\Reg_file[9][4] ), .A1N(n23), 
        .Y(n90) );
  OAI2BB2X1M U119 ( .B0(n288), .B1(n23), .A0N(\Reg_file[9][5] ), .A1N(n23), 
        .Y(n91) );
  OAI2BB2X1M U120 ( .B0(n289), .B1(n23), .A0N(\Reg_file[9][6] ), .A1N(n23), 
        .Y(n92) );
  OAI2BB2X1M U121 ( .B0(n290), .B1(n23), .A0N(\Reg_file[9][7] ), .A1N(n23), 
        .Y(n93) );
  OAI2BB2X1M U122 ( .B0(n283), .B1(n26), .A0N(\Reg_file[8][0] ), .A1N(n26), 
        .Y(n94) );
  OAI2BB2X1M U123 ( .B0(n284), .B1(n26), .A0N(\Reg_file[8][1] ), .A1N(n26), 
        .Y(n95) );
  OAI2BB2X1M U124 ( .B0(n285), .B1(n26), .A0N(\Reg_file[8][2] ), .A1N(n26), 
        .Y(n96) );
  OAI2BB2X1M U125 ( .B0(n286), .B1(n26), .A0N(\Reg_file[8][3] ), .A1N(n26), 
        .Y(n97) );
  OAI2BB2X1M U126 ( .B0(n287), .B1(n26), .A0N(\Reg_file[8][4] ), .A1N(n26), 
        .Y(n98) );
  OAI2BB2X1M U127 ( .B0(n288), .B1(n26), .A0N(\Reg_file[8][5] ), .A1N(n26), 
        .Y(n99) );
  OAI2BB2X1M U128 ( .B0(n289), .B1(n26), .A0N(\Reg_file[8][6] ), .A1N(n26), 
        .Y(n100) );
  OAI2BB2X1M U129 ( .B0(n290), .B1(n26), .A0N(\Reg_file[8][7] ), .A1N(n26), 
        .Y(n101) );
  OAI2BB2X1M U130 ( .B0(n283), .B1(n15), .A0N(\Reg_file[14][0] ), .A1N(n15), 
        .Y(n46) );
  OAI2BB2X1M U131 ( .B0(n284), .B1(n15), .A0N(\Reg_file[14][1] ), .A1N(n15), 
        .Y(n47) );
  OAI2BB2X1M U132 ( .B0(n285), .B1(n15), .A0N(\Reg_file[14][2] ), .A1N(n15), 
        .Y(n48) );
  OAI2BB2X1M U133 ( .B0(n286), .B1(n15), .A0N(\Reg_file[14][3] ), .A1N(n15), 
        .Y(n49) );
  OAI2BB2X1M U134 ( .B0(n287), .B1(n15), .A0N(\Reg_file[14][4] ), .A1N(n15), 
        .Y(n50) );
  OAI2BB2X1M U135 ( .B0(n288), .B1(n15), .A0N(\Reg_file[14][5] ), .A1N(n15), 
        .Y(n51) );
  OAI2BB2X1M U136 ( .B0(n289), .B1(n15), .A0N(\Reg_file[14][6] ), .A1N(n15), 
        .Y(n52) );
  OAI2BB2X1M U137 ( .B0(n290), .B1(n15), .A0N(\Reg_file[14][7] ), .A1N(n15), 
        .Y(n53) );
  OAI2BB2X1M U138 ( .B0(n283), .B1(n27), .A0N(\Reg_file[7][0] ), .A1N(n27), 
        .Y(n102) );
  OAI2BB2X1M U139 ( .B0(n284), .B1(n27), .A0N(\Reg_file[7][1] ), .A1N(n27), 
        .Y(n103) );
  OAI2BB2X1M U140 ( .B0(n285), .B1(n27), .A0N(\Reg_file[7][2] ), .A1N(n27), 
        .Y(n104) );
  OAI2BB2X1M U141 ( .B0(n286), .B1(n27), .A0N(\Reg_file[7][3] ), .A1N(n27), 
        .Y(n105) );
  OAI2BB2X1M U142 ( .B0(n287), .B1(n27), .A0N(\Reg_file[7][4] ), .A1N(n27), 
        .Y(n106) );
  OAI2BB2X1M U143 ( .B0(n288), .B1(n27), .A0N(\Reg_file[7][5] ), .A1N(n27), 
        .Y(n107) );
  OAI2BB2X1M U144 ( .B0(n289), .B1(n27), .A0N(\Reg_file[7][6] ), .A1N(n27), 
        .Y(n108) );
  OAI2BB2X1M U145 ( .B0(n290), .B1(n27), .A0N(\Reg_file[7][7] ), .A1N(n27), 
        .Y(n109) );
  OAI2BB2X1M U146 ( .B0(n283), .B1(n29), .A0N(\Reg_file[6][0] ), .A1N(n29), 
        .Y(n110) );
  OAI2BB2X1M U147 ( .B0(n284), .B1(n29), .A0N(\Reg_file[6][1] ), .A1N(n29), 
        .Y(n111) );
  OAI2BB2X1M U148 ( .B0(n285), .B1(n29), .A0N(\Reg_file[6][2] ), .A1N(n29), 
        .Y(n112) );
  OAI2BB2X1M U149 ( .B0(n286), .B1(n29), .A0N(\Reg_file[6][3] ), .A1N(n29), 
        .Y(n113) );
  OAI2BB2X1M U150 ( .B0(n287), .B1(n29), .A0N(\Reg_file[6][4] ), .A1N(n29), 
        .Y(n114) );
  OAI2BB2X1M U151 ( .B0(n288), .B1(n29), .A0N(\Reg_file[6][5] ), .A1N(n29), 
        .Y(n115) );
  OAI2BB2X1M U152 ( .B0(n289), .B1(n29), .A0N(\Reg_file[6][6] ), .A1N(n29), 
        .Y(n116) );
  OAI2BB2X1M U153 ( .B0(n290), .B1(n29), .A0N(\Reg_file[6][7] ), .A1N(n29), 
        .Y(n117) );
  OAI2BB2X1M U154 ( .B0(n283), .B1(n31), .A0N(\Reg_file[5][0] ), .A1N(n31), 
        .Y(n118) );
  OAI2BB2X1M U155 ( .B0(n284), .B1(n31), .A0N(\Reg_file[5][1] ), .A1N(n31), 
        .Y(n119) );
  OAI2BB2X1M U156 ( .B0(n285), .B1(n31), .A0N(\Reg_file[5][2] ), .A1N(n31), 
        .Y(n120) );
  OAI2BB2X1M U157 ( .B0(n286), .B1(n31), .A0N(\Reg_file[5][3] ), .A1N(n31), 
        .Y(n121) );
  OAI2BB2X1M U158 ( .B0(n287), .B1(n31), .A0N(\Reg_file[5][4] ), .A1N(n31), 
        .Y(n122) );
  OAI2BB2X1M U159 ( .B0(n288), .B1(n31), .A0N(\Reg_file[5][5] ), .A1N(n31), 
        .Y(n123) );
  OAI2BB2X1M U160 ( .B0(n289), .B1(n31), .A0N(\Reg_file[5][6] ), .A1N(n31), 
        .Y(n124) );
  OAI2BB2X1M U161 ( .B0(n290), .B1(n31), .A0N(\Reg_file[5][7] ), .A1N(n31), 
        .Y(n125) );
  OAI2BB2X1M U162 ( .B0(n283), .B1(n32), .A0N(\Reg_file[4][0] ), .A1N(n32), 
        .Y(n126) );
  OAI2BB2X1M U163 ( .B0(n284), .B1(n32), .A0N(\Reg_file[4][1] ), .A1N(n32), 
        .Y(n127) );
  OAI2BB2X1M U164 ( .B0(n285), .B1(n32), .A0N(\Reg_file[4][2] ), .A1N(n32), 
        .Y(n128) );
  OAI2BB2X1M U165 ( .B0(n286), .B1(n32), .A0N(\Reg_file[4][3] ), .A1N(n32), 
        .Y(n129) );
  OAI2BB2X1M U166 ( .B0(n287), .B1(n32), .A0N(\Reg_file[4][4] ), .A1N(n32), 
        .Y(n130) );
  OAI2BB2X1M U167 ( .B0(n288), .B1(n32), .A0N(\Reg_file[4][5] ), .A1N(n32), 
        .Y(n131) );
  OAI2BB2X1M U168 ( .B0(n289), .B1(n32), .A0N(\Reg_file[4][6] ), .A1N(n32), 
        .Y(n132) );
  OAI2BB2X1M U169 ( .B0(n290), .B1(n32), .A0N(\Reg_file[4][7] ), .A1N(n32), 
        .Y(n133) );
  OAI2BB2X1M U170 ( .B0(n283), .B1(n33), .A0N(REG3[0]), .A1N(n33), .Y(n134) );
  OAI2BB2X1M U171 ( .B0(n284), .B1(n33), .A0N(REG3[1]), .A1N(n33), .Y(n135) );
  OAI2BB2X1M U172 ( .B0(n285), .B1(n33), .A0N(REG3[2]), .A1N(n33), .Y(n136) );
  OAI2BB2X1M U173 ( .B0(n286), .B1(n33), .A0N(REG3[3]), .A1N(n33), .Y(n137) );
  OAI2BB2X1M U174 ( .B0(n287), .B1(n33), .A0N(REG3[4]), .A1N(n33), .Y(n138) );
  OAI2BB2X1M U175 ( .B0(n289), .B1(n33), .A0N(REG3[6]), .A1N(n33), .Y(n140) );
  OAI2BB2X1M U176 ( .B0(n290), .B1(n33), .A0N(REG3[7]), .A1N(n33), .Y(n141) );
  OAI2BB2X1M U177 ( .B0(n284), .B1(n34), .A0N(REG2[1]), .A1N(n34), .Y(n143) );
  OAI2BB2X1M U178 ( .B0(n285), .B1(n34), .A0N(REG2[2]), .A1N(n34), .Y(n144) );
  OAI2BB2X1M U179 ( .B0(n286), .B1(n34), .A0N(REG2[3]), .A1N(n34), .Y(n145) );
  OAI2BB2X1M U180 ( .B0(n287), .B1(n34), .A0N(REG2[4]), .A1N(n34), .Y(n146) );
  OAI2BB2X1M U181 ( .B0(n288), .B1(n34), .A0N(REG2[5]), .A1N(n34), .Y(n147) );
  OAI2BB2X1M U182 ( .B0(n289), .B1(n34), .A0N(REG2[6]), .A1N(n34), .Y(n148) );
  OAI2BB2X1M U183 ( .B0(n283), .B1(n35), .A0N(REG1[0]), .A1N(n35), .Y(n150) );
  OAI2BB2X1M U184 ( .B0(n284), .B1(n35), .A0N(REG1[1]), .A1N(n35), .Y(n151) );
  OAI2BB2X1M U185 ( .B0(n285), .B1(n35), .A0N(REG1[2]), .A1N(n35), .Y(n152) );
  OAI2BB2X1M U186 ( .B0(n286), .B1(n35), .A0N(REG1[3]), .A1N(n35), .Y(n153) );
  OAI2BB2X1M U187 ( .B0(n287), .B1(n35), .A0N(REG1[4]), .A1N(n35), .Y(n154) );
  OAI2BB2X1M U188 ( .B0(n288), .B1(n35), .A0N(REG1[5]), .A1N(n35), .Y(n155) );
  OAI2BB2X1M U189 ( .B0(n289), .B1(n35), .A0N(REG1[6]), .A1N(n35), .Y(n156) );
  OAI2BB2X1M U190 ( .B0(n290), .B1(n35), .A0N(REG1[7]), .A1N(n35), .Y(n157) );
  OAI2BB2X1M U191 ( .B0(n283), .B1(n37), .A0N(REG0[0]), .A1N(n37), .Y(n158) );
  OAI2BB2X1M U192 ( .B0(n284), .B1(n37), .A0N(REG0[1]), .A1N(n37), .Y(n159) );
  OAI2BB2X1M U193 ( .B0(n285), .B1(n37), .A0N(REG0[2]), .A1N(n37), .Y(n160) );
  OAI2BB2X1M U194 ( .B0(n286), .B1(n37), .A0N(REG0[3]), .A1N(n37), .Y(n161) );
  OAI2BB2X1M U195 ( .B0(n287), .B1(n37), .A0N(REG0[4]), .A1N(n37), .Y(n162) );
  OAI2BB2X1M U196 ( .B0(n288), .B1(n37), .A0N(REG0[5]), .A1N(n37), .Y(n163) );
  OAI2BB2X1M U197 ( .B0(n289), .B1(n37), .A0N(REG0[6]), .A1N(n37), .Y(n164) );
  OAI2BB2X1M U198 ( .B0(n290), .B1(n37), .A0N(REG0[7]), .A1N(n37), .Y(n165) );
  OAI2BB2X1M U199 ( .B0(n288), .B1(n33), .A0N(REG3[5]), .A1N(n33), .Y(n139) );
  OAI2BB2X1M U200 ( .B0(n283), .B1(n34), .A0N(REG2[0]), .A1N(n34), .Y(n142) );
  OAI2BB2X1M U201 ( .B0(n290), .B1(n34), .A0N(REG2[7]), .A1N(n34), .Y(n149) );
  AOI22X1M U202 ( .A0(\Reg_file[10][0] ), .A1(n265), .B0(\Reg_file[11][0] ), 
        .B1(n263), .Y(n7) );
  AOI22X1M U203 ( .A0(\Reg_file[8][0] ), .A1(n267), .B0(\Reg_file[9][0] ), 
        .B1(n266), .Y(n6) );
  CLKNAND2X2M U204 ( .A(N15), .B(n291), .Y(n244) );
  AOI21X1M U205 ( .A0(n7), .A1(n6), .B0(n244), .Y(n171) );
  AOI22X1M U206 ( .A0(\Reg_file[14][0] ), .A1(n265), .B0(\Reg_file[15][0] ), 
        .B1(n263), .Y(n9) );
  AOI22X1M U207 ( .A0(\Reg_file[12][0] ), .A1(n267), .B0(\Reg_file[13][0] ), 
        .B1(n266), .Y(n8) );
  CLKNAND2X2M U208 ( .A(N15), .B(N14), .Y(n247) );
  AOI21X1M U209 ( .A0(n9), .A1(n8), .B0(n247), .Y(n170) );
  AOI22X1M U210 ( .A0(REG2[0]), .A1(n265), .B0(REG3[0]), .B1(n263), .Y(n11) );
  AOI22X1M U211 ( .A0(REG0[0]), .A1(n267), .B0(REG1[0]), .B1(n266), .Y(n10) );
  CLKNAND2X2M U212 ( .A(n291), .B(n260), .Y(n250) );
  AOI21X1M U213 ( .A0(n11), .A1(n10), .B0(n250), .Y(n169) );
  AOI22X1M U214 ( .A0(\Reg_file[6][0] ), .A1(n265), .B0(\Reg_file[7][0] ), 
        .B1(n263), .Y(n167) );
  AOI22X1M U215 ( .A0(\Reg_file[4][0] ), .A1(n267), .B0(\Reg_file[5][0] ), 
        .B1(n266), .Y(n166) );
  CLKNAND2X2M U216 ( .A(N14), .B(n260), .Y(n253) );
  AOI21X1M U217 ( .A0(n167), .A1(n166), .B0(n253), .Y(n168) );
  OR4X1M U218 ( .A(n171), .B(n170), .C(n169), .D(n168), .Y(N58) );
  AOI22X1M U219 ( .A0(\Reg_file[10][1] ), .A1(n265), .B0(\Reg_file[11][1] ), 
        .B1(n263), .Y(n173) );
  AOI22X1M U220 ( .A0(\Reg_file[8][1] ), .A1(n267), .B0(\Reg_file[9][1] ), 
        .B1(n266), .Y(n172) );
  AOI21X1M U221 ( .A0(n173), .A1(n172), .B0(n244), .Y(n183) );
  AOI22X1M U222 ( .A0(\Reg_file[14][1] ), .A1(n265), .B0(\Reg_file[15][1] ), 
        .B1(n263), .Y(n175) );
  AOI22X1M U223 ( .A0(\Reg_file[12][1] ), .A1(n267), .B0(\Reg_file[13][1] ), 
        .B1(n266), .Y(n174) );
  AOI21X1M U224 ( .A0(n175), .A1(n174), .B0(n247), .Y(n182) );
  AOI22X1M U225 ( .A0(REG2[1]), .A1(n265), .B0(REG3[1]), .B1(n263), .Y(n177)
         );
  AOI22X1M U226 ( .A0(REG0[1]), .A1(n267), .B0(REG1[1]), .B1(n266), .Y(n176)
         );
  AOI21X1M U227 ( .A0(n177), .A1(n176), .B0(n250), .Y(n181) );
  AOI22X1M U228 ( .A0(\Reg_file[6][1] ), .A1(n265), .B0(\Reg_file[7][1] ), 
        .B1(n263), .Y(n179) );
  AOI22X1M U229 ( .A0(\Reg_file[4][1] ), .A1(n267), .B0(\Reg_file[5][1] ), 
        .B1(n266), .Y(n178) );
  AOI21X1M U230 ( .A0(n179), .A1(n178), .B0(n253), .Y(n180) );
  OR4X1M U231 ( .A(n183), .B(n182), .C(n181), .D(n180), .Y(N57) );
  AOI22X1M U232 ( .A0(\Reg_file[10][2] ), .A1(n265), .B0(\Reg_file[11][2] ), 
        .B1(n263), .Y(n185) );
  AOI22X1M U233 ( .A0(\Reg_file[8][2] ), .A1(n267), .B0(\Reg_file[9][2] ), 
        .B1(n266), .Y(n184) );
  AOI21X1M U234 ( .A0(n185), .A1(n184), .B0(n244), .Y(n195) );
  AOI22X1M U235 ( .A0(\Reg_file[14][2] ), .A1(n265), .B0(\Reg_file[15][2] ), 
        .B1(n263), .Y(n187) );
  AOI22X1M U236 ( .A0(\Reg_file[12][2] ), .A1(n267), .B0(\Reg_file[13][2] ), 
        .B1(n266), .Y(n186) );
  AOI21X1M U237 ( .A0(n187), .A1(n186), .B0(n247), .Y(n194) );
  AOI22X1M U238 ( .A0(REG2[2]), .A1(n265), .B0(REG3[2]), .B1(n263), .Y(n189)
         );
  AOI22X1M U239 ( .A0(REG0[2]), .A1(n267), .B0(REG1[2]), .B1(n266), .Y(n188)
         );
  AOI21X1M U240 ( .A0(n189), .A1(n188), .B0(n250), .Y(n193) );
  AOI22X1M U241 ( .A0(\Reg_file[6][2] ), .A1(n265), .B0(\Reg_file[7][2] ), 
        .B1(n263), .Y(n191) );
  AOI22X1M U242 ( .A0(\Reg_file[4][2] ), .A1(n267), .B0(\Reg_file[5][2] ), 
        .B1(n266), .Y(n190) );
  AOI21X1M U243 ( .A0(n191), .A1(n190), .B0(n253), .Y(n192) );
  OR4X1M U244 ( .A(n195), .B(n194), .C(n193), .D(n192), .Y(N56) );
  AOI22X1M U245 ( .A0(\Reg_file[10][3] ), .A1(n265), .B0(\Reg_file[11][3] ), 
        .B1(n263), .Y(n197) );
  AOI22X1M U246 ( .A0(\Reg_file[8][3] ), .A1(n267), .B0(\Reg_file[9][3] ), 
        .B1(n266), .Y(n196) );
  AOI21X1M U247 ( .A0(n197), .A1(n196), .B0(n244), .Y(n207) );
  AOI22X1M U248 ( .A0(\Reg_file[14][3] ), .A1(n265), .B0(\Reg_file[15][3] ), 
        .B1(n263), .Y(n199) );
  AOI22X1M U249 ( .A0(\Reg_file[12][3] ), .A1(n267), .B0(\Reg_file[13][3] ), 
        .B1(n266), .Y(n198) );
  AOI21X1M U250 ( .A0(n199), .A1(n198), .B0(n247), .Y(n206) );
  AOI22X1M U251 ( .A0(REG2[3]), .A1(n265), .B0(REG3[3]), .B1(n263), .Y(n201)
         );
  AOI22X1M U252 ( .A0(REG0[3]), .A1(n267), .B0(REG1[3]), .B1(n266), .Y(n200)
         );
  AOI21X1M U253 ( .A0(n201), .A1(n200), .B0(n250), .Y(n205) );
  AOI22X1M U254 ( .A0(\Reg_file[6][3] ), .A1(n265), .B0(\Reg_file[7][3] ), 
        .B1(n263), .Y(n203) );
  AOI22X1M U255 ( .A0(\Reg_file[4][3] ), .A1(n267), .B0(\Reg_file[5][3] ), 
        .B1(n266), .Y(n202) );
  AOI21X1M U256 ( .A0(n203), .A1(n202), .B0(n253), .Y(n204) );
  OR4X1M U257 ( .A(n207), .B(n206), .C(n205), .D(n204), .Y(N55) );
  AOI22X1M U258 ( .A0(\Reg_file[10][4] ), .A1(n265), .B0(\Reg_file[11][4] ), 
        .B1(n263), .Y(n209) );
  AOI22X1M U259 ( .A0(\Reg_file[8][4] ), .A1(n267), .B0(\Reg_file[9][4] ), 
        .B1(n266), .Y(n208) );
  AOI21X1M U260 ( .A0(n209), .A1(n208), .B0(n244), .Y(n219) );
  AOI22X1M U261 ( .A0(\Reg_file[14][4] ), .A1(n265), .B0(\Reg_file[15][4] ), 
        .B1(n263), .Y(n211) );
  AOI22X1M U262 ( .A0(\Reg_file[12][4] ), .A1(n267), .B0(\Reg_file[13][4] ), 
        .B1(n266), .Y(n210) );
  AOI21X1M U263 ( .A0(n211), .A1(n210), .B0(n247), .Y(n218) );
  AOI22X1M U264 ( .A0(REG2[4]), .A1(n265), .B0(REG3[4]), .B1(n263), .Y(n213)
         );
  AOI22X1M U265 ( .A0(REG0[4]), .A1(n267), .B0(REG1[4]), .B1(n266), .Y(n212)
         );
  AOI21X1M U266 ( .A0(n213), .A1(n212), .B0(n250), .Y(n217) );
  AOI22X1M U267 ( .A0(\Reg_file[6][4] ), .A1(n265), .B0(\Reg_file[7][4] ), 
        .B1(n263), .Y(n215) );
  AOI22X1M U268 ( .A0(\Reg_file[4][4] ), .A1(n267), .B0(\Reg_file[5][4] ), 
        .B1(n266), .Y(n214) );
  AOI21X1M U269 ( .A0(n215), .A1(n214), .B0(n253), .Y(n216) );
  OR4X1M U270 ( .A(n219), .B(n218), .C(n217), .D(n216), .Y(N54) );
  AOI22X1M U271 ( .A0(\Reg_file[10][5] ), .A1(n265), .B0(\Reg_file[11][5] ), 
        .B1(n263), .Y(n221) );
  AOI22X1M U272 ( .A0(\Reg_file[8][5] ), .A1(n267), .B0(\Reg_file[9][5] ), 
        .B1(n266), .Y(n220) );
  AOI21X1M U273 ( .A0(n221), .A1(n220), .B0(n244), .Y(n231) );
  AOI22X1M U274 ( .A0(\Reg_file[14][5] ), .A1(n265), .B0(\Reg_file[15][5] ), 
        .B1(n263), .Y(n223) );
  AOI22X1M U275 ( .A0(\Reg_file[12][5] ), .A1(n267), .B0(\Reg_file[13][5] ), 
        .B1(n266), .Y(n222) );
  AOI21X1M U276 ( .A0(n223), .A1(n222), .B0(n247), .Y(n230) );
  AOI22X1M U277 ( .A0(REG2[5]), .A1(n265), .B0(REG3[5]), .B1(n263), .Y(n225)
         );
  AOI22X1M U278 ( .A0(REG0[5]), .A1(n267), .B0(REG1[5]), .B1(n266), .Y(n224)
         );
  AOI21X1M U279 ( .A0(n225), .A1(n224), .B0(n250), .Y(n229) );
  AOI22X1M U280 ( .A0(\Reg_file[6][5] ), .A1(n265), .B0(\Reg_file[7][5] ), 
        .B1(n263), .Y(n227) );
  AOI22X1M U281 ( .A0(\Reg_file[4][5] ), .A1(n267), .B0(\Reg_file[5][5] ), 
        .B1(n266), .Y(n226) );
  AOI21X1M U282 ( .A0(n227), .A1(n226), .B0(n253), .Y(n228) );
  OR4X1M U283 ( .A(n231), .B(n230), .C(n229), .D(n228), .Y(N53) );
  AOI22X1M U284 ( .A0(\Reg_file[10][6] ), .A1(n265), .B0(\Reg_file[11][6] ), 
        .B1(n263), .Y(n233) );
  AOI22X1M U285 ( .A0(\Reg_file[8][6] ), .A1(n267), .B0(\Reg_file[9][6] ), 
        .B1(n266), .Y(n232) );
  AOI21X1M U286 ( .A0(n233), .A1(n232), .B0(n244), .Y(n243) );
  AOI22X1M U287 ( .A0(\Reg_file[14][6] ), .A1(n265), .B0(\Reg_file[15][6] ), 
        .B1(n263), .Y(n235) );
  AOI22X1M U288 ( .A0(\Reg_file[12][6] ), .A1(n267), .B0(\Reg_file[13][6] ), 
        .B1(n266), .Y(n234) );
  AOI21X1M U289 ( .A0(n235), .A1(n234), .B0(n247), .Y(n242) );
  AOI22X1M U290 ( .A0(REG2[6]), .A1(n265), .B0(REG3[6]), .B1(n263), .Y(n237)
         );
  AOI22X1M U291 ( .A0(REG0[6]), .A1(n267), .B0(REG1[6]), .B1(n266), .Y(n236)
         );
  AOI21X1M U292 ( .A0(n237), .A1(n236), .B0(n250), .Y(n241) );
  AOI22X1M U293 ( .A0(\Reg_file[6][6] ), .A1(n265), .B0(\Reg_file[7][6] ), 
        .B1(n263), .Y(n239) );
  AOI22X1M U294 ( .A0(\Reg_file[4][6] ), .A1(n267), .B0(\Reg_file[5][6] ), 
        .B1(n266), .Y(n238) );
  AOI21X1M U295 ( .A0(n239), .A1(n238), .B0(n253), .Y(n240) );
  OR4X1M U296 ( .A(n243), .B(n242), .C(n241), .D(n240), .Y(N52) );
  AOI22X1M U297 ( .A0(\Reg_file[10][7] ), .A1(n265), .B0(\Reg_file[11][7] ), 
        .B1(n263), .Y(n246) );
  AOI22X1M U298 ( .A0(\Reg_file[8][7] ), .A1(n267), .B0(\Reg_file[9][7] ), 
        .B1(n266), .Y(n245) );
  AOI21X1M U299 ( .A0(n246), .A1(n245), .B0(n244), .Y(n259) );
  AOI22X1M U300 ( .A0(\Reg_file[14][7] ), .A1(n265), .B0(\Reg_file[15][7] ), 
        .B1(n263), .Y(n249) );
  AOI22X1M U301 ( .A0(\Reg_file[12][7] ), .A1(n267), .B0(\Reg_file[13][7] ), 
        .B1(n266), .Y(n248) );
  AOI21X1M U302 ( .A0(n249), .A1(n248), .B0(n247), .Y(n258) );
  AOI22X1M U303 ( .A0(REG2[7]), .A1(n265), .B0(REG3[7]), .B1(n263), .Y(n252)
         );
  AOI22X1M U304 ( .A0(REG0[7]), .A1(n267), .B0(REG1[7]), .B1(n266), .Y(n251)
         );
  AOI21X1M U305 ( .A0(n252), .A1(n251), .B0(n250), .Y(n257) );
  AOI22X1M U306 ( .A0(\Reg_file[6][7] ), .A1(n265), .B0(\Reg_file[7][7] ), 
        .B1(n263), .Y(n255) );
  AOI22X1M U307 ( .A0(\Reg_file[4][7] ), .A1(n267), .B0(\Reg_file[5][7] ), 
        .B1(n266), .Y(n254) );
  AOI21X1M U308 ( .A0(n255), .A1(n254), .B0(n253), .Y(n256) );
endmodule


module ALU_DW_div_uns_0 ( a, b, quotient, remainder, divide_by_0 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] , \u_div/SumTmp[1][2] ,
         \u_div/SumTmp[1][3] , \u_div/SumTmp[1][4] , \u_div/SumTmp[1][5] ,
         \u_div/SumTmp[1][6] , \u_div/SumTmp[2][0] , \u_div/SumTmp[2][1] ,
         \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] , \u_div/SumTmp[2][4] ,
         \u_div/SumTmp[2][5] , \u_div/SumTmp[3][0] , \u_div/SumTmp[3][1] ,
         \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] , \u_div/SumTmp[3][4] ,
         \u_div/SumTmp[4][0] , \u_div/SumTmp[4][1] , \u_div/SumTmp[4][2] ,
         \u_div/SumTmp[4][3] , \u_div/SumTmp[5][0] , \u_div/SumTmp[5][1] ,
         \u_div/SumTmp[5][2] , \u_div/SumTmp[6][0] , \u_div/SumTmp[6][1] ,
         \u_div/SumTmp[7][0] , \u_div/CryTmp[0][1] , \u_div/CryTmp[0][2] ,
         \u_div/CryTmp[0][3] , \u_div/CryTmp[0][4] , \u_div/CryTmp[0][5] ,
         \u_div/CryTmp[0][6] , \u_div/CryTmp[0][7] , \u_div/CryTmp[1][1] ,
         \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] , \u_div/CryTmp[1][4] ,
         \u_div/CryTmp[1][5] , \u_div/CryTmp[1][6] , \u_div/CryTmp[1][7] ,
         \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] , \u_div/CryTmp[2][3] ,
         \u_div/CryTmp[2][4] , \u_div/CryTmp[2][5] , \u_div/CryTmp[2][6] ,
         \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] , \u_div/CryTmp[3][3] ,
         \u_div/CryTmp[3][4] , \u_div/CryTmp[3][5] , \u_div/CryTmp[4][1] ,
         \u_div/CryTmp[4][2] , \u_div/CryTmp[4][3] , \u_div/CryTmp[4][4] ,
         \u_div/CryTmp[5][1] , \u_div/CryTmp[5][2] , \u_div/CryTmp[5][3] ,
         \u_div/CryTmp[6][1] , \u_div/CryTmp[6][2] , \u_div/CryTmp[7][1] ,
         \u_div/PartRem[1][1] , \u_div/PartRem[1][2] , \u_div/PartRem[1][3] ,
         \u_div/PartRem[1][4] , \u_div/PartRem[1][5] , \u_div/PartRem[1][6] ,
         \u_div/PartRem[1][7] , \u_div/PartRem[2][1] , \u_div/PartRem[2][2] ,
         \u_div/PartRem[2][3] , \u_div/PartRem[2][4] , \u_div/PartRem[2][5] ,
         \u_div/PartRem[2][6] , \u_div/PartRem[3][1] , \u_div/PartRem[3][2] ,
         \u_div/PartRem[3][3] , \u_div/PartRem[3][4] , \u_div/PartRem[3][5] ,
         \u_div/PartRem[4][1] , \u_div/PartRem[4][2] , \u_div/PartRem[4][3] ,
         \u_div/PartRem[4][4] , \u_div/PartRem[5][1] , \u_div/PartRem[5][2] ,
         \u_div/PartRem[5][3] , \u_div/PartRem[6][1] , \u_div/PartRem[6][2] ,
         \u_div/PartRem[7][1] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21;

  ADDFX2M \u_div/u_fa_PartRem_0_2_5  ( .A(\u_div/PartRem[3][5] ), .B(n13), 
        .CI(\u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_3  ( .A(\u_div/PartRem[5][3] ), .B(n15), 
        .CI(\u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_2  ( .A(\u_div/PartRem[6][2] ), .B(n16), 
        .CI(\u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_6_1  ( .A(\u_div/PartRem[7][1] ), .B(n17), 
        .CI(\u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_4  ( .A(\u_div/PartRem[4][4] ), .B(n14), 
        .CI(\u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(n12), 
        .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(n11), 
        .CI(\u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n17), 
        .CI(\u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_1  ( .A(\u_div/PartRem[2][1] ), .B(n17), 
        .CI(\u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_1  ( .A(\u_div/PartRem[3][1] ), .B(n17), 
        .CI(\u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_1  ( .A(\u_div/PartRem[4][1] ), .B(n17), 
        .CI(\u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), .S(
        \u_div/SumTmp[3][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(n17), 
        .CI(\u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), .S(
        \u_div/SumTmp[4][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/PartRem[6][1] ), .B(n17), 
        .CI(\u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), .S(
        \u_div/SumTmp[5][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n14), 
        .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n13), 
        .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n13), 
        .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n14), 
        .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n16), 
        .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n15), 
        .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n14), 
        .CI(\u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n15), 
        .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n15), 
        .CI(\u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n16), 
        .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n15), 
        .CI(\u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n16), 
        .CI(\u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_2  ( .A(\u_div/PartRem[4][2] ), .B(n16), 
        .CI(\u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), .S(
        \u_div/SumTmp[3][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_2  ( .A(\u_div/PartRem[5][2] ), .B(n16), 
        .CI(\u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), .S(
        \u_div/SumTmp[4][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(n12), 
        .CI(\u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), .S(
        \u_div/SumTmp[1][6] ) );
  INVX2M U1 ( .A(b[0]), .Y(n18) );
  XNOR2X2M U2 ( .A(n18), .B(a[7]), .Y(\u_div/SumTmp[7][0] ) );
  XNOR2X2M U3 ( .A(n18), .B(a[6]), .Y(\u_div/SumTmp[6][0] ) );
  XNOR2X2M U4 ( .A(n18), .B(a[5]), .Y(\u_div/SumTmp[5][0] ) );
  XNOR2X2M U5 ( .A(n18), .B(a[4]), .Y(\u_div/SumTmp[4][0] ) );
  XNOR2X2M U6 ( .A(n18), .B(a[3]), .Y(\u_div/SumTmp[3][0] ) );
  XNOR2X2M U7 ( .A(n18), .B(a[2]), .Y(\u_div/SumTmp[2][0] ) );
  OR2X2M U8 ( .A(n18), .B(a[7]), .Y(\u_div/CryTmp[7][1] ) );
  NAND2X2M U9 ( .A(n3), .B(n4), .Y(\u_div/CryTmp[5][1] ) );
  INVX2M U10 ( .A(a[5]), .Y(n4) );
  INVX2M U11 ( .A(n18), .Y(n3) );
  NAND2X2M U12 ( .A(n5), .B(n6), .Y(\u_div/CryTmp[4][1] ) );
  INVX2M U13 ( .A(a[4]), .Y(n6) );
  INVX2M U14 ( .A(n18), .Y(n5) );
  NAND2X2M U15 ( .A(n5), .B(n7), .Y(\u_div/CryTmp[3][1] ) );
  INVX2M U16 ( .A(a[3]), .Y(n7) );
  NAND2X2M U17 ( .A(n5), .B(n8), .Y(\u_div/CryTmp[2][1] ) );
  INVX2M U18 ( .A(a[2]), .Y(n8) );
  NAND2X2M U19 ( .A(n5), .B(n9), .Y(\u_div/CryTmp[1][1] ) );
  INVX2M U20 ( .A(a[1]), .Y(n9) );
  NAND2X2M U21 ( .A(n5), .B(n10), .Y(\u_div/CryTmp[0][1] ) );
  INVX2M U22 ( .A(a[0]), .Y(n10) );
  NAND2X2M U23 ( .A(n1), .B(n2), .Y(\u_div/CryTmp[6][1] ) );
  INVX2M U24 ( .A(a[6]), .Y(n2) );
  INVX2M U25 ( .A(n18), .Y(n1) );
  XNOR2X2M U26 ( .A(n18), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  INVX2M U27 ( .A(b[6]), .Y(n12) );
  INVX2M U28 ( .A(b[1]), .Y(n17) );
  INVX2M U29 ( .A(b[2]), .Y(n16) );
  INVX2M U30 ( .A(b[3]), .Y(n15) );
  INVX2M U31 ( .A(b[4]), .Y(n14) );
  INVX2M U32 ( .A(b[5]), .Y(n13) );
  INVX2M U33 ( .A(b[7]), .Y(n11) );
  CLKMX2X2M U34 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/SumTmp[1][6] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][7] ) );
  CLKMX2X2M U35 ( .A(\u_div/PartRem[3][5] ), .B(\u_div/SumTmp[2][5] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][6] ) );
  CLKMX2X2M U36 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/SumTmp[3][4] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][5] ) );
  CLKMX2X2M U37 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][4] ) );
  CLKMX2X2M U38 ( .A(\u_div/PartRem[6][2] ), .B(\u_div/SumTmp[5][2] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][3] ) );
  CLKMX2X2M U39 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[6][1] ), .S0(
        quotient[6]), .Y(\u_div/PartRem[6][2] ) );
  CLKMX2X2M U40 ( .A(a[7]), .B(\u_div/SumTmp[7][0] ), .S0(quotient[7]), .Y(
        \u_div/PartRem[7][1] ) );
  CLKMX2X2M U41 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/SumTmp[1][5] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][6] ) );
  CLKMX2X2M U42 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/SumTmp[2][4] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][5] ) );
  CLKMX2X2M U43 ( .A(\u_div/PartRem[4][3] ), .B(\u_div/SumTmp[3][3] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][4] ) );
  CLKMX2X2M U44 ( .A(\u_div/PartRem[5][2] ), .B(\u_div/SumTmp[4][2] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][3] ) );
  CLKMX2X2M U45 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][2] ) );
  CLKMX2X2M U46 ( .A(a[6]), .B(\u_div/SumTmp[6][0] ), .S0(quotient[6]), .Y(
        \u_div/PartRem[6][1] ) );
  CLKMX2X2M U47 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/SumTmp[1][4] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][5] ) );
  CLKMX2X2M U48 ( .A(\u_div/PartRem[3][3] ), .B(\u_div/SumTmp[2][3] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][4] ) );
  CLKMX2X2M U49 ( .A(\u_div/PartRem[4][2] ), .B(\u_div/SumTmp[3][2] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][3] ) );
  CLKMX2X2M U50 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][2] ) );
  CLKMX2X2M U51 ( .A(a[5]), .B(\u_div/SumTmp[5][0] ), .S0(quotient[5]), .Y(
        \u_div/PartRem[5][1] ) );
  CLKMX2X2M U52 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/SumTmp[1][3] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][4] ) );
  CLKMX2X2M U53 ( .A(\u_div/PartRem[3][2] ), .B(\u_div/SumTmp[2][2] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][3] ) );
  CLKMX2X2M U54 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][2] ) );
  CLKMX2X2M U55 ( .A(a[4]), .B(\u_div/SumTmp[4][0] ), .S0(quotient[4]), .Y(
        \u_div/PartRem[4][1] ) );
  CLKMX2X2M U56 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][3] ) );
  CLKMX2X2M U57 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][2] ) );
  CLKMX2X2M U58 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][1] ) );
  CLKMX2X2M U59 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][2] ) );
  CLKMX2X2M U60 ( .A(a[2]), .B(\u_div/SumTmp[2][0] ), .S0(quotient[2]), .Y(
        \u_div/PartRem[2][1] ) );
  CLKMX2X2M U61 ( .A(a[1]), .B(\u_div/SumTmp[1][0] ), .S0(quotient[1]), .Y(
        \u_div/PartRem[1][1] ) );
  AND4X1M U62 ( .A(\u_div/CryTmp[7][1] ), .B(n19), .C(n17), .D(n16), .Y(
        quotient[7]) );
  AND3X1M U63 ( .A(n19), .B(n16), .C(\u_div/CryTmp[6][2] ), .Y(quotient[6]) );
  AND2X1M U64 ( .A(\u_div/CryTmp[5][3] ), .B(n19), .Y(quotient[5]) );
  AND2X1M U65 ( .A(n20), .B(n15), .Y(n19) );
  AND2X1M U66 ( .A(\u_div/CryTmp[4][4] ), .B(n20), .Y(quotient[4]) );
  AND3X1M U67 ( .A(n21), .B(n14), .C(n13), .Y(n20) );
  AND3X1M U68 ( .A(n21), .B(n13), .C(\u_div/CryTmp[3][5] ), .Y(quotient[3]) );
  AND2X1M U69 ( .A(\u_div/CryTmp[2][6] ), .B(n21), .Y(quotient[2]) );
  NOR2X1M U70 ( .A(b[6]), .B(b[7]), .Y(n21) );
  AND2X1M U71 ( .A(\u_div/CryTmp[1][7] ), .B(n11), .Y(quotient[1]) );
endmodule


module ALU_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [9:0] carry;

  ADDFX2M U2_1 ( .A(A[1]), .B(n9), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_5 ( .A(A[5]), .B(n5), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n6), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n7), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n8), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2M U2_7 ( .A(A[7]), .B(n3), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n4), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  INVX2M U1 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2M U2 ( .A(B[6]), .Y(n4) );
  XNOR2X2M U3 ( .A(n10), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U4 ( .A(B[0]), .Y(n10) );
  INVX2M U5 ( .A(B[7]), .Y(n3) );
  INVX2M U6 ( .A(B[2]), .Y(n8) );
  INVX2M U7 ( .A(B[3]), .Y(n7) );
  INVX2M U8 ( .A(B[4]), .Y(n6) );
  INVX2M U9 ( .A(B[5]), .Y(n5) );
  INVX2M U10 ( .A(B[1]), .Y(n9) );
  NAND2X2M U11 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2M U12 ( .A(A[0]), .Y(n1) );
endmodule


module ALU_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X2M U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  CLKXOR2X2M U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module ALU_DW01_add_1 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   \A[5] , \A[4] , \A[3] , \A[2] , \A[1] , \A[0] , n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20
;
  assign SUM[6] = A[6];
  assign SUM[5] = \A[5] ;
  assign \A[5]  = A[5];
  assign SUM[4] = \A[4] ;
  assign \A[4]  = A[4];
  assign SUM[3] = \A[3] ;
  assign \A[3]  = A[3];
  assign SUM[2] = \A[2] ;
  assign \A[2]  = A[2];
  assign SUM[1] = \A[1] ;
  assign \A[1]  = A[1];
  assign SUM[0] = \A[0] ;
  assign \A[0]  = A[0];

  AOI21BX2M U2 ( .A0(n11), .A1(A[12]), .B0N(n12), .Y(n1) );
  NAND2X2M U3 ( .A(A[7]), .B(B[7]), .Y(n8) );
  XNOR2X2M U4 ( .A(B[13]), .B(n1), .Y(SUM[13]) );
  XNOR2X2M U5 ( .A(A[7]), .B(n2), .Y(SUM[7]) );
  INVX2M U6 ( .A(B[7]), .Y(n2) );
  XNOR2X1M U7 ( .A(n3), .B(n4), .Y(SUM[9]) );
  NOR2X1M U8 ( .A(n5), .B(n6), .Y(n4) );
  CLKXOR2X2M U9 ( .A(n7), .B(n8), .Y(SUM[8]) );
  NAND2BX1M U10 ( .AN(n9), .B(n10), .Y(n7) );
  OAI21X1M U11 ( .A0(A[12]), .A1(n11), .B0(B[12]), .Y(n12) );
  XOR3XLM U12 ( .A(B[12]), .B(A[12]), .C(n11), .Y(SUM[12]) );
  OAI21BX1M U13 ( .A0(n13), .A1(n14), .B0N(n15), .Y(n11) );
  XNOR2X1M U14 ( .A(n14), .B(n16), .Y(SUM[11]) );
  NOR2X1M U15 ( .A(n15), .B(n13), .Y(n16) );
  NOR2X1M U16 ( .A(B[11]), .B(A[11]), .Y(n13) );
  AND2X1M U17 ( .A(B[11]), .B(A[11]), .Y(n15) );
  OA21X1M U18 ( .A0(n17), .A1(n18), .B0(n19), .Y(n14) );
  CLKXOR2X2M U19 ( .A(n20), .B(n18), .Y(SUM[10]) );
  AOI2BB1X1M U20 ( .A0N(n3), .A1N(n6), .B0(n5), .Y(n18) );
  AND2X1M U21 ( .A(B[9]), .B(A[9]), .Y(n5) );
  NOR2X1M U22 ( .A(B[9]), .B(A[9]), .Y(n6) );
  OA21X1M U23 ( .A0(n8), .A1(n9), .B0(n10), .Y(n3) );
  CLKNAND2X2M U24 ( .A(B[8]), .B(A[8]), .Y(n10) );
  NOR2X1M U25 ( .A(B[8]), .B(A[8]), .Y(n9) );
  NAND2BX1M U26 ( .AN(n17), .B(n19), .Y(n20) );
  CLKNAND2X2M U27 ( .A(B[10]), .B(A[10]), .Y(n19) );
  NOR2X1M U28 ( .A(B[10]), .B(A[10]), .Y(n17) );
endmodule


module ALU_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   \ab[7][7] , \ab[7][6] , \ab[7][5] , \ab[7][4] , \ab[7][3] ,
         \ab[7][2] , \ab[7][1] , \ab[7][0] , \ab[6][7] , \ab[6][6] ,
         \ab[6][5] , \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] ,
         \ab[6][0] , \ab[5][7] , \ab[5][6] , \ab[5][5] , \ab[5][4] ,
         \ab[5][3] , \ab[5][2] , \ab[5][1] , \ab[5][0] , \ab[4][7] ,
         \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] , \ab[4][2] ,
         \ab[4][1] , \ab[4][0] , \ab[3][7] , \ab[3][6] , \ab[3][5] ,
         \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] ,
         \ab[2][7] , \ab[2][6] , \ab[2][5] , \ab[2][4] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][7] , \ab[1][6] ,
         \ab[1][5] , \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] ,
         \ab[1][0] , \ab[0][7] , \ab[0][6] , \ab[0][5] , \ab[0][4] ,
         \ab[0][3] , \ab[0][2] , \ab[0][1] , \CARRYB[7][6] , \CARRYB[7][5] ,
         \CARRYB[7][4] , \CARRYB[7][3] , \CARRYB[7][2] , \CARRYB[7][1] ,
         \CARRYB[7][0] , \CARRYB[6][6] , \CARRYB[6][5] , \CARRYB[6][4] ,
         \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] , \CARRYB[6][0] ,
         \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] , \CARRYB[5][3] ,
         \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][6] ,
         \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][6] , \CARRYB[3][5] ,
         \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] , \CARRYB[3][1] ,
         \CARRYB[3][0] , \CARRYB[2][6] , \CARRYB[2][5] , \CARRYB[2][4] ,
         \CARRYB[2][3] , \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] ,
         \SUMB[7][6] , \SUMB[7][5] , \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] ,
         \SUMB[7][1] , \SUMB[7][0] , \SUMB[6][6] , \SUMB[6][5] , \SUMB[6][4] ,
         \SUMB[6][3] , \SUMB[6][2] , \SUMB[6][1] , \SUMB[5][6] , \SUMB[5][5] ,
         \SUMB[5][4] , \SUMB[5][3] , \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][6] ,
         \SUMB[4][5] , \SUMB[4][4] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][6] , \SUMB[3][5] , \SUMB[3][4] , \SUMB[3][3] , \SUMB[3][2] ,
         \SUMB[3][1] , \SUMB[2][6] , \SUMB[2][5] , \SUMB[2][4] , \SUMB[2][3] ,
         \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][6] , \SUMB[1][5] , \SUMB[1][4] ,
         \SUMB[1][3] , \SUMB[1][2] , \SUMB[1][1] , \A1[12] , \A1[11] ,
         \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \A1[4] , \A1[3] ,
         \A1[2] , \A1[1] , \A1[0] , n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39;

  ALU_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , \A1[10] , \A1[9] , 
        \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , \A1[3] , \A1[2] , 
        \A1[1] , \A1[0] }), .B({n10, n16, n14, n13, n15, n11, n12, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(PRODUCT[15:2]) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n6), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n5), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n9), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n8), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n7), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n4), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n3), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  AND2X2M U2 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  INVX2M U10 ( .A(\ab[0][6] ), .Y(n22) );
  CLKXOR2X2M U11 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U12 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  INVX2M U13 ( .A(\ab[0][4] ), .Y(n20) );
  INVX2M U14 ( .A(\ab[0][5] ), .Y(n21) );
  INVX2M U15 ( .A(\ab[0][3] ), .Y(n19) );
  INVX2M U16 ( .A(\ab[0][7] ), .Y(n23) );
  AND2X2M U17 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n11) );
  AND2X2M U18 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n12) );
  CLKXOR2X2M U19 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U20 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  INVX2M U21 ( .A(\ab[0][2] ), .Y(n18) );
  AND2X2M U22 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n13) );
  AND2X2M U23 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n14) );
  CLKXOR2X2M U24 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  AND2X2M U25 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n15) );
  CLKXOR2X2M U26 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  INVX2M U27 ( .A(\SUMB[7][1] ), .Y(n17) );
  AND2X2M U28 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n16) );
  CLKXOR2X2M U29 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  XNOR2X2M U30 ( .A(\ab[1][3] ), .B(n20), .Y(\SUMB[1][3] ) );
  XNOR2X2M U31 ( .A(\ab[1][4] ), .B(n21), .Y(\SUMB[1][4] ) );
  XNOR2X2M U32 ( .A(\ab[1][5] ), .B(n22), .Y(\SUMB[1][5] ) );
  XNOR2X2M U33 ( .A(\ab[1][6] ), .B(n23), .Y(\SUMB[1][6] ) );
  XNOR2X2M U34 ( .A(\ab[1][2] ), .B(n19), .Y(\SUMB[1][2] ) );
  INVX2M U35 ( .A(A[1]), .Y(n30) );
  INVX2M U36 ( .A(A[0]), .Y(n31) );
  INVX2M U37 ( .A(B[6]), .Y(n33) );
  XNOR2X2M U38 ( .A(\ab[1][1] ), .B(n18), .Y(\SUMB[1][1] ) );
  INVX2M U39 ( .A(A[3]), .Y(n28) );
  INVX2M U40 ( .A(A[2]), .Y(n29) );
  INVX2M U41 ( .A(A[4]), .Y(n27) );
  XNOR2X2M U42 ( .A(\CARRYB[7][0] ), .B(n17), .Y(\A1[6] ) );
  INVX2M U43 ( .A(A[7]), .Y(n24) );
  INVX2M U44 ( .A(A[6]), .Y(n25) );
  INVX2M U45 ( .A(A[5]), .Y(n26) );
  INVX2M U46 ( .A(B[3]), .Y(n36) );
  INVX2M U47 ( .A(B[7]), .Y(n32) );
  INVX2M U48 ( .A(B[4]), .Y(n35) );
  INVX2M U49 ( .A(B[5]), .Y(n34) );
  INVX2M U50 ( .A(B[0]), .Y(n39) );
  INVX2M U51 ( .A(B[2]), .Y(n37) );
  INVX2M U52 ( .A(B[1]), .Y(n38) );
  NOR2X1M U54 ( .A(n24), .B(n32), .Y(\ab[7][7] ) );
  NOR2X1M U55 ( .A(n24), .B(n33), .Y(\ab[7][6] ) );
  NOR2X1M U56 ( .A(n24), .B(n34), .Y(\ab[7][5] ) );
  NOR2X1M U57 ( .A(n24), .B(n35), .Y(\ab[7][4] ) );
  NOR2X1M U58 ( .A(n24), .B(n36), .Y(\ab[7][3] ) );
  NOR2X1M U59 ( .A(n24), .B(n37), .Y(\ab[7][2] ) );
  NOR2X1M U60 ( .A(n24), .B(n38), .Y(\ab[7][1] ) );
  NOR2X1M U61 ( .A(n24), .B(n39), .Y(\ab[7][0] ) );
  NOR2X1M U62 ( .A(n32), .B(n25), .Y(\ab[6][7] ) );
  NOR2X1M U63 ( .A(n33), .B(n25), .Y(\ab[6][6] ) );
  NOR2X1M U64 ( .A(n34), .B(n25), .Y(\ab[6][5] ) );
  NOR2X1M U65 ( .A(n35), .B(n25), .Y(\ab[6][4] ) );
  NOR2X1M U66 ( .A(n36), .B(n25), .Y(\ab[6][3] ) );
  NOR2X1M U67 ( .A(n37), .B(n25), .Y(\ab[6][2] ) );
  NOR2X1M U68 ( .A(n38), .B(n25), .Y(\ab[6][1] ) );
  NOR2X1M U69 ( .A(n39), .B(n25), .Y(\ab[6][0] ) );
  NOR2X1M U70 ( .A(n32), .B(n26), .Y(\ab[5][7] ) );
  NOR2X1M U71 ( .A(n33), .B(n26), .Y(\ab[5][6] ) );
  NOR2X1M U72 ( .A(n34), .B(n26), .Y(\ab[5][5] ) );
  NOR2X1M U73 ( .A(n35), .B(n26), .Y(\ab[5][4] ) );
  NOR2X1M U74 ( .A(n36), .B(n26), .Y(\ab[5][3] ) );
  NOR2X1M U75 ( .A(n37), .B(n26), .Y(\ab[5][2] ) );
  NOR2X1M U76 ( .A(n38), .B(n26), .Y(\ab[5][1] ) );
  NOR2X1M U77 ( .A(n39), .B(n26), .Y(\ab[5][0] ) );
  NOR2X1M U78 ( .A(n32), .B(n27), .Y(\ab[4][7] ) );
  NOR2X1M U79 ( .A(n33), .B(n27), .Y(\ab[4][6] ) );
  NOR2X1M U80 ( .A(n34), .B(n27), .Y(\ab[4][5] ) );
  NOR2X1M U81 ( .A(n35), .B(n27), .Y(\ab[4][4] ) );
  NOR2X1M U82 ( .A(n36), .B(n27), .Y(\ab[4][3] ) );
  NOR2X1M U83 ( .A(n37), .B(n27), .Y(\ab[4][2] ) );
  NOR2X1M U84 ( .A(n38), .B(n27), .Y(\ab[4][1] ) );
  NOR2X1M U85 ( .A(n39), .B(n27), .Y(\ab[4][0] ) );
  NOR2X1M U86 ( .A(n32), .B(n28), .Y(\ab[3][7] ) );
  NOR2X1M U87 ( .A(n33), .B(n28), .Y(\ab[3][6] ) );
  NOR2X1M U88 ( .A(n34), .B(n28), .Y(\ab[3][5] ) );
  NOR2X1M U89 ( .A(n35), .B(n28), .Y(\ab[3][4] ) );
  NOR2X1M U90 ( .A(n36), .B(n28), .Y(\ab[3][3] ) );
  NOR2X1M U91 ( .A(n37), .B(n28), .Y(\ab[3][2] ) );
  NOR2X1M U92 ( .A(n38), .B(n28), .Y(\ab[3][1] ) );
  NOR2X1M U93 ( .A(n39), .B(n28), .Y(\ab[3][0] ) );
  NOR2X1M U94 ( .A(n32), .B(n29), .Y(\ab[2][7] ) );
  NOR2X1M U95 ( .A(n33), .B(n29), .Y(\ab[2][6] ) );
  NOR2X1M U96 ( .A(n34), .B(n29), .Y(\ab[2][5] ) );
  NOR2X1M U97 ( .A(n35), .B(n29), .Y(\ab[2][4] ) );
  NOR2X1M U98 ( .A(n36), .B(n29), .Y(\ab[2][3] ) );
  NOR2X1M U99 ( .A(n37), .B(n29), .Y(\ab[2][2] ) );
  NOR2X1M U100 ( .A(n38), .B(n29), .Y(\ab[2][1] ) );
  NOR2X1M U101 ( .A(n39), .B(n29), .Y(\ab[2][0] ) );
  NOR2X1M U102 ( .A(n32), .B(n30), .Y(\ab[1][7] ) );
  NOR2X1M U103 ( .A(n33), .B(n30), .Y(\ab[1][6] ) );
  NOR2X1M U104 ( .A(n34), .B(n30), .Y(\ab[1][5] ) );
  NOR2X1M U105 ( .A(n35), .B(n30), .Y(\ab[1][4] ) );
  NOR2X1M U106 ( .A(n36), .B(n30), .Y(\ab[1][3] ) );
  NOR2X1M U107 ( .A(n37), .B(n30), .Y(\ab[1][2] ) );
  NOR2X1M U108 ( .A(n38), .B(n30), .Y(\ab[1][1] ) );
  NOR2X1M U109 ( .A(n39), .B(n30), .Y(\ab[1][0] ) );
  NOR2X1M U110 ( .A(n32), .B(n31), .Y(\ab[0][7] ) );
  NOR2X1M U111 ( .A(n33), .B(n31), .Y(\ab[0][6] ) );
  NOR2X1M U112 ( .A(n34), .B(n31), .Y(\ab[0][5] ) );
  NOR2X1M U113 ( .A(n35), .B(n31), .Y(\ab[0][4] ) );
  NOR2X1M U114 ( .A(n36), .B(n31), .Y(\ab[0][3] ) );
  NOR2X1M U115 ( .A(n37), .B(n31), .Y(\ab[0][2] ) );
  NOR2X1M U116 ( .A(n38), .B(n31), .Y(\ab[0][1] ) );
  NOR2X1M U117 ( .A(n39), .B(n31), .Y(PRODUCT[0]) );
endmodule


module ALU ( A, B, ALU_FUN, CLK, RST, EN, ALU_OUT, OUT_VALID );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input CLK, RST, EN;
  output OUT_VALID;
  wire   N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103,
         N104, N105, N106, N107, N108, N109, N110, N111, N112, N113, N114,
         N115, N116, N117, N118, N119, N120, N121, N122, N123, N124, N125,
         N126, N127, N128, N129, N130, N131, N132, N157, N158, N159, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140;
  wire   [15:0] ALU_OUT_COMB;

  ALU_DW_div_uns_0 div_42 ( .a({n12, n11, n10, n9, n8, n7, n6, n5}), .b({B[7], 
        n4, B[5:0]}), .quotient({N132, N131, N130, N129, N128, N127, N126, 
        N125}) );
  ALU_DW01_sub_0 sub_36 ( .A({1'b0, n12, n11, n10, n9, n8, n7, n6, n5}), .B({
        1'b0, B[7], n4, B[5:0]}), .CI(1'b0), .DIFF({N108, N107, N106, N105, 
        N104, N103, N102, N101, N100}) );
  ALU_DW01_add_0 add_33 ( .A({1'b0, n12, n11, n10, n9, n8, n7, n6, n5}), .B({
        1'b0, B[7], n4, B[5:0]}), .CI(1'b0), .SUM({N99, N98, N97, N96, N95, 
        N94, N93, N92, N91}) );
  ALU_DW02_mult_0 mult_39 ( .A({n12, n11, n10, n9, n8, n7, n6, n5}), .B({B[7], 
        n4, B[5:0]}), .TC(1'b0), .PRODUCT({N124, N123, N122, N121, N120, N119, 
        N118, N117, N116, N115, N114, N113, N112, N111, N110, N109}) );
  DFFRQX2M \ALU_OUT_reg[15]  ( .D(ALU_OUT_COMB[15]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[15]) );
  DFFRQX2M \ALU_OUT_reg[14]  ( .D(ALU_OUT_COMB[14]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[14]) );
  DFFRQX2M \ALU_OUT_reg[13]  ( .D(ALU_OUT_COMB[13]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[13]) );
  DFFRQX2M \ALU_OUT_reg[12]  ( .D(ALU_OUT_COMB[12]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[12]) );
  DFFRQX2M \ALU_OUT_reg[11]  ( .D(ALU_OUT_COMB[11]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[11]) );
  DFFRQX2M \ALU_OUT_reg[10]  ( .D(ALU_OUT_COMB[10]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[10]) );
  DFFRQX2M \ALU_OUT_reg[9]  ( .D(ALU_OUT_COMB[9]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[9]) );
  DFFRQX2M \ALU_OUT_reg[8]  ( .D(ALU_OUT_COMB[8]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[8]) );
  DFFRQX2M \ALU_OUT_reg[7]  ( .D(ALU_OUT_COMB[7]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[7]) );
  DFFRQX2M \ALU_OUT_reg[6]  ( .D(ALU_OUT_COMB[6]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[6]) );
  DFFRQX2M \ALU_OUT_reg[5]  ( .D(ALU_OUT_COMB[5]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[5]) );
  DFFRQX2M \ALU_OUT_reg[4]  ( .D(ALU_OUT_COMB[4]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[4]) );
  DFFRQX2M \ALU_OUT_reg[3]  ( .D(ALU_OUT_COMB[3]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[3]) );
  DFFRQX2M \ALU_OUT_reg[2]  ( .D(ALU_OUT_COMB[2]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[2]) );
  DFFRQX2M \ALU_OUT_reg[1]  ( .D(ALU_OUT_COMB[1]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[1]) );
  DFFRQX2M \ALU_OUT_reg[0]  ( .D(ALU_OUT_COMB[0]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[0]) );
  DFFRQX2M OUT_VALID_reg ( .D(EN), .CK(CLK), .RN(RST), .Q(OUT_VALID) );
  BUFX2M U3 ( .A(A[6]), .Y(n11) );
  OAI2BB1X2M U4 ( .A0N(N124), .A1N(n31), .B0(n32), .Y(ALU_OUT_COMB[15]) );
  OAI2BB1X2M U7 ( .A0N(N123), .A1N(n31), .B0(n32), .Y(ALU_OUT_COMB[14]) );
  OAI2BB1X2M U8 ( .A0N(N121), .A1N(n31), .B0(n32), .Y(ALU_OUT_COMB[12]) );
  OAI2BB1X2M U9 ( .A0N(N122), .A1N(n31), .B0(n32), .Y(ALU_OUT_COMB[13]) );
  OAI2BB1X2M U10 ( .A0N(N118), .A1N(n31), .B0(n32), .Y(ALU_OUT_COMB[9]) );
  OAI2BB1X2M U11 ( .A0N(N119), .A1N(n31), .B0(n32), .Y(ALU_OUT_COMB[10]) );
  OAI2BB1X2M U12 ( .A0N(N120), .A1N(n31), .B0(n32), .Y(ALU_OUT_COMB[11]) );
  OAI2BB1X2M U13 ( .A0N(n140), .A1N(n105), .B0(n101), .Y(n47) );
  OAI2BB1X2M U14 ( .A0N(n100), .A1N(n99), .B0(n101), .Y(n48) );
  NOR2BX2M U15 ( .AN(n106), .B(n137), .Y(n37) );
  AND2X2M U16 ( .A(n99), .B(n105), .Y(n42) );
  NOR2BX2M U17 ( .AN(n35), .B(n135), .Y(n31) );
  AND2X2M U18 ( .A(n106), .B(n105), .Y(n50) );
  BUFX2M U19 ( .A(n41), .Y(n13) );
  NOR2X2M U20 ( .A(n107), .B(n137), .Y(n41) );
  INVX2M U21 ( .A(n100), .Y(n137) );
  INVX2M U22 ( .A(n91), .Y(n138) );
  INVX2M U23 ( .A(n107), .Y(n140) );
  NOR3BX2M U24 ( .AN(n105), .B(n139), .C(ALU_FUN[2]), .Y(n49) );
  NOR2X2M U25 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n106) );
  INVX2M U26 ( .A(ALU_FUN[0]), .Y(n136) );
  NOR2X2M U27 ( .A(n136), .B(n3), .Y(n105) );
  INVX2M U28 ( .A(ALU_FUN[1]), .Y(n139) );
  NAND3X2M U29 ( .A(n106), .B(ALU_FUN[0]), .C(n3), .Y(n101) );
  NAND2X2M U30 ( .A(EN), .B(n123), .Y(n32) );
  AND2X2M U31 ( .A(ALU_FUN[2]), .B(n139), .Y(n99) );
  AND4X2M U32 ( .A(N159), .B(n99), .C(n3), .D(n136), .Y(n90) );
  NOR3X2M U33 ( .A(n137), .B(ALU_FUN[2]), .C(n139), .Y(n35) );
  AND3X2M U34 ( .A(n106), .B(n136), .C(n3), .Y(n46) );
  NAND3X2M U35 ( .A(n140), .B(n136), .C(n3), .Y(n36) );
  NAND2X2M U36 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n107) );
  NOR2X2M U37 ( .A(n3), .B(ALU_FUN[0]), .Y(n100) );
  NAND3X2M U38 ( .A(n3), .B(ALU_FUN[0]), .C(n99), .Y(n91) );
  INVX2M U39 ( .A(EN), .Y(n135) );
  AOI31X2M U40 ( .A0(n93), .A1(n94), .A2(n95), .B0(n135), .Y(ALU_OUT_COMB[0])
         );
  AOI22X1M U41 ( .A0(N100), .A1(n50), .B0(N91), .B1(n37), .Y(n93) );
  AOI211X2M U42 ( .A0(n13), .A1(n131), .B0(n96), .C0(n97), .Y(n95) );
  AOI222X1M U43 ( .A0(N109), .A1(n35), .B0(n5), .B1(n42), .C0(N125), .C1(n49), 
        .Y(n94) );
  AOI31X2M U44 ( .A0(n81), .A1(n82), .A2(n83), .B0(n135), .Y(ALU_OUT_COMB[1])
         );
  AOI222X1M U45 ( .A0(N92), .A1(n37), .B0(N110), .B1(n35), .C0(N101), .C1(n50), 
        .Y(n81) );
  AOI211X2M U46 ( .A0(n7), .A1(n138), .B0(n84), .C0(n85), .Y(n83) );
  AOI222X1M U47 ( .A0(N126), .A1(n49), .B0(n13), .B1(n130), .C0(n6), .C1(n42), 
        .Y(n82) );
  AOI31X2M U48 ( .A0(n75), .A1(n76), .A2(n77), .B0(n135), .Y(ALU_OUT_COMB[2])
         );
  AOI22X1M U49 ( .A0(N102), .A1(n50), .B0(N93), .B1(n37), .Y(n75) );
  AOI221XLM U50 ( .A0(n8), .A1(n138), .B0(n13), .B1(n129), .C0(n78), .Y(n77)
         );
  AOI222X1M U51 ( .A0(N111), .A1(n35), .B0(n7), .B1(n42), .C0(N127), .C1(n49), 
        .Y(n76) );
  AOI31X2M U52 ( .A0(n69), .A1(n70), .A2(n71), .B0(n135), .Y(ALU_OUT_COMB[3])
         );
  AOI22X1M U53 ( .A0(N103), .A1(n50), .B0(N94), .B1(n37), .Y(n69) );
  AOI221XLM U54 ( .A0(n9), .A1(n138), .B0(n13), .B1(n128), .C0(n72), .Y(n71)
         );
  AOI222X1M U55 ( .A0(N112), .A1(n35), .B0(n8), .B1(n42), .C0(N128), .C1(n49), 
        .Y(n70) );
  AOI31X2M U56 ( .A0(n63), .A1(n64), .A2(n65), .B0(n135), .Y(ALU_OUT_COMB[4])
         );
  AOI22X1M U57 ( .A0(N104), .A1(n50), .B0(N95), .B1(n37), .Y(n63) );
  AOI221XLM U58 ( .A0(n138), .A1(n10), .B0(n13), .B1(n127), .C0(n66), .Y(n65)
         );
  AOI222X1M U59 ( .A0(N113), .A1(n35), .B0(n9), .B1(n42), .C0(N129), .C1(n49), 
        .Y(n64) );
  AOI31X2M U60 ( .A0(n57), .A1(n58), .A2(n59), .B0(n135), .Y(ALU_OUT_COMB[5])
         );
  AOI22X1M U61 ( .A0(N105), .A1(n50), .B0(N96), .B1(n37), .Y(n57) );
  AOI221XLM U62 ( .A0(n138), .A1(n11), .B0(n13), .B1(n126), .C0(n60), .Y(n59)
         );
  AOI222X1M U63 ( .A0(N114), .A1(n35), .B0(n10), .B1(n42), .C0(N130), .C1(n49), 
        .Y(n58) );
  AOI31X2M U64 ( .A0(n38), .A1(n39), .A2(n40), .B0(n135), .Y(ALU_OUT_COMB[7])
         );
  AOI22X1M U65 ( .A0(N107), .A1(n50), .B0(N98), .B1(n37), .Y(n38) );
  AOI221XLM U66 ( .A0(n13), .A1(n124), .B0(n42), .B1(n12), .C0(n43), .Y(n40)
         );
  AOI22X1M U67 ( .A0(N132), .A1(n49), .B0(N116), .B1(n35), .Y(n39) );
  AOI21X2M U68 ( .A0(n33), .A1(n34), .B0(n135), .Y(ALU_OUT_COMB[8]) );
  AOI21X2M U69 ( .A0(N99), .A1(n37), .B0(n123), .Y(n33) );
  AOI2BB2XLM U70 ( .B0(N117), .B1(n35), .A0N(n124), .A1N(n36), .Y(n34) );
  AOI31X2M U71 ( .A0(n51), .A1(n52), .A2(n53), .B0(n135), .Y(ALU_OUT_COMB[6])
         );
  AOI22X1M U72 ( .A0(N106), .A1(n50), .B0(N97), .B1(n37), .Y(n51) );
  AOI221XLM U73 ( .A0(n138), .A1(n12), .B0(n13), .B1(n125), .C0(n54), .Y(n53)
         );
  AOI222X1M U74 ( .A0(N115), .A1(n35), .B0(n42), .B1(n11), .C0(N131), .C1(n49), 
        .Y(n52) );
  OAI222X1M U75 ( .A0(n55), .A1(n120), .B0(n4), .B1(n56), .C0(n36), .C1(n126), 
        .Y(n54) );
  AOI221XLM U76 ( .A0(n11), .A1(n46), .B0(n47), .B1(n125), .C0(n13), .Y(n56)
         );
  AOI221XLM U77 ( .A0(n46), .A1(n125), .B0(n11), .B1(n48), .C0(n42), .Y(n55)
         );
  INVX2M U78 ( .A(n25), .Y(n122) );
  INVX2M U79 ( .A(n92), .Y(n123) );
  AOI211X2M U80 ( .A0(N108), .A1(n50), .B0(n13), .C0(n47), .Y(n92) );
  INVX2M U81 ( .A(n116), .Y(N158) );
  INVX2M U82 ( .A(n4), .Y(n120) );
  BUFX2M U83 ( .A(ALU_FUN[3]), .Y(n3) );
  INVX2M U84 ( .A(n6), .Y(n130) );
  INVX2M U85 ( .A(n5), .Y(n131) );
  INVX2M U86 ( .A(n11), .Y(n125) );
  INVX2M U87 ( .A(n12), .Y(n124) );
  INVX2M U88 ( .A(n8), .Y(n128) );
  INVX2M U89 ( .A(n7), .Y(n129) );
  INVX2M U90 ( .A(n10), .Y(n126) );
  INVX2M U91 ( .A(n9), .Y(n127) );
  BUFX2M U92 ( .A(B[6]), .Y(n4) );
  BUFX2M U93 ( .A(A[7]), .Y(n12) );
  BUFX2M U94 ( .A(A[5]), .Y(n10) );
  BUFX2M U95 ( .A(A[4]), .Y(n9) );
  BUFX2M U96 ( .A(A[3]), .Y(n8) );
  BUFX2M U97 ( .A(A[2]), .Y(n7) );
  BUFX2M U98 ( .A(A[1]), .Y(n6) );
  BUFX2M U99 ( .A(A[0]), .Y(n5) );
  OAI2B2X1M U100 ( .A1N(B[0]), .A0(n98), .B0(n91), .B1(n130), .Y(n97) );
  AOI221XLM U101 ( .A0(n46), .A1(n131), .B0(n5), .B1(n48), .C0(n42), .Y(n98)
         );
  OAI2B2X1M U102 ( .A1N(B[1]), .A0(n86), .B0(n36), .B1(n131), .Y(n85) );
  AOI221XLM U103 ( .A0(n46), .A1(n130), .B0(n6), .B1(n48), .C0(n42), .Y(n86)
         );
  OAI222X1M U104 ( .A0(n79), .A1(n118), .B0(B[2]), .B1(n80), .C0(n36), .C1(
        n130), .Y(n78) );
  AOI221XLM U105 ( .A0(n7), .A1(n46), .B0(n47), .B1(n129), .C0(n13), .Y(n80)
         );
  AOI221XLM U106 ( .A0(n46), .A1(n129), .B0(n7), .B1(n48), .C0(n42), .Y(n79)
         );
  OAI222X1M U107 ( .A0(n73), .A1(n119), .B0(B[3]), .B1(n74), .C0(n36), .C1(
        n129), .Y(n72) );
  AOI221XLM U108 ( .A0(n8), .A1(n46), .B0(n47), .B1(n128), .C0(n13), .Y(n74)
         );
  AOI221XLM U109 ( .A0(n46), .A1(n128), .B0(n8), .B1(n48), .C0(n42), .Y(n73)
         );
  OAI222X1M U110 ( .A0(n67), .A1(n134), .B0(B[4]), .B1(n68), .C0(n36), .C1(
        n128), .Y(n66) );
  INVX2M U111 ( .A(B[4]), .Y(n134) );
  AOI221XLM U112 ( .A0(n9), .A1(n46), .B0(n47), .B1(n127), .C0(n13), .Y(n68)
         );
  AOI221XLM U113 ( .A0(n46), .A1(n127), .B0(n9), .B1(n48), .C0(n42), .Y(n67)
         );
  OAI222X1M U114 ( .A0(n61), .A1(n133), .B0(B[5]), .B1(n62), .C0(n36), .C1(
        n127), .Y(n60) );
  INVX2M U115 ( .A(B[5]), .Y(n133) );
  AOI221XLM U116 ( .A0(n10), .A1(n46), .B0(n47), .B1(n126), .C0(n13), .Y(n62)
         );
  AOI221XLM U117 ( .A0(n46), .A1(n126), .B0(n10), .B1(n48), .C0(n42), .Y(n61)
         );
  OAI222X1M U118 ( .A0(n44), .A1(n132), .B0(B[7]), .B1(n45), .C0(n36), .C1(
        n125), .Y(n43) );
  INVX2M U119 ( .A(B[7]), .Y(n132) );
  AOI221XLM U120 ( .A0(n46), .A1(n12), .B0(n47), .B1(n124), .C0(n13), .Y(n45)
         );
  AOI221XLM U121 ( .A0(n46), .A1(n124), .B0(n12), .B1(n48), .C0(n42), .Y(n44)
         );
  OAI21X2M U122 ( .A0(B[0]), .A1(n102), .B0(n103), .Y(n96) );
  AOI221XLM U123 ( .A0(n5), .A1(n46), .B0(n47), .B1(n131), .C0(n13), .Y(n102)
         );
  AOI31X2M U124 ( .A0(N157), .A1(n3), .A2(n104), .B0(n90), .Y(n103) );
  NOR3X2M U125 ( .A(n139), .B(ALU_FUN[2]), .C(ALU_FUN[0]), .Y(n104) );
  OAI21X2M U126 ( .A0(B[1]), .A1(n87), .B0(n88), .Y(n84) );
  AOI221XLM U127 ( .A0(n6), .A1(n46), .B0(n47), .B1(n130), .C0(n13), .Y(n87)
         );
  AOI31X2M U128 ( .A0(N158), .A1(n3), .A2(n89), .B0(n90), .Y(n88) );
  NOR3X2M U129 ( .A(n136), .B(ALU_FUN[2]), .C(n139), .Y(n89) );
  INVX2M U130 ( .A(n14), .Y(n121) );
  INVX2M U131 ( .A(B[0]), .Y(n117) );
  INVX2M U132 ( .A(B[2]), .Y(n118) );
  INVX2M U133 ( .A(B[3]), .Y(n119) );
  NOR2X1M U134 ( .A(n124), .B(B[7]), .Y(n113) );
  NAND2BX1M U135 ( .AN(B[4]), .B(n9), .Y(n29) );
  NAND2BX1M U136 ( .AN(n9), .B(B[4]), .Y(n18) );
  CLKNAND2X2M U137 ( .A(n29), .B(n18), .Y(n108) );
  NOR2X1M U138 ( .A(n119), .B(n8), .Y(n26) );
  NOR2X1M U139 ( .A(n118), .B(n7), .Y(n17) );
  NOR2X1M U140 ( .A(n117), .B(n5), .Y(n14) );
  CLKNAND2X2M U141 ( .A(n7), .B(n118), .Y(n28) );
  NAND2BX1M U142 ( .AN(n17), .B(n28), .Y(n23) );
  AOI21X1M U143 ( .A0(n14), .A1(n130), .B0(B[1]), .Y(n15) );
  AOI211X1M U144 ( .A0(n6), .A1(n121), .B0(n23), .C0(n15), .Y(n16) );
  CLKNAND2X2M U145 ( .A(n8), .B(n119), .Y(n27) );
  OAI31X1M U146 ( .A0(n26), .A1(n17), .A2(n16), .B0(n27), .Y(n19) );
  NAND2BX1M U147 ( .AN(n10), .B(B[5]), .Y(n111) );
  OAI211X1M U148 ( .A0(n108), .A1(n19), .B0(n18), .C0(n111), .Y(n20) );
  NAND2BX1M U149 ( .AN(B[5]), .B(n10), .Y(n30) );
  XNOR2X1M U150 ( .A(n11), .B(n4), .Y(n110) );
  AOI32X1M U151 ( .A0(n20), .A1(n30), .A2(n110), .B0(n4), .B1(n125), .Y(n21)
         );
  CLKNAND2X2M U152 ( .A(B[7]), .B(n124), .Y(n114) );
  OAI21X1M U153 ( .A0(n113), .A1(n21), .B0(n114), .Y(N159) );
  CLKNAND2X2M U154 ( .A(n5), .B(n117), .Y(n24) );
  OA21X1M U155 ( .A0(n24), .A1(n130), .B0(B[1]), .Y(n22) );
  AOI211X1M U156 ( .A0(n24), .A1(n130), .B0(n23), .C0(n22), .Y(n25) );
  AOI31X1M U157 ( .A0(n122), .A1(n28), .A2(n27), .B0(n26), .Y(n109) );
  OAI2B11X1M U158 ( .A1N(n109), .A0(n108), .B0(n30), .C0(n29), .Y(n112) );
  AOI32X1M U159 ( .A0(n112), .A1(n111), .A2(n110), .B0(n11), .B1(n120), .Y(
        n115) );
  AOI2B1X1M U160 ( .A1N(n115), .A0(n114), .B0(n113), .Y(n116) );
  NOR2X1M U161 ( .A(N159), .B(N158), .Y(N157) );
endmodule


module CLK_GATE ( CLK_EN, CLK, GATED_CLK );
  input CLK_EN, CLK;
  output GATED_CLK;


  TLATNCAX12M U0_TLATNCAX12M ( .E(CLK_EN), .CK(CLK), .ECK(GATED_CLK) );
endmodule


module SYS_TOP ( RST_N, UART_CLK, REF_CLK, UART_RX_IN, UART_TX_O, parity_error, 
        framing_error );
  input RST_N, UART_CLK, REF_CLK, UART_RX_IN;
  output UART_TX_O, parity_error, framing_error;
  wire   SYNC_UART_RST, SYNC_REF_RST, UART_RX_V_OUT, UART_RX_V_SYNC,
         UART_TX_VLD, UART_TX_CLK, UART_TX_Busy_PULSE, FIFO_FULL,
         UART_TX_V_SYNC, UART_TX_Busy, UART_RX_CLK, RF_RdData_VLD, RF_WrEn,
         RF_RdEn, ALU_EN, ALU_OUT_VLD, CLKG_EN, ALU_CLK, n2, n3, n4, n5, n6;
  wire   [7:0] UART_RX_OUT;
  wire   [7:0] UART_RX_SYNC;
  wire   [7:0] UART_TX_IN;
  wire   [7:0] UART_TX_SYNC;
  wire   [7:0] DIV_RATIO;
  wire   [7:0] UART_Config;
  wire   [7:0] DIV_RATIO_RX;
  wire   [7:0] RF_RdData;
  wire   [3:0] RF_Address;
  wire   [7:0] RF_WrData;
  wire   [3:0] ALU_FUN;
  wire   [15:0] ALU_OUT;
  wire   [7:0] Operand_A;
  wire   [7:0] Operand_B;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;

  RST_SYNC_NUM_STAGES2_0 U0_RST_SYNC ( .clk(UART_CLK), .rst(RST_N), .sync_rst(
        SYNC_UART_RST) );
  RST_SYNC_NUM_STAGES2_1 U1_RST_SYNC ( .clk(REF_CLK), .rst(RST_N), .sync_rst(
        SYNC_REF_RST) );
  DATA_SYNC_bus_width8_N_stage2 U0_ref_sync ( .unsync_bus(UART_RX_OUT), 
        .bus_enable(UART_RX_V_OUT), .dest_rst(n2), .dest_clk(REF_CLK), 
        .enable_pulse(UART_RX_V_SYNC), .sync_bus(UART_RX_SYNC) );
  ASYNC_FIFO_TOP_addr_size3_ptr_size4_DATA_WIDTH8 U0_UART_FIFO ( .wclk(REF_CLK), .wrst(n2), .winc(UART_TX_VLD), .wdata(UART_TX_IN), .full(FIFO_FULL), .rclk(
        UART_TX_CLK), .rrst(n4), .rinc(UART_TX_Busy_PULSE), .rdata(
        UART_TX_SYNC), .empty(UART_TX_V_SYNC) );
  PUL_GEN U0_PULSE_GEN ( .rst(n4), .clk(UART_TX_CLK), .lvl_sig(UART_TX_Busy), 
        .pulse_sig(UART_TX_Busy_PULSE) );
  CLK_DIV_0 U0_ClkDiv ( .i_ref_clk(UART_CLK), .i_rst_n(n4), .i_clk_en(1'b1), 
        .i_div_ratio(DIV_RATIO), .o_div_clk(UART_TX_CLK) );
  CLKDIV_MUX U0_CLKDIV_MUX ( .IN(UART_Config[7:2]), .OUT({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, DIV_RATIO_RX[3:0]})
         );
  CLK_DIV_1 U1_ClkDiv ( .i_ref_clk(UART_CLK), .i_rst_n(n4), .i_clk_en(1'b1), 
        .i_div_ratio({1'b0, 1'b0, 1'b0, 1'b0, DIV_RATIO_RX[3:0]}), .o_div_clk(
        UART_RX_CLK) );
  TOP_UART U0_UART ( .RST(n4), .TX_CLK(UART_TX_CLK), .RX_CLK(UART_RX_CLK), 
        .RX_IN_S(UART_RX_IN), .RX_OUT_P(UART_RX_OUT), .RX_OUT_V(UART_RX_V_OUT), 
        .TX_IN_P(UART_TX_SYNC), .TX_IN_V(n6), .TX_OUT_S(UART_TX_O), .TX_OUT_V(
        UART_TX_Busy), .Prescale(UART_Config[7:2]), .parity_enable(
        UART_Config[0]), .parity_type(UART_Config[1]), .parity_error(
        parity_error), .framing_error(framing_error) );
  SYS_CTRL U0_SYS_CTRL ( .CLK(REF_CLK), .RST(n2), .ALU_OUT(ALU_OUT), 
        .OUT_Valid(ALU_OUT_VLD), .ALU_FUN(ALU_FUN), .EN(ALU_EN), .RdData(
        RF_RdData), .RdData_Valid(RF_RdData_VLD), .Address(RF_Address), .WrEn(
        RF_WrEn), .RdEn(RF_RdEn), .WrData(RF_WrData), .RX_P_DATA(UART_RX_SYNC), 
        .RX_D_VLD(UART_RX_V_SYNC), .FIFO_FULL(FIFO_FULL), .TX_P_DATA(
        UART_TX_IN), .TX_D_VLD(UART_TX_VLD), .CLK_EN(CLKG_EN) );
  reg_file U0_RegFile ( .WrData(RF_WrData), .Address(RF_Address), .WrEn(
        RF_WrEn), .RdEn(RF_RdEn), .CLK(REF_CLK), .rst(n2), .RdData(RF_RdData), 
        .RdData_Valid(RF_RdData_VLD), .REG0(Operand_A), .REG1(Operand_B), 
        .REG2(UART_Config), .REG3(DIV_RATIO) );
  ALU U0_ALU ( .A(Operand_A), .B(Operand_B), .ALU_FUN(ALU_FUN), .CLK(ALU_CLK), 
        .RST(n2), .EN(ALU_EN), .ALU_OUT(ALU_OUT), .OUT_VALID(ALU_OUT_VLD) );
  CLK_GATE U0_CLK_GATE ( .CLK_EN(CLKG_EN), .CLK(REF_CLK), .GATED_CLK(ALU_CLK)
         );
  INVX2M U2 ( .A(UART_TX_V_SYNC), .Y(n6) );
  INVX4M U3 ( .A(n3), .Y(n2) );
  INVX2M U4 ( .A(SYNC_REF_RST), .Y(n3) );
  INVX4M U5 ( .A(n5), .Y(n4) );
  INVX2M U6 ( .A(SYNC_UART_RST), .Y(n5) );
endmodule

