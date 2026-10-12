########################### Define Top Module ############################

set top_module SYS_TOP

##################### Define Working Library Directory ######################

define_design_lib work -path ./work
########################### Formality Setup file ############################

set_svf SYS_TOP_dft.svf

######################## Output Directories Setup ############################
file mkdir results
file mkdir reports

set RESULTS_DIR results
set REPORTS_DIR reports

################## Design Compiler Library Files #setup ######################

lappend search_path /home/ICer/SYS_ASIC_FLOW/dft/std_cells
lappend search_path /home/ICer/SYS_ASIC_FLOW/dft/SYS_RTL

set SSLIB "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

## Standard Cell libraries
set target_library [list $SSLIB $TTLIB $FFLIB]

## Standard Cell & Hard Macros libraries
set link_library [list * $SSLIB $TTLIB $FFLIB]

#echo "###############################################"
#echo "############# Reading RTL Files  ##############"
#echo "###############################################"

set file_format verilog
analyze -format $file_format ALU.v
analyze -format $file_format ASYNC_FIFO_TOP.v
analyze -format $file_format CLK_DIV.v
analyze -format $file_format CLKDIV_MUX.v
analyze -format $file_format CLK_GATE.v
analyze -format $file_format data_sampling.v
analyze -format $file_format DATA_SYNC.v
analyze -format $file_format deserializer.v
analyze -format $file_format DF_SYNC.v
analyze -format $file_format edge_bit_counter.v
analyze -format $file_format FIFO_MEM.v
analyze -format $file_format FIFO_RD.v
analyze -format $file_format FIFO_WR.v
analyze -format $file_format FSM.v
analyze -format $file_format MUX.v
analyze -format $file_format PAR_CALC.v
analyze -format $file_format parity_check.v
analyze -format $file_format PUL_GEN.v
analyze -format $file_format reg_file.v
analyze -format $file_format RST_SYNC.v
analyze -format $file_format RX_FSM.v
analyze -format $file_format RX_TOP.v
analyze -format $file_format serializer.v
analyze -format $file_format start_check.v
analyze -format $file_format stop_check.v
analyze -format $file_format SYS_CTRL.v
analyze -format $file_format SYS_TOP.v
analyze -format $file_format TOP_UART.v
analyze -format $file_format TX_TOP.v
analyze -format $file_format mux2X1.v



#################### elaborate All The Design Parts #########################

elaborate -lib work $top_module

###################### Defining toplevel ###################################
puts "###############################################"
puts "######## elaborate All The Design Parts #########"
puts "###############################################
"
current_design $top_module


#################### Checking Design Consistency ###########################

puts "###############################################"
puts "######## checking design consistency ##########"
puts "###############################################"

check_design > $REPORTS_DIR/check_design.rpt

#################### Define Design Constraints #########################

puts "###############################################"
puts "############ Design Constraints #### ##########"
puts "###############################################"

source -echo ./cons.tcl
#################### Archirecture Scan Chains #########################
puts "###############################################"
puts "############ Configure scan chains ############"
puts "###############################################"

set_scan_configuration -clock_mixing no_mix  \
                       -style multiplexed_flip_flop \
                       -replace true -max_length 100  

###################### Mapping and optimization ########################

puts "###############################################"
puts "########## Mapping & Optimization #############"
puts "###############################################"

compile -scan
##################### Close Formality Setup file ###########################

set_svf -off

########################## Define DFT Signals ##########################

set_dft_signal -port [get_ports scan_clk]  -type ScanClock   -view existing_dft  -timing {45 95}
set_dft_signal -port [get_ports scan_rst]  -type Reset       -view existing_dft  -active_state 0
set_dft_signal -port [get_ports test_mode] -type Constant    -view existing_dft  -active_state 1 
set_dft_signal -port [get_ports test_mode] -type TestMode    -view spec          -active_state 1 
set_dft_signal -port [get_ports SE]        -type ScanEnable  -view spec          -active_state 1   -usage scan
set_dft_signal -port [get_ports SI]        -type ScanDataIn  -view spec 
set_dft_signal -port [get_ports SO]        -type ScanDataOut -view spec  


############################# Create Test Protocol #######################
                                           
create_test_protocol

###################### Pre-DFT Design Rule Checking #######################

dft_drc -verbose


############################# Preview DFT ##############################

preview_dft -show scan_summary

############################# Insert DFT ##############################

insert_dft
compile -scan -incremental

###################### Design Rule Checking #######################

dft_drc -verbose -coverage_estimate

#############################################################################
# Write out files
#############################################################################

write_file -format verilog -hierarchy -output SYS_DFT.v

####################### reporting ##########################################

report_area                                    -hierarchy   > $REPORTS_DIR/area_dft.rpt
report_power                                   -hierarchy   > $REPORTS_DIR/power_dft.rpt
report_timing -max_paths 100 -delay_type min                > $REPORTS_DIR/hold_dft.rpt
report_timing -max_paths 100 -delay_type max                > $REPORTS_DIR/setup_dft.rpt
report_clock  -attributes                                   > $REPORTS_DIR/clocks_dft.rpt
report_constraint -all_violators                            > $REPORTS_DIR/constraints_dft.rpt

################# starting graphical user interface #######################

#gui_start

exit
