`timescale 1ns / 1ps 

module Disp_TB();

	reg clock;
	reg clock_en;
	reg [2:0] dice1;
	reg [2:0] dice2;
	wire [6:0] HEX0;
	wire [6:0] HEX1;
 

	// multiplier_mem instance
	Display UUT (
		 .clock(clock),
		 .clock_en(clock_en),
		 .dice1(dice1),
		 .dice2(dice2),
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
		clock_en <= 0; dice1 <= 0; dice2 <=1; clock <= 1;
		
		for (i = 0; i < 8; i = i + 1) begin
			#10
			dice1 <= dice1 + 1;
			dice2 <= dice2 + 1;
		end
		clock_en <= 1;
		for (i = 0; i < 8; i = i + 1) begin
			#10
			dice1 <= dice1 + 1;
			dice2 <= dice2 + 1;
		end
		clock_en <= 0;
		for (i = 0; i < 8; i = i + 1) begin
			#10
			dice1 <= dice1 + 1;
			dice2 <= dice2 + 1;
		end
	end

endmodule
