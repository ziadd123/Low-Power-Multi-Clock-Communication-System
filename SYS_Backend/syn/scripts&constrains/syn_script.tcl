########################### Define Top Module ############################

set top_module SYS_TOP

##################### Define Working Library Directory ######################

define_design_lib work -path ./work
########################### Formality Setup file ############################

set_svf SYS_TOP.svf

######################## Output Directories Setup ############################
file mkdir results
file mkdir reports

set RESULTS_DIR results
set REPORTS_DIR reports

################## Design Compiler Library Files #setup ######################

lappend search_path /home/ICer/SYS_ASIC_FLOW/syn/std_cells
lappend search_path /home/ICer/SYS_ASIC_FLOW/syn/SYS_RTL


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


###################### Defining toplevel ###################################
elaborate -lib work $top_module


#################### elaborate All The Design Parts #########################

puts "###############################################"
puts "######## elaborate All The Design Parts #########"
puts "###############################################"
current_design $top_module


#################### Checking Design Consistency ###########################

puts "###############################################"
puts "######## checking design consistency ##########"
puts "###############################################"

check_design > $REPORTS_DIR/check_design.rpt

############################### Path groups ################################

puts "###############################################"
puts "################ Path groups ##################"
puts "###############################################"

group_path -name INREG  -from [all_inputs]
group_path -name REGOUT -to   [all_outputs]
group_path -name INOUT  -from [all_inputs] -to [all_outputs]

#################### Define Design Constraints #########################

puts "###############################################"
puts "############ Design Constraints #### ##########"
puts "###############################################"

source -echo ./cons.tcl

###################### Mapping and optimization ########################

puts "###############################################"
puts "########## Mapping & Optimization #############"
puts "###############################################"

compile -map_effort high
##################### Close Formality Setup file ###########################

set_svf -off


#############################################################################

puts "###############################################"
puts "########## Writing Design to results/ ##########"
puts "###############################################"
write_file -format verilog -hierarchy -output $RESULTS_DIR/SYS_TOP.v
write_file -format ddc     -hierarchy -output $RESULTS_DIR/SYS_TOP.ddc
write_sdc  -nosplit $RESULTS_DIR/SYS_TOP.sdc
write_sdf           $RESULTS_DIR/SYS_TOP.sdf

################# reporting #######################
# All analysis/QoR reports go into $REPORTS_DIR, grouped by category
# (area, power, timing min/max, clocks, constraint violations).
#####################################################

puts "###############################################"
puts "############## Writing Reports #################"
puts "###############################################"
report_area                                    -hierarchy   > $REPORTS_DIR/area.rpt
report_power                                   -hierarchy   > $REPORTS_DIR/power.rpt
report_timing -max_paths 100 -delay_type min                > $REPORTS_DIR/hold.rpt
report_timing -max_paths 100 -delay_type max                > $REPORTS_DIR/setup.rpt
report_clock  -attributes                                   > $REPORTS_DIR/clocks.rpt
report_constraint -all_violators                            > $REPORTS_DIR/constraints.rpt

################# starting graphical user interface #######################
#gui_start
exit
