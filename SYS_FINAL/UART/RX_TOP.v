module RX_TOP (
    input         clk,
    input         rst,
    input         RX_IN,
    input   [5:0] prescale,
    input         PAR_EN,
    input         PAR_TYP,
    output  [7:0] P_DATA,
    output        data_valid,
    output        parity_error,
    output        stop_error
);

    // Internal Signal Wires
    wire       counter_en;
    wire       data_samp_en;
    wire       deser_en;
    wire       start_check_en;
    wire       parity_check_en;
    wire       stop_check_en;
    wire       sampled_bit;
    wire       start_error;
    wire [5:0] edge_cnt;
    wire [3:0] bit_cnt;
    

    // 1. Data Sampling Sub-module
    data_sampling u_data_sampling (
        .clk          (clk),
        .rst          (rst),
        .RX_IN        (RX_IN),
        .prescale     (prescale),
        .edge_cnt     (edge_cnt),
        .data_samp_en (data_samp_en),
        .sampled_bit  (sampled_bit)
    );

    // 2. Edge & Bit Counter Sub-module
    edge_bit_counter u_edge_bit_counter (
        .clk      (clk),
        .rst      (rst),
        .counter_en(counter_en),
        .prescale (prescale),
        .edge_cnt (edge_cnt),
        .bit_cnt  (bit_cnt)
    );

    // 3. Deserializer Sub-module
    deserializer u_deserializer (
        .clk         (clk),
        .rst         (rst),
        .deser_en    (deser_en),
        .sampled_bit (sampled_bit),
        .prescale    (prescale),
        .edge_cnt    (edge_cnt),
        .P_DATA      (P_DATA)
    );

    // 4. Start Check Sub-module
    start_check u_start_check (
        .clk            (clk),
        .rst            (rst),
        .start_check_en (start_check_en),
        .sampled_bit    (sampled_bit),
        .prescale       (prescale),
        .edge_cnt       (edge_cnt),
        .start_error   (start_error)
    );

    // 5. Parity Check Sub-module
    parity_check u_parity_check (
        .clk             (clk),
        .rst             (rst),
        .parity_check_en (parity_check_en),
        .prescale        (prescale),
        .edge_cnt        (edge_cnt),
        .P_DATA          (P_DATA),
        .sampled_bit     (sampled_bit),
        .PAR_TYP         (PAR_TYP),
        .parity_error    (parity_error)
    );

    // 6. Stop Check Sub-module
    stop_check u_stop_check (
        .clk           (clk),
        .rst           (rst),
        .stop_check_en (stop_check_en),
        .sampled_bit   (sampled_bit),
        .prescale      (prescale),
        .edge_cnt      (edge_cnt),
        .stop_error    (stop_error)
    );

    // 7. Finite State Machine Controller
    RX_FSM u_RX_FSM (
        .clk             (clk),
        .rst             (rst),
        .RX_IN           (RX_IN),
        .prescale        (prescale),
        .parity_error    (parity_error),
        .stop_error      (stop_error),
        .start_error     (start_error),
        .PAR_EN          (PAR_EN),
        .bit_cnt         (bit_cnt),
        .edge_cnt        (edge_cnt),
        .data_samp_en    (data_samp_en),
        .counter_en       (counter_en),
        .start_check_en  (start_check_en),
        .stop_check_en   (stop_check_en),
        .parity_check_en (parity_check_en),
        .data_valid      (data_valid),
        .deser_en        (deser_en)
    );

endmodule
