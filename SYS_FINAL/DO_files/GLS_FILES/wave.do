onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group Clocks&Resets -color Yellow -radix binary /tb_SYS_TOP/RST_N
add wave -noupdate -expand -group Clocks&Resets -color Yellow -radix binary /tb_SYS_TOP/DUT/SYNC_REF_RST
add wave -noupdate -expand -group Clocks&Resets -color Yellow -radix binary /tb_SYS_TOP/DUT/SYNC_UART_RST
add wave -noupdate -expand -group Clocks&Resets -color Yellow -radix binary /tb_SYS_TOP/REF_CLK
add wave -noupdate -expand -group Clocks&Resets -color Yellow -radix binary /tb_SYS_TOP/UART_CLK
add wave -noupdate -expand -group Clocks&Resets -color Yellow -radix binary /tb_SYS_TOP/DUT/UART_RX_CLK
add wave -noupdate -expand -group Clocks&Resets -color Yellow -radix binary /tb_SYS_TOP/DUT/UART_TX_CLK
add wave -noupdate -expand -group UART_RX_interface -color Orange -radix binary /tb_SYS_TOP/UART_RX_IN
add wave -noupdate -expand -group UART_RX_interface -color Orange -radix binary /tb_SYS_TOP/DUT/UART_RX_SYNC
add wave -noupdate -expand -group UART_RX_interface -color Orange -radix binary /tb_SYS_TOP/DUT/UART_RX_OUT
add wave -noupdate -expand -group UART_RX_interface -color Orange -radix binary /tb_SYS_TOP/DUT/UART_RX_V_OUT
add wave -noupdate -expand -group UART_RX_interface -color Orange -radix binary /tb_SYS_TOP/DUT/UART_RX_V_SYNC
add wave -noupdate -expand -group UART_RX_interface -expand -group UART_TX_interface -color Red -radix binary /tb_SYS_TOP/DUT/UART_TX_IN
add wave -noupdate -expand -group UART_RX_interface -expand -group UART_TX_interface -color Red -radix binary /tb_SYS_TOP/UART_TX_O
add wave -noupdate -expand -group UART_RX_interface -expand -group UART_TX_interface -color Red -radix binary /tb_SYS_TOP/DUT/UART_TX_VLD
add wave -noupdate -expand -group UART_RX_interface -expand -group UART_TX_interface -color Red -radix binary /tb_SYS_TOP/DUT/UART_TX_SYNC
add wave -noupdate -expand -group UART_RX_interface -expand -group UART_TX_interface -color Red -radix binary /tb_SYS_TOP/DUT/UART_TX_V_SYNC
add wave -noupdate -expand -group UART_RX_interface -expand -group UART_TX_interface -color Red -radix binary /tb_SYS_TOP/DUT/UART_TX_Busy
add wave -noupdate -expand -group UART_RX_interface -expand -group UART_TX_interface -color Red -radix binary /tb_SYS_TOP/DUT/UART_TX_Busy_PULSE
add wave -noupdate -expand -group UART_RX_interface -expand -group UART_TX_interface -color Red -radix binary /tb_SYS_TOP/DUT/FIFO_FULL
add wave -noupdate -expand -group UART_RX_interface -expand -group UART_TX_interface -color Red -radix binary /tb_SYS_TOP/parity_error
add wave -noupdate -expand -group UART_RX_interface -expand -group UART_TX_interface -color Red -radix binary /tb_SYS_TOP/framing_error
add wave -noupdate -expand -group UART_RX_interface -color Magenta -radix binary /tb_SYS_TOP/DUT/UART_Config
add wave -noupdate -expand -group states -color Cyan -radix hexadecimal /tb_SYS_TOP/DUT/U0_SYS_CTRL/state
add wave -noupdate -expand -group states -color Cyan -radix hexadecimal /tb_SYS_TOP/DUT/U0_SYS_CTRL/nstate
add wave -noupdate -expand -group REGS -color Blue -radix unsigned /tb_SYS_TOP/DUT/U0_RegFile/REG0
add wave -noupdate -expand -group REGS -color Blue -radix unsigned /tb_SYS_TOP/DUT/U0_RegFile/REG1
add wave -noupdate -expand -group REGS -color Blue -radix hexadecimal /tb_SYS_TOP/DUT/U0_RegFile/REG2
add wave -noupdate -expand -group REGS -color Blue -radix unsigned /tb_SYS_TOP/DUT/U0_RegFile/REG3
add wave -noupdate -expand -group {ALU signals} -color Cyan -radix binary /tb_SYS_TOP/DUT/ALU_EN
add wave -noupdate -expand -group {ALU signals} -color Cyan -radix binary /tb_SYS_TOP/DUT/CLKG_EN
add wave -noupdate -expand -group {ALU signals} -color Cyan -radix binary /tb_SYS_TOP/DUT/ALU_CLK
add wave -noupdate -expand -group {ALU signals} -color Cyan -radix binary /tb_SYS_TOP/DUT/ALU_FUN
add wave -noupdate -expand -group {ALU signals} -color {Steel Blue} -radix binary /tb_SYS_TOP/DUT/Operand_A
add wave -noupdate -expand -group {ALU signals} -color {Steel Blue} -radix binary /tb_SYS_TOP/DUT/Operand_B
add wave -noupdate -expand -group {ALU signals} -color {Steel Blue} -radix hexadecimal -childformat {{{/tb_SYS_TOP/DUT/U0_ALU/ALU_OUT[15]} -radix hexadecimal} {{/tb_SYS_TOP/DUT/U0_ALU/ALU_OUT[14]} -radix hexadecimal} {{/tb_SYS_TOP/DUT/U0_ALU/ALU_OUT[13]} -radix hexadecimal} {{/tb_SYS_TOP/DUT/U0_ALU/ALU_OUT[12]} -radix hexadecimal} {{/tb_SYS_TOP/DUT/U0_ALU/ALU_OUT[11]} -radix hexadecimal} {{/tb_SYS_TOP/DUT/U0_ALU/ALU_OUT[10]} -radix hexadecimal} {{/tb_SYS_TOP/DUT/U0_ALU/ALU_OUT[9]} -radix hexadecimal} {{/tb_SYS_TOP/DUT/U0_ALU/ALU_OUT[8]} -radix hexadecimal} {{/tb_SYS_TOP/DUT/U0_ALU/ALU_OUT[7]} -radix hexadecimal} {{/tb_SYS_TOP/DUT/U0_ALU/ALU_OUT[6]} -radix hexadecimal} {{/tb_SYS_TOP/DUT/U0_ALU/ALU_OUT[5]} -radix hexadecimal} {{/tb_SYS_TOP/DUT/U0_ALU/ALU_OUT[4]} -radix hexadecimal} {{/tb_SYS_TOP/DUT/U0_ALU/ALU_OUT[3]} -radix hexadecimal} {{/tb_SYS_TOP/DUT/U0_ALU/ALU_OUT[2]} -radix hexadecimal} {{/tb_SYS_TOP/DUT/U0_ALU/ALU_OUT[1]} -radix hexadecimal} {{/tb_SYS_TOP/DUT/U0_ALU/ALU_OUT[0]} -radix hexadecimal}} -subitemconfig {{/tb_SYS_TOP/DUT/U0_ALU/ALU_OUT[15]} {-color {Steel Blue} -radix hexadecimal} {/tb_SYS_TOP/DUT/U0_ALU/ALU_OUT[14]} {-color {Steel Blue} -radix hexadecimal} {/tb_SYS_TOP/DUT/U0_ALU/ALU_OUT[13]} {-color {Steel Blue} -radix hexadecimal} {/tb_SYS_TOP/DUT/U0_ALU/ALU_OUT[12]} {-color {Steel Blue} -radix hexadecimal} {/tb_SYS_TOP/DUT/U0_ALU/ALU_OUT[11]} {-color {Steel Blue} -radix hexadecimal} {/tb_SYS_TOP/DUT/U0_ALU/ALU_OUT[10]} {-color {Steel Blue} -radix hexadecimal} {/tb_SYS_TOP/DUT/U0_ALU/ALU_OUT[9]} {-color {Steel Blue} -radix hexadecimal} {/tb_SYS_TOP/DUT/U0_ALU/ALU_OUT[8]} {-color {Steel Blue} -radix hexadecimal} {/tb_SYS_TOP/DUT/U0_ALU/ALU_OUT[7]} {-color {Steel Blue} -radix hexadecimal} {/tb_SYS_TOP/DUT/U0_ALU/ALU_OUT[6]} {-color {Steel Blue} -radix hexadecimal} {/tb_SYS_TOP/DUT/U0_ALU/ALU_OUT[5]} {-color {Steel Blue} -radix hexadecimal} {/tb_SYS_TOP/DUT/U0_ALU/ALU_OUT[4]} {-color {Steel Blue} -radix hexadecimal} {/tb_SYS_TOP/DUT/U0_ALU/ALU_OUT[3]} {-color {Steel Blue} -radix hexadecimal} {/tb_SYS_TOP/DUT/U0_ALU/ALU_OUT[2]} {-color {Steel Blue} -radix hexadecimal} {/tb_SYS_TOP/DUT/U0_ALU/ALU_OUT[1]} {-color {Steel Blue} -radix hexadecimal} {/tb_SYS_TOP/DUT/U0_ALU/ALU_OUT[0]} {-color {Steel Blue} -radix hexadecimal}} /tb_SYS_TOP/DUT/U0_ALU/ALU_OUT
add wave -noupdate -expand -group {ALU signals} -color {Steel Blue} -radix binary /tb_SYS_TOP/DUT/ALU_OUT_VLD
add wave -noupdate -expand -group {DIV signals} -color {Orange Red} -radix unsigned /tb_SYS_TOP/DUT/DIV_RATIO
add wave -noupdate -expand -group {DIV signals} -color {Orange Red} -radix unsigned /tb_SYS_TOP/DUT/DIV_RATIO_RX
add wave -noupdate -expand -group {DIV signals} -color {Orange Red} -radix binary /tb_SYS_TOP/DUT/CLKDIV_EN
add wave -noupdate -expand -group {RF signals} -color Magenta -radix hexadecimal /tb_SYS_TOP/DUT/RF_WrEn
add wave -noupdate -expand -group {RF signals} -color Magenta -radix hexadecimal /tb_SYS_TOP/DUT/RF_RdEn
add wave -noupdate -expand -group {RF signals} -color Magenta -radix hexadecimal /tb_SYS_TOP/DUT/RF_Address
add wave -noupdate -expand -group {RF signals} -color Magenta -radix hexadecimal /tb_SYS_TOP/DUT/RF_WrData
add wave -noupdate -expand -group {RF signals} -color Magenta -radix hexadecimal /tb_SYS_TOP/DUT/RF_RdData
add wave -noupdate -expand -group {RF signals} -color Magenta -radix hexadecimal /tb_SYS_TOP/DUT/RF_RdData_VLD
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {559773160 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 165
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {555436672 ps} {591271296 ps}
