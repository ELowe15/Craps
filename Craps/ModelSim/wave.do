onerror {resume}
quietly WaveActivateNextPane {} 0

# Signals from the DUT (Design Under Test)

add wave -noupdate -label clk_main /DICE3_TB/UUT/clk_main
add wave -noupdate -label reset /DICE3_TB/UUT/reset

add wave -noupdate -divider action

add wave -noupdate -label enter /DICE3_TB/UUT/enter
add wave -noupdate -unsigned -label sum_out /DICE3_TB/UUT/sum_out
add wave -noupdate -binary -label roll /DICE3_TB/UUT/roll

add wave -noupdate -divider win

add wave -noupdate -binary -label win /DICE3_TB/UUT/win
add wave -noupdate -label natural /DICE3_TB/UUT/natural

add wave -noupdate -divider lose

add wave -noupdate -binary -label lose /DICE3_TB/UUT/lose
add wave -noupdate -label seven_out /DICE3_TB/UUT/seven_out
add wave -noupdate -label craps /DICE3_TB/UUT/craps

add wave -noupdate -divider state_00_start_01_win_10_lose_11_the_pt

add wave -noupdate -label sp /DICE3_TB/UUT/sp
add wave -noupdate -label eq /DICE3_TB/UUT/eq
add wave -noupdate -label state /DICE3_TB/UUT/state
add wave -noupdate -label clk_main_en /DICE3_TB/UUT/clk_main_en

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




