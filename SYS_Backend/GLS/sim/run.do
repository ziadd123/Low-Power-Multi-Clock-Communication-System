vlib work
vmap work

# Compile Standard Cell Library
vlog -sv /home/ICer/SYS_ASIC_FLOW/GLS/std_cells/tsmc13_m.v

# Compile Gate-Level Netlist
vlog -sv /home/ICer/SYS_ASIC_FLOW/GLS/PNR_files/export/SYS_TOP.v

# Compile Testbench
vlog -sv SYS_TB.v

# Start Simulation
vsim -sdfmax /tb_SYS_TOP/DUT=/home/ICer/SYS_ASIC_FLOW/GLS/PNR_files/export/SYS_TOP.sdf -sdfnoerror -voptargs=+acc work.tb_SYS_TOP

# Load waveform 
do wave.do

# Run
run -all
