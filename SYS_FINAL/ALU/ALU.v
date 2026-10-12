module ALU (input [7:0] A, input [7:0] B, 
input [3:0] ALU_FUN,
input CLK,
input RST,
input EN,
output reg [15:0] ALU_OUT, 
output reg OUT_VALID
);


reg [15:0] ALU_OUT_COMB; //internal wire to register only the output not the flags
reg out_valid_comb; //internal wire to register only the output not the flags

always @(posedge CLK or negedge RST)begin
    if(!RST) begin
        ALU_OUT <= 16'b0;
        OUT_VALID <= 1'b0;
    end else begin
        ALU_OUT <= ALU_OUT_COMB;
        OUT_VALID <= out_valid_comb;
    end
end

always @(*) begin
    // default values to prevent latches
    ALU_OUT_COMB = 16'b0;
    out_valid_comb = 1'b0;

if (EN) begin
        out_valid_comb = 1'b1;
    case (ALU_FUN)
    4'b0000: begin
        ALU_OUT_COMB=A+B;
    end
    4'b0001: begin
        ALU_OUT_COMB=A-B;
    end
    4'b0010: begin
        ALU_OUT_COMB=A*B;
    end 
    4'b0011: begin
            ALU_OUT_COMB=A/B;        
    end 
    4'b0100: begin
        ALU_OUT_COMB=A&B;
    end
    4'b0101: begin
        ALU_OUT_COMB=A|B;
    end
    4'b0110: begin
        ALU_OUT_COMB=~(A&B);
    end
    4'b0111: begin
        ALU_OUT_COMB=~(A|B);
    end
    4'b1000: begin
        ALU_OUT_COMB=A^B;
    end
    4'b1001: begin
        ALU_OUT_COMB=~(A^B);
    end
    4'b1010: begin
       ALU_OUT_COMB=(A==B) ? 16'd1 :16'd0;
    end
    4'b1011: begin
       ALU_OUT_COMB=(A>B) ? 16'd2 :16'd0;
    end
    4'b1100: begin
       ALU_OUT_COMB=(A<B) ? 16'd3 :16'd0;
    end
    4'b1101: begin
        ALU_OUT_COMB=A>>1;
    end
    4'b1110: begin
        ALU_OUT_COMB=A<<1;
    end
    default: begin
        ALU_OUT_COMB=16'b0;
    end

    endcase
   end
end
endmodule

