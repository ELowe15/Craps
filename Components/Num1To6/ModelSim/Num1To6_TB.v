`timescale 1ns / 1ps 

module Num1To6_TB();

	reg clock;
	reg clock_en;
	reg [7:0] value;
	wire [2:0] num;
 

	// multiplier_mem instance
	Num1To6 UUT (
		 .clock(clock),
		 .clock_en(clock_en),
		 .value(value),
		 .num(num)
	);

	// Clock generation for writing
	always begin
		 #5 clock <= ~clock;
	end
	
	always begin 
		#50 clock_en = ~clock_en;
		#15 clock_en = ~clock_en;
	end
	
	// Test stimulus
	integer i;
	initial begin
		//Initialize inputs
		clock_en <= 1; clock <= 0; value <= 0;
		for (i = 0; i <256; i = i + 1) begin
			#10 value <= i;
		end	
		
	end

endmodule
