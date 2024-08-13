module Num1To6 (
	input clock,
	input clock_en,
	input [7:0] value,
	output [3:0] num
	);
	
	wire [3:0] num_min_1;
	parameter six = 6;
	
	Div Div_inst(
		.clken(clock_en),
		.clock(clock),
		.denom(six),
		.numer(value),
		.remain(num_min_1)
		);
	 
	 assign num = num_min_1 + 1;
endmodule
