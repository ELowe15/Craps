module Controller (

	input wire clk_main,
	input wire enter,
	input wire reset,
	output reg roll,
	output reg sp, //point reg enable
	output reg win,
	output reg lose,
	//testing datapath
	input wire seven_out,
	input wire natural,
	input wire craps,
	input wire eq
	);

//	wire craps;//2312
//	wire natural;//7/11
//	wire equal;//e1
//	wire sevening_out;//d7
//	reg c;//2312
//	reg n;//7/11
//	reg e;//e1
//	reg so;//d7
	//reg [2:0] dice_sums; 
	
	reg clk_main_en = 0;
	//initialize state register
	reg [1:0] state = 0; /* synthesis keep */
	
	//declare parameters to use as "states"
	parameter start_st = 0, win_st = 1, lose_st = 2, the_point_st = 3;

	//initiate all componenets here

	//Datapath Datapath_inst1(clk_main, roll, reset, sp );
	
	
	//create process to handle state transition
	always @ (posedge clk_main or posedge reset)
	begin
		if (reset) begin
         state <= start_st;
         lose <= 0;
			win <= 0;
			clk_main_en <= 0;
			//sp <= 0;
		end else begin
			//lose <= 1;
			//dice_sums <= {seven_out, natural, craps};
			case(state)
				start_st: begin
					if (enter) begin
						sp <=1;
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

