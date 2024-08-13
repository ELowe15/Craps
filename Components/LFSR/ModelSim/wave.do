onerror {resume}
quietly WaveActivateNextPane {} 0

# Signals from the DUT (Design Under Test)

add wave -noupdate -label clock /LFSR_TB/UUT/clock
add wave -noupdate -label clock_en /LFSR_TB/UUT/clock_en
add wave -noupdate -label reset /LFSR_TB/UUT/reset
add wave -noupdate -radix unsigned -label seed /LFSR_TB/UUT/seed
add wave -noupdate -radix unsigned -label num_out /LFSR_TB/UUT/num_out
add wave -noupdate -radix unsigned -label num /LFSR_TB/UUT/num

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
