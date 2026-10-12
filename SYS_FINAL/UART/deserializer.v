module deserializer(
    input clk,
    input rst,
    input deser_en,
    input sampled_bit,
    input [5:0] prescale,
    input [5:0] edge_cnt,
    output reg [7:0] P_DATA
);

wire [5:0] half_prescale = prescale >> 1;

always@(posedge clk or negedge rst) begin
    if(!rst) begin
        P_DATA <= 8'd0;
    end
    else if(deser_en) begin
        if(edge_cnt == half_prescale+6'd2) begin // to shift only one time per bit at 6th edge of the bit
            P_DATA <= {sampled_bit,P_DATA[7:1]};
        end
    end
end

endmodule
