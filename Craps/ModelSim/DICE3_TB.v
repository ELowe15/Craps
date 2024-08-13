`timescale 1ns / 1ps 

module DICE3_TB();
	reg clk_main;
	reg enter;
	reg reset;

	wire win;
	wire lose;
	wire [3:0] sum_out;

	// multiplier_mem instance
	DICE3 UUT (
		 .clk_main(clk_main),
		 .enter(enter),
		 .reset(reset),
		 .win(win),
		 .lose(lose),
		 .sum_out(sum_out)
	);

	// Clock generation for writing
	always begin
		 #5 clk_main <= ~clk_main;

	end
	
	always begin
		 #10 enter <= ~enter;
	end
	
	always begin
		 
		 #250 reset <=~reset;
	end
	
	// Test stimulus
	//integer i;
	initial begin
		//Initialize inputs
		enter <= 1; clk_main <= 0; reset <= 0;
		
		
/* 		#10 enter <= 1; 
		#10  enter <= 0; eq <= 1; craps <= 1; natural <= 0; seven_out <= 0; */

	end

endmodule
