module DICE3 (
	input wire clk_main,
	input wire enter,
	input wire reset,
	output reg [3:0] sum_out,//debug
	output reg win, /* synthesis keep */
	output reg lose, /* synthesis keep */
	output [6:0] HEX0,
	output [6:0] HEX1
	
);
	reg roll; /* synthesis keep */
	reg sp; /* synthesis keep */ //point reg enable
	wire [3:0] sum;//debug
	wire seven_out;
	wire natural;
	wire craps;
	wire eq;
	reg clk_main_en = 0; /* synthesis keep */ //this is not a clock enable
	//initialize state register
	reg [1:0] state = 0; /* synthesis keep */
	
	//declare parameters to use as "states"
	parameter start_st = 0, win_st = 1, lose_st = 2, the_point_st = 3;

	//initiate all componenets here
	Datapath Datapath1(
		.clock(clk_main),
		.roll(roll),
		.reset(reset),
		.sp(sp),
		.HEX0(HEX0),
		.HEX1(HEX1),
		.seven_out(seven_out),
		.natural(natural),
		.craps(craps),
		.eq(eq), //debug
		.sum_out(sum)//debug
		
	);
	
	//create process to handle state transition
	always @ (posedge clk_main or posedge reset or posedge enter)
	begin
	
		if (reset) begin
         state <= start_st;
         lose <= 0;
			win <= 0;
			clk_main_en <= 0;
			//sp <= 0;
		end else begin
			sum_out<=sum;//debug
			//lose <= 1;
			//dice_sums <= {seven_out, natural, craps};
			case(state)
				start_st: begin
					if (enter) begin
						sp <=1;
						lose <= 1;
						clk_main_en <= 1;
					end
					if (clk_main_en) begin
						case ({natural, craps})
							2'b01: begin //craps = 1
								state <= lose_st;
							end
							2'b10: begin //natural = 1
								state <= win_st;
							end
							default: begin
								state <= the_point_st;
								sp <= 0;
							end
						endcase
					end
					roll <= enter;	
				end
				
				win_st: begin
					win <= 1;
					//state <= start_st; // to display state?
				end
				
				lose_st: begin
					lose <= 1;
					//state <= start_st;//to display state?
				end
				
				the_point_st: begin
					if (clk_main_en) begin
						case ({eq, seven_out})
							2'b01: begin //seven_out = 1
								state <= lose_st;
							end
							2'b10: begin //eq = 1
								state <= win_st;
							end
							default: begin
								//state <= the_point_st;
								//sp <= 0;
							end
						endcase
					end
					roll <= enter;
				end
				
				default: state <= start_st;
			endcase
		end
	end
	

	 
endmodule