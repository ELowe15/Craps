onerror {resume}
quietly WaveActivateNextPane {} 0

# Signals from the DUT (Design Under Test)

add wave -noupdate -label clock /Disp_TB/UUT/clock
add wave -noupdate -label clock_en /Disp_TB/UUT/clock_en
add wave -noupdate -label dice1 /Disp_TB/UUT/dice1
add wave -noupdate -label dice2 /Disp_TB/UUT/dice2
add wave -noupdate -label HEX0 /Disp_TB/UUT/HEX0
add wave -noupdate -label HEX1 /Disp_TB/UUT/HEX1

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {80000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 77
configure wave -valuecolwidth 49
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {0 ps} {100 ns}
