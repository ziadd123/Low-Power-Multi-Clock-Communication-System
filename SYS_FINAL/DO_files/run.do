# ==============================================================================
# DO File for System Simulation
# ==============================================================================

vlib work
vmap work work

vlog -work work ../*/*.v

vsim -t 1ps -voptargs="+acc" work.tb_SYS_TOP


do wave.do

run -all

wave zoomfull