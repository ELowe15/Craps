module Datapath(
	input clock,
	input roll,
	input reset,
	input sp,
	output [6:0] HEX0,
	output [6:0] HEX1,
	output seven_out,
	output natural,
	output craps,
	output eq,
	output reg [3:0] sum_out//debug
	);
	
	reg [7:0] seed1 = 1;
	reg [7:0] seed2 = 37;
	wire [7:0] LSFR_count1;
	wire [7:0] LSFR_count2;
	wire [3:0] dice1;
	wire [3:0] dice2;
	wire [3:0] sum;
	
	reg [3:0] point_reg;
	
	LFSR LFSR1(
		.clock(clock),
		.clock_en(roll),
		.reset(reset),
		.seed(seed1),
		.num(LSFR_count1)
	);
	
	LFSR LFSR2(
		.clock(clock),
		.clock_en(roll),
		.reset(reset),
		.seed(seed2),
		.num(LSFR_count2)
	);
	
	Num1To6 d1(
		.clock(clock),
		.clock_en(roll),
		.value(LSFR_count1),
		.num(dice1)
	);
	
	Num1To6 d2(
		.clock(clock),
		.clock_en(roll),
		.value(LSFR_count2),
		.num(dice2)
	);
	
	Display Disp(
		.clock(clock),
		.clock_en(roll),
		.reset(reset),
		.dice1(dice1),
		.dice2(dice2),
		.HEX0(HEX0),
		.HEX1(HEX1)
	);
	
	Adder Add_inst1(
		.clken(roll),
		.clock(clock),
		.dataa(dice1),
		.datab(dice2),
		.result(sum)
	);

	always @ (posedge clock) begin
		sum_out<=sum;//debug
	end
	
	always @(posedge sp) begin
		point_reg <= sum;
		
	end
	
	Test_Logic test_logic_inst(
		.clock(clock),
		.clock_en(roll),
		.num(sum),
		.D7(seven_out),
		.D711(natural),
		.D2312(craps)
	);
	
	compare1 compare1_inst1(roll, clock,  sum, point_reg, eq);//need correct variable
	
//	always @(posedge clock) begin
//		if (reset) begin
//			comparator_en <= 0;
//		end
//		if (sp)
//			point_reg <= sum;
//			comparator_en <= 1;
//		end
//	end
		


	
endmodule 