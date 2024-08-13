`timescale 1ns / 1ps 

module LFSR_TB();

	reg clock;
	reg clock_en;
	reg reset;
	reg [7:0] seed;
	wire [7:0] num_out;
 

	// multiplier_mem instance
	LFSR UUT (
		 .clock(clock),
		 .clock_en(clock_en),
		 .reset(reset),
		 .seed(seed),
		 .num_out(num_out)
	);

	// Clock generation for writing
	always begin
		 #5 clock <= ~clock;
	end

	
	// Test stimulus
	integer i;
	initial begin
		//Initialize inputs
		clock_en <= 0; clock <= 0; seed <= 1; reset <= 1;
		#10 clock_en <= 1; reset <= 0;
		#20 clock_en <= 0;
		#105 reset <= 1;
		#10 reset <= 0;
		#50 clock_en <= 1;
		#10 clock_en <= 0;
		#50 clock_en <= 1;
		#10 clock_en <= 0;
		#500 clock_en <= 1;
		#200;
		seed <= 2;
		reset <= 1;
		#5 reset <= 0;
		#50
		clock_en <= 0;
		#50
		clock_en <= 1;
		#1000
		seed <= 3;
		reset <= 1;
		#5 reset <= 0;
		#1000
		seed <= 4;
		reset <= 1;
		#5 reset <= 0;
		#1000
		seed <= 5;
		reset <= 1;
		#5 reset <= 0;
		#100
		seed <= 6;
		reset <= 1;
		#5 reset <= 0;
	end

endmodule
