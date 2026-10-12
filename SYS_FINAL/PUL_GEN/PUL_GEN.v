module PUL_GEN (
    input  wire rst,
    input  wire clk,
    input  wire lvl_sig,
    output wire pulse_sig
);

    reg rcv_flop;
    reg pls_flop;

    // Shift register for edge detection
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            rcv_flop <= 1'b0;
            pls_flop <= 1'b0;	
        end else begin
            rcv_flop <= lvl_sig;   
            pls_flop <= rcv_flop;
        end
    end

    // Rising edge pulse generation
    assign pulse_sig = rcv_flop && !pls_flop;

endmodule