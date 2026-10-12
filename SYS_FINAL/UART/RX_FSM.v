module RX_FSM(
    input clk,
    input rst,
    input RX_IN,
    input [5:0] prescale,
    input parity_error,
    input stop_error,
    input start_error,
    input PAR_EN,
    input [3:0] bit_cnt,
    input [5:0] edge_cnt,

    output reg data_samp_en,
    output reg counter_en,
    output reg start_check_en,
    output reg stop_check_en,
    output reg parity_check_en,
    output reg data_valid,
    output reg deser_en
);
reg data_valid_c;

reg [2:0] current_state, next_state;

localparam IDLE = 3'd0,
           START = 3'd1,
           DATA = 3'd2,
           PARITY = 3'd3,
           STOP = 3'd4,
           CHK = 3'd5;

           always@(posedge clk or negedge rst) begin
                 if(!rst) begin
                     current_state <= IDLE;
                 end
                 else begin
                     current_state <= next_state;
                 end
           end
//register the data_valid signal to prevent glitches
always@(posedge clk or negedge rst) begin
                 if(!rst) begin
                     data_valid <= 1'b0;
                 end
                 else begin
                     data_valid<= data_valid_c;
                 end
           end


/////////////next state logic//////////////
           always @(*) begin
            next_state=IDLE;
            case(current_state)
                IDLE: begin
                    
                    if(RX_IN==1'b0) begin
                        next_state=START;
                    end
                    else begin
                        next_state=IDLE;
                    end
                end

                START: begin
                    if(edge_cnt==prescale-6'd1 && start_error==1'b0) begin
                        next_state=DATA;
                    end
                    else if(start_error==1'b1) begin
                        next_state=IDLE;
                    end
                    else begin
                        next_state=START;
                    end
                end

                DATA: begin
                    if(edge_cnt==prescale-6'd1 && bit_cnt==4'd8) begin
                        if(PAR_EN==1'b1) begin
                            next_state=PARITY;
                        end
                        else begin
                            next_state=STOP;
                        end
                    end
                    else begin
                        next_state=DATA;
                    end
                end

                PARITY: begin 
                    if(edge_cnt==prescale-6'd1) begin
                        next_state=STOP;
                    end
                    else begin
                        next_state=PARITY;
                    end
                end

                STOP: begin
                     if(edge_cnt==prescale-6'd1) begin
                        next_state=CHK;
                    end
                    else begin
                        next_state=STOP;
                    end
                end

                    CHK: begin 
                        if(stop_error==1'b1 || parity_error==1'b1) begin
                            next_state=IDLE;
                        end
                        else if(!RX_IN) begin
                            next_state=START;//back to back frames support
                        end else begin
                            next_state=IDLE;
                        end
                    end

                    default: begin
                        next_state=IDLE;
                    end
            endcase

           end

/////////// //control signals logic//////////////

always @(*) begin

data_samp_en=1'b1;
counter_en=1'b1;
start_check_en=1'b0;
stop_check_en=1'b0;
parity_check_en=1'b0;
data_valid_c=1'b0;
deser_en=1'b0;

case(current_state)

IDLE: begin 
    data_samp_en=1'b0;
    counter_en=1'b0;
end

START: begin
    data_samp_en=1'b1;
    counter_en=1'b1;
    start_check_en=1'b1;
end

DATA: begin
    data_samp_en=1'b1;
    counter_en=1'b1;
    deser_en=1'b1;
end

PARITY: begin
    data_samp_en=1'b1;
    counter_en=1'b1;
    parity_check_en=1'b1;
end

STOP: begin
    data_samp_en=1'b1;
    counter_en=1'b1;
    stop_check_en=1'b1;  
end

CHK: begin
    data_samp_en=1'b0;
    counter_en=1'b0;
    if(stop_error==1'b0 && parity_error==1'b0) begin
        data_valid_c=1'b1;
    end else begin
        data_valid_c=1'b0;
    end
end
endcase
       end

endmodule
