    module CLK_DIV(
input i_ref_clk,
input i_rst_n,
input i_clk_en,
input [7:0] i_div_ratio,
output  o_div_clk
);

reg [7:0] counter;
reg div_clk_reg;


wire CLK_DIV_EN = i_clk_en && ( i_div_ratio !=1'b0) && ( i_div_ratio != 1'b1);
wire [7:0] half_clk = i_div_ratio >> 1;
wire odd = i_div_ratio[0];


// if we make it inside the always block it will be always sapled as 1 at posedge i_ref_clk
assign o_div_clk = CLK_DIV_EN ? div_clk_reg : i_ref_clk;


always @(posedge i_ref_clk or negedge i_rst_n) begin
    if(!i_rst_n) begin
        div_clk_reg <= 1'b0;
        counter <= 8'b0;
    end else if( CLK_DIV_EN) begin

        //even case
if (!odd ) begin
    if(counter== half_clk-8'd1 ) begin
div_clk_reg <= ~div_clk_reg;
counter <= 8'b0;
end else begin
    counter <= counter + 8'b1;
end 
end     else begin //odd case
if(counter== half_clk-8'd1 ) begin
    div_clk_reg <= ~div_clk_reg;
    counter <= counter + 8'b1;
end else if(counter== i_div_ratio-8'd1) begin
    div_clk_reg <= ~div_clk_reg;
    counter <= 8'b0;
end else counter<=counter+8'd1;
   end

    end else begin
        div_clk_reg <= 1'b0;
        counter <= 8'b0;
    end
end

endmodule
