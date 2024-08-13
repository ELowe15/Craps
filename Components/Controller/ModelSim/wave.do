onerror {resume}
quietly WaveActivateNextPane {} 0

# Signals from the DUT (Design Under Test)

add wave -noupdate -label clk_main /Controller_TB/UUT/clk_main
add wave -noupdate -label clk_main_en /Controller_TB/UUT/clk_main_en
add wave -noupdate -label reset /Controller_TB/UUT/reset
add wave -noupdate -label enter /Controller_TB/UUT/enter
add wave -noupdate -label roll /Controller_TB/UUT/roll
add wave -noupdate -label win /Controller_TB/UUT/win
add wave -noupdate -label lose /Controller_TB/UUT/lose
add wave -noupdate -label sp /Controller_TB/UUT/sp
add wave -noupdate -label seven_out /Controller_TB/UUT/seven_out
add wave -noupdate -label natural /Controller_TB/UUT/natural
add wave -noupdate -label craps /Controller_TB/UUT/craps
add wave -noupdate -label eq /Controller_TB/UUT/eq
add wave -noupdate -label state /Controller_TB/UUT/state

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
WaveRestoreZoom {0 ps} {450 ns}




