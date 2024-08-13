onerror {resume}
quietly WaveActivateNextPane {} 0

# Signals from the DUT (Design Under Test)

add wave -noupdate -label clock /TestLogic_TB/UUT/clock
add wave -noupdate -label clock_en /TestLogic_TB/UUT/clock_en
add wave -noupdate -label num /TestLogic_TB/UUT/num
add wave -noupdate -label D7 /TestLogic_TB/UUT/D7
add wave -noupdate -label D711 /TestLogic_TB/UUT/D711
add wave -noupdate -label D2312 /TestLogic_TB/UUT/D2312

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
