###################################################################

# Created by write_sdc on Wed Sep 30 00:54:29 2026

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -max_library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -min scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c -min_library scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports UART_RX_IN]
set_load -pin_load 0.05 [get_ports UART_TX_O]
set_load -pin_load 0.05 [get_ports parity_error]
set_load -pin_load 0.05 [get_ports framing_error]
create_clock [get_ports REF_CLK]  -period 20  -waveform {0 10}
set_clock_latency 0  [get_clocks REF_CLK]
set_clock_uncertainty -setup 0.2  [get_clocks REF_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks REF_CLK]
set_clock_transition -max -rise 0.05 [get_clocks REF_CLK]
set_clock_transition -min -rise 0.05 [get_clocks REF_CLK]
set_clock_transition -max -fall 0.05 [get_clocks REF_CLK]
set_clock_transition -min -fall 0.05 [get_clocks REF_CLK]
create_clock [get_ports UART_CLK]  -period 271.27  -waveform {0 135.635}
set_clock_latency 0  [get_clocks UART_CLK]
set_clock_uncertainty -setup 0.2  [get_clocks UART_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks UART_CLK]
set_clock_transition -max -rise 0.05 [get_clocks UART_CLK]
set_clock_transition -min -rise 0.05 [get_clocks UART_CLK]
set_clock_transition -max -fall 0.05 [get_clocks UART_CLK]
set_clock_transition -min -fall 0.05 [get_clocks UART_CLK]
create_generated_clock [get_pins U0_ClkDiv/o_div_clk]  -name UART_TX_CLK  -source [get_ports UART_CLK]  -divide_by 32
set_clock_uncertainty -setup 0.2  [get_clocks UART_TX_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks UART_TX_CLK]
create_generated_clock [get_pins U1_ClkDiv/o_div_clk]  -name UART_RX_CLK  -source [get_ports UART_CLK]  -divide_by 1
set_clock_uncertainty -setup 0.2  [get_clocks UART_RX_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks UART_RX_CLK]
create_generated_clock [get_pins U0_CLK_GATE/U0_TLATNCAX12M/ECK]  -name ALU_CLK  -source [get_ports REF_CLK]  -divide_by 1
set_clock_uncertainty -setup 0.2  [get_clocks ALU_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks ALU_CLK]
group_path -name INOUT  -from [list [get_ports RST_N] [get_ports UART_CLK] [get_ports REF_CLK] [get_ports UART_RX_IN]]  -to [list [get_ports UART_TX_O] [get_ports parity_error] [get_ports framing_error]]
group_path -name INREG  -from [list [get_ports RST_N] [get_ports UART_CLK] [get_ports REF_CLK] [get_ports UART_RX_IN]]
group_path -name REGOUT  -to [list [get_ports UART_TX_O] [get_ports parity_error] [get_ports framing_error]]
set_input_delay -clock UART_CLK  4  [get_ports UART_RX_IN]
set_output_delay -clock UART_CLK  4  [get_ports UART_TX_O]
set_output_delay -clock UART_CLK  4  [get_ports parity_error]
set_output_delay -clock UART_CLK  4  [get_ports framing_error]
set_clock_groups -asynchronous -name REF_CLK_1 -group [list [get_clocks REF_CLK] [get_clocks ALU_CLK]] -group [list [get_clocks UART_CLK] [get_clocks UART_TX_CLK] [get_clocks UART_RX_CLK]]
