module FSM (
  input data_valid,
  input PAR_EN,
  input ser_done,
  input clk,
  input rst,
  output reg [1:0] sel,
  output reg busy,
  output reg ser_en 
);

reg [2:0] current_state, next_state;

localparam IDLE   = 3'b000,
           START  = 3'b001,
           DATA   = 3'b011,
           PARITY = 3'b010,
           STOP   = 3'b110; 

// Sequential state transition
always @(posedge clk or negedge rst) begin
    if (!rst) begin
        current_state <= IDLE; 
    end else begin
        current_state <= next_state;
    end
end

// Combinational next state & output logic
always @(*) begin
    sel        = 2'b11; 
    ser_en     = 1'b0;
    busy       = 1'b1;
    next_state = current_state;

    case (current_state)
        IDLE: begin
            sel  = 2'b11; 
            busy = 1'b0;
            if (data_valid)
                next_state = START;
            else
                next_state = IDLE;
        end
        START: begin
            sel        = 2'b00; // start bit = 0
            next_state = DATA;
        end
        DATA: begin
            ser_en = 1'b1;
            sel    = 2'b01; // serial data
            if (ser_done) begin
                if (PAR_EN)
                    next_state = PARITY;
                else
                    next_state = STOP;  
            end else begin
                next_state = DATA;
            end
        end
        PARITY: begin
            sel        = 2'b10; // parity bit
            next_state = STOP;
        end
        STOP: begin
            sel        = 2'b11; // stop bit
            next_state = IDLE;
        end
        default: next_state = IDLE;
    endcase
end

endmodule