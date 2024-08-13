onerror {resume}
quietly WaveActivateNextPane {} 0

# Signals from the DUT (Design Under Test)

add wave -noupdate -label clock /Num1To6_TB/UUT/clock
add wave -noupdate -label clock_en /Num1To6_TB/UUT/clock_en
add wave -noupdate -radix unsigned -label value /Num1To6_TB/UUT/value
add wave -noupdate -radix unsigned -label num /Num1To6_TB/UUT/num

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
