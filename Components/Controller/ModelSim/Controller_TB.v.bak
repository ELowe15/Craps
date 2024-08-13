`timescale 1ns / 1ps 

module Datapath_TB();
	reg clock;
	reg roll;
	reg reset;
	reg sp;
	wire [6:0] HEX0;
	wire [6:0] HEX1;

	// multiplier_mem instance
	Datapath UUT (
		 .clock(clock),
		 .roll(roll),
		 .reset(reset),
		 .sp(sp),
		 .HEX0(HEX0),
		 .HEX1(HEX1)
	);

	// Clock generation for writing
	always begin
		 #5 clock <= ~clock;
	end

	
	// Test stimulus
	integer i;
	initial begin
		//Initialize inputs
		roll <= 1; clock <= 0; reset <= 1;
		#10 reset <= 0;
		#50 sp <=1;
		#50 sp <=0;
	end

endmodule
