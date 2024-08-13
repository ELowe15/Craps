`timescale 1ns / 1ps 

module Controller_TB();
	reg clk_main;
	reg enter;
	reg reset;
	wire roll;
	wire sp;
	wire win;
	wire lose;
	reg seven_out;
	reg natural;
	reg craps;
	reg eq;
	

	// multiplier_mem instance
	Controller UUT (
		 .clk_main(clk_main),
		 .enter(enter),
		 .reset(reset),
		 .roll(roll),
		 .sp(sp),
		 .win(win),
		 .lose(lose),
		 .seven_out(seven_out),
		 .natural(natural),
		 .craps(craps),
		 .eq(eq)
		
	);

	// Clock generation for writing
	always begin
		 #5 clk_main <= ~clk_main;
	end

	
	// Test stimulus
	integer i;
	initial begin
		//Initialize inputs
		enter <= 1; clk_main <= 0; reset <= 0; eq <= 0; seven_out <= 0; natural <= 0; craps <= 0;
		#10 enter <= 1; 
		#10  enter <= 0; eq <= 1; craps <= 1; natural <= 0; seven_out <= 0;
		#30 reset <= 1;
		#10 reset <= 0;
		#50 enter <= 1;
		#10 enter <= 0; eq <= 0; craps <= 0; natural <= 1; seven_out <= 0;
		#50 enter <= 1;
		#10 enter <= 0; eq <= 1; craps <= 0; natural <= 0; seven_out <= 0;
		#30 reset <= 1;
		#10 reset <= 0;
		#10 enter <= 1; 
		#10 enter <= 0; eq <= 0; craps <= 0; natural <= 0; seven_out <= 0;
		#10 enter <= 1; 
		#10  enter <= 0; eq <= 0; craps <= 1; natural <= 0; seven_out <= 0;
		#10 enter <= 1; 
		#10  enter <= 0; eq <= 1; craps <= 0; natural <= 0; seven_out <= 0;
		#30 reset <= 1;
		#10 reset <= 0;
		#10 enter <= 1; 
		#10  enter <= 0; eq <= 0; craps <= 0; natural <= 0; seven_out <= 0;
		#10 enter <= 1; 
		#10  enter <= 0; eq <= 0; craps <= 0; natural <= 0; seven_out <= 1;
		#20 reset <= 1;
		#10 reset <= 0;
		#10 enter <= 1; 
		#10  enter <= 0; eq <= 0; craps <= 1; natural <= 0; seven_out <= 0;
		#10 enter <= 1; 
		#10  enter <= 0; eq <= 0; craps <= 0; natural <= 0; seven_out <= 0;
	end

endmodule
