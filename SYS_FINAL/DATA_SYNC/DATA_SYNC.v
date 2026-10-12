module DATA_SYNC #(parameter bus_width=8,parameter N_stage=2)(
input [bus_width-1:0] unsync_bus,
input bus_enable,
input dest_rst,
input dest_clk,
output reg enable_pulse,
output reg [bus_width-1:0] sync_bus

);

reg [N_stage-1:0] sync_reg;
reg pulse_gen_flop; // pulse gen FF

wire [bus_width-1:0] sync_bus_c; //output of MUX
wire generated_pulse; //output of AND gate

//sync for N FFs
always @(posedge dest_clk or negedge dest_rst) begin
    if(!dest_rst) begin
        sync_reg<='b0;
    end else begin
        sync_reg<={sync_reg[N_stage-2:0],bus_enable};
    end
end

//pulse generator
always @(posedge dest_clk or negedge dest_rst) begin
    if(!dest_rst) begin
       pulse_gen_flop<='b0;
    end else pulse_gen_flop<=sync_reg[N_stage-1];
end

assign generated_pulse =!pulse_gen_flop && sync_reg[N_stage-1];
assign sync_bus_c = generated_pulse ? unsync_bus : sync_bus;

//MUX SELECTION
always @(posedge dest_clk or negedge dest_rst) begin
    if(!dest_rst) begin
        sync_bus<='b0;
    end else sync_bus<= sync_bus_c;
end

//register the enable_pulse
always @(posedge dest_clk or negedge dest_rst) begin
    if(!dest_rst) begin
        enable_pulse<='b0;
    end else enable_pulse<=generated_pulse;
end



endmodule
