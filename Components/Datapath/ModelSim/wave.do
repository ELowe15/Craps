onerror {resume}
quietly WaveActivateNextPane {} 0

# Signals from the DUT (Design Under Test)

add wave -noupdate -label clock /Datapath_TB/UUT/clock
add wave -noupdate -label roll /Datapath_TB/UUT/roll
add wave -noupdate -radix unsigned -label dice1 /Datapath_TB/UUT/dice1
add wave -noupdate -radix unsigned -label dice2 /Datapath_TB/UUT/dice2
add wave -noupdate -radix unsigned -label sum /Datapath_TB/UUT/sum
add wave -noupdate -label sp /Datapath_TB/UUT/sp
add wave -noupdate -radix unsigned -label point_reg /Datapath_TB/UUT/point_reg
add wave -noupdate -label HEX1 /Datapath_TB/UUT/HEX1
add wave -noupdate -label HEX0 /Datapath_TB/UUT/HEX0

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
WaveRestoreZoom {0 ps} {300 ns}




