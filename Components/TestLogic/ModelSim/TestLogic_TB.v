`timescale 1ns / 1ps 

module TestLogic_TB();

	reg clock;
	reg clock_en;
	reg [3:0] num;
	wire D7;
	wire D711;
	wire D2312;
 

	// multiplier_mem instance
	TestLogic UUT (
		 .clock(clock),
		 .clock_en(clock_en),
		 .num(num),
		 .D7(D7),
		 .D711(D711),
		 .D2312(D2312)
	);

	// Clock generation for writing
	always begin
		 #5 clock <= ~clock;
	end

	
	// Test stimulus
	integer i;
	initial begin
		//Initialize inputs
		clock_en <= 1; num<= 2; clock <= 1;
		
		for (i = 2; i < 12; i = i + 1) begin
			#10
			num <= num + 1;
		end
		
	end

endmodule
