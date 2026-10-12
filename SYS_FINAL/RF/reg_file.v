module reg_file #(parameter WIDTH = 8, DEPTH = 16, ADDR = 4)
(
input [WIDTH-1:0] WrData,
input [ADDR-1:0]Address,
input WrEn,
input RdEn,
input CLK,
input rst,
output reg [WIDTH-1:0] RdData,
output reg RdData_Valid,
output [WIDTH-1:0] REG0,
output [WIDTH-1:0] REG1,
output [WIDTH-1:0] REG2,
output [WIDTH-1:0] REG3
);



reg [WIDTH-1:0] Reg_file [0:DEPTH-1];

integer i;  

always @(posedge CLK or negedge rst) begin
    if (!rst) begin         
        RdData <= 8'b0;
        RdData_Valid <= 1'b0;
        for (i = 0; i < DEPTH; i = i + 1) begin
            if (i == 2)
                Reg_file[i] <= 8'b100000_01;// REG2 default: Prescale=32, Parity_en=1
            else if (i == 3)
                Reg_file[i] <= 8'b0010_0000;// REG3 default: Div_ratio=32
            else
                Reg_file[i] <= 8'b0;
        end
    end
 else begin

     //WRITE OPERATION   
         if (WrEn) begin
            Reg_file[Address] <= WrData;
        end

 if (RdEn) begin //READ OPERATION
            RdData <= Reg_file[Address];
            RdData_Valid <= 1'b1;
        end
        else begin
            RdData <= 8'b0;
            RdData_Valid <= 1'b0;
        end
    end
end 

assign REG0 = Reg_file[0];
assign REG1 = Reg_file[1];
assign REG2 = Reg_file[2];
assign REG3 = Reg_file[3];

endmodule
