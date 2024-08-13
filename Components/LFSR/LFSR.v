module LFSR(
	input clock,
	input clock_en,
	input reset,
	input [7:0] seed,
	output reg [7:0] num_out
	);
	
	reg [7:0] num;
	wire [7:0] seed_reg;
	assign seed_reg = seed;
	
	always @(posedge clock, posedge reset) begin
		if (reset == 1) begin
			num <= seed; //
			num_out <= seed;
		end
		else if (reset == 0) begin
			if (clock_en) begin
				num_out <= num;
			end
			else begin 
				// LFSR feedback logic
				num[7:1] <= num[6:0];
				num[0]   <= num[7] ^ num[5] ^num[4] ^ num[3];
			end
		end
    end
	 
endmodule