
####################################################################################
           #########################################################
                  #### Section 1 : Clock Definition ####
           #########################################################
#################################################################################### 
# 1. Master Clock Definitions 
# 2. Generated Clock Definitions
# 3. Clock Latencies
# 4. Clock Uncertainties
# 4. Clock Transitions
####################################################################################

############# REF_CLK constrains ##############
set CLK_NAME REF_CLK
set CLK_PER 20
set CLK_SETUP_SKEW 0.2
set CLK_HOLD_SKEW 0.1
set CLK_LAT 0
set CLK_RISE 0.05
set CLK_FALL 0.05

create_clock -name $CLK_NAME -period $CLK_PER -waveform "0 [expr $CLK_PER/2]" [get_ports REF_CLK]
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks $CLK_NAME]
set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clocks $CLK_NAME]
set_clock_transition -rise $CLK_RISE  [get_clocks $CLK_NAME]
set_clock_transition -fall $CLK_FALL  [get_clocks $CLK_NAME]
set_clock_latency $CLK_LAT [get_clocks $CLK_NAME]

############# UART_CLK constrains ##############
create_clock -name UART_CLK -period 271.27 -waveform {0 135.635} [get_ports UART_CLK]
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks UART_CLK]
set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clocks UART_CLK]
set_clock_transition -rise $CLK_RISE  [get_clocks UART_CLK]
set_clock_transition -fall $CLK_FALL  [get_clocks UART_CLK]
set_clock_latency $CLK_LAT [get_clocks UART_CLK]
####################################################################################
           #########################################################
                  #### Section 2 : generated Clocks Definition ####
           #########################################################
#################################################################################### 

############# TX_CLK constrains ##############
create_generated_clock -name UART_TX_CLK \
    -source [get_ports UART_CLK] \
    -divide_by 32 \
    [get_pins U0_ClkDiv/o_div_clk]

set_clock_uncertainty -setup 0.2 [get_clocks UART_TX_CLK]
set_clock_uncertainty -hold  0.1 [get_clocks UART_TX_CLK]


############# RX_CLK constrains ##############
create_generated_clock -name UART_RX_CLK \
    -source [get_ports UART_CLK] \
    -divide_by 1 \
    [get_pins U1_ClkDiv/o_div_clk]

set_clock_uncertainty -setup 0.2 [get_clocks UART_RX_CLK]
set_clock_uncertainty -hold  0.1 [get_clocks UART_RX_CLK]

############# ALU_CLK constrains ##############
create_generated_clock -name ALU_CLK \
    -source [get_ports REF_CLK] \
    -divide_by 1 \
    [get_pins U0_CLK_GATE/U0_TLATNCAX12M/ECK]

set_clock_uncertainty -setup 0.2 [get_clocks ALU_CLK]
set_clock_uncertainty -hold  0.1 [get_clocks ALU_CLK]

############# dont_touch constrains constrains ##############
set_dont_touch_network [get_clocks REF_CLK]
set_dont_touch_network [get_clocks UART_CLK]
set_dont_touch_network [get_clocks UART_TX_CLK]
set_dont_touch_network [get_clocks UART_RX_CLK]
set_dont_touch_network [get_clocks ALU_CLK]

					  
####################################################################################
           #########################################################
             #### Section 3 : set input/output delay on ports ####
####################################################################################
     
#set in_delay  [expr 0.2*$CLK_PER]
#set out_delay [expr 0.2*$CLK_PER]

#Constrain Input Paths

set_input_delay  4.0 -clock UART_CLK [get_ports UART_RX_IN]

#Constrain Output Paths

set_output_delay  4.0 -clock UART_CLK [get_ports UART_TX_O]

set_output_delay  4.0 -clock UART_CLK [get_ports parity_error]


set_output_delay 4.0 -clock UART_CLK [get_ports framing_error]


####################################################################################
           #########################################################
                  #### Section 4 : Driving cells ####
           #########################################################
####################################################################################

set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_ports UART_RX_IN]

####################################################################################
           #########################################################
                  #### Section 5 : Output load ####
           #########################################################
####################################################################################

set_load 0.05 [get_ports {UART_TX_O parity_error framing_error}]

####################################################################################
           #########################################################
                 #### Section 6 : Operating Condition ####
           #########################################################
####################################################################################

# Define the Worst Library for Max(#setup) analysis
# Define the Best Library for Min(hold) analysis

set_operating_conditions -min_library "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" \
                         -min "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" \
						 -max_library "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c" \
						 -max "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c"

####################################################################################
           #########################################################
                  #### Section 7 : clock grouping ####
           #########################################################
####################################################################################


set_clock_groups -asynchronous \
    -group [get_clocks {REF_CLK ALU_CLK}] \
    -group [get_clocks {UART_CLK UART_TX_CLK UART_RX_CLK}]


