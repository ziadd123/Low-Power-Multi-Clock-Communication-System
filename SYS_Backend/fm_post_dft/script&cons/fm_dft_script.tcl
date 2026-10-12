
###################################################################
########################### Variables #############################
###################################################################

set SSLIB "/home/ICer/Labs/Lab_Formal_2/std_cells/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/home/ICer/Labs/Lab_Formal_2/std_cells/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/home/ICer/Labs/Lab_Formal_2/std_cells/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

###################################################################
############################ Guidance #############################
###################################################################

# Synopsys setup variable
set synopsys_auto_setup true

# Formality Setup File
set_svf /home/ICer/SYS_ASIC_FLOW/dft/dft/SYS_TOP_dft.svf
###################################################################
###################### Reference Container ########################
###################################################################

# Read Reference Design Verilog Files
read_verilog -container Ref /home/ICer/SYS_ASIC_FLOW/dft/SYS_RTL/SYS_TOP.v
read_verilog -container Ref /home/ICer/SYS_ASIC_FLOW/dft/SYS_RTL/ALU.v
read_verilog -container Ref /home/ICer/SYS_ASIC_FLOW/dft/SYS_RTL/ASYNC_FIFO_TOP.v
read_verilog -container Ref /home/ICer/SYS_ASIC_FLOW/dft/SYS_RTL/CLK_DIV.v
read_verilog -container Ref /home/ICer/SYS_ASIC_FLOW/dft/SYS_RTL/CLKDIV_MUX.v
read_verilog -container Ref /home/ICer/SYS_ASIC_FLOW/dft/SYS_RTL/CLK_GATE.v
read_verilog -container Ref /home/ICer/SYS_ASIC_FLOW/dft/SYS_RTL/data_sampling.v
read_verilog -container Ref /home/ICer/SYS_ASIC_FLOW/dft/SYS_RTL/DATA_SYNC.v
read_verilog -container Ref /home/ICer/SYS_ASIC_FLOW/dft/SYS_RTL/deserializer.v
read_verilog -container Ref /home/ICer/SYS_ASIC_FLOW/dft/SYS_RTL/DF_SYNC.v
read_verilog -container Ref /home/ICer/SYS_ASIC_FLOW/dft/SYS_RTL/edge_bit_counter.v
read_verilog -container Ref /home/ICer/SYS_ASIC_FLOW/dft/SYS_RTL/FIFO_MEM.v
read_verilog -container Ref /home/ICer/SYS_ASIC_FLOW/dft/SYS_RTL/FIFO_RD.v
read_verilog -container Ref /home/ICer/SYS_ASIC_FLOW/dft/SYS_RTL/FIFO_WR.v
read_verilog -container Ref /home/ICer/SYS_ASIC_FLOW/dft/SYS_RTL/FSM.v
read_verilog -container Ref /home/ICer/SYS_ASIC_FLOW/dft/SYS_RTL/MUX.v
read_verilog -container Ref /home/ICer/SYS_ASIC_FLOW/dft/SYS_RTL/PAR_CALC.v
read_verilog -container Ref /home/ICer/SYS_ASIC_FLOW/dft/SYS_RTL/parity_check.v
read_verilog -container Ref /home/ICer/SYS_ASIC_FLOW/dft/SYS_RTL/PUL_GEN.v
read_verilog -container Ref /home/ICer/SYS_ASIC_FLOW/dft/SYS_RTL/reg_file.v
read_verilog -container Ref /home/ICer/SYS_ASIC_FLOW/dft/SYS_RTL/RST_SYNC.v
read_verilog -container Ref /home/ICer/SYS_ASIC_FLOW/dft/SYS_RTL/RX_FSM.v
read_verilog -container Ref /home/ICer/SYS_ASIC_FLOW/dft/SYS_RTL/RX_TOP.v
read_verilog -container Ref /home/ICer/SYS_ASIC_FLOW/dft/SYS_RTL/serializer.v
read_verilog -container Ref /home/ICer/SYS_ASIC_FLOW/dft/SYS_RTL/start_check.v
read_verilog -container Ref /home/ICer/SYS_ASIC_FLOW/dft/SYS_RTL/stop_check.v
read_verilog -container Ref /home/ICer/SYS_ASIC_FLOW/dft/SYS_RTL/SYS_CTRL.v
read_verilog -container Ref /home/ICer/SYS_ASIC_FLOW/dft/SYS_RTL/TOP_UART.v
read_verilog -container Ref /home/ICer/SYS_ASIC_FLOW/dft/SYS_RTL/TX_TOP.v
read_verilog -container Ref /home/ICer/SYS_ASIC_FLOW/dft/SYS_RTL/mux2X1.v

# Read Reference technology libraries
read_db -container Ref [list $SSLIB $TTLIB $FFLIB]

# set the top Reference Design 
set_reference_design SYS_TOP
set_top SYS_TOP


###################################################################
#################### Implementation Container #####################
###################################################################

# Read Implementation Design Files
read_verilog -container Imp /home/ICer/SYS_ASIC_FLOW/dft/dft/SYS_DFT.v
# Read Implementation technology libraries
read_db -container Imp [list $SSLIB $TTLIB $FFLIB]


# set the top Implementation Design
set_implementation_design SYS_TOP
set_top SYS_TOP
#set the scan mode signals to 0 to compare only the functional RTL
set_constant -type port Ref:/WORK/SYS_TOP/test_mode 0
set_constant -type port Imp:/WORK/SYS_TOP/test_mode 0

set_constant -type port Ref:/WORK/SYS_TOP/SE 0
set_constant -type port Imp:/WORK/SYS_TOP/SE 0


set_dont_verify_points -type port Ref:/WORK/SYS_TOP/SO
set_dont_verify_points -type port Imp:/WORK/SYS_TOP/SO
###################### Matching Compare points ####################

match

######################### Run Verification ########################

set successful [verify]
if {!$successful} {
diagnose
analyze_points -failing
}

########################### Reporting ############################# 
report_passing_points > "passing_points.rpt"
report_failing_points > "failing_points.rpt"
report_aborted_points > "aborted_points.rpt"
report_unverified_points > "unverified_points.rpt"


start_gui

