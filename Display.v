
module Display (
	input clock,
	input clock_en,
	input reset,
	input [3:0] dice1,
	input [3:0] dice2,
	output reg [6:0] HEX0,
	output reg [6:0] HEX1
	);
 
   always @(posedge clock or posedge reset) begin
		if (reset == 1) begin
			HEX0 = 7'b1111111;
			HEX1 = 7'b1111111;
		end

		else if (clock_en) begin
		  case (dice1)
            1: HEX0 = 7'b1111001;
            2: HEX0 = 7'b0100100;
            3: HEX0 = 7'b0110000;
            4: HEX0 = 7'b0011001;
            5: HEX0 = 7'b0010010;
            6: HEX0 = 7'b0000010;
            default HEX0 = 7'b1111111;
        endcase
		  case (dice2)
            1: HEX1 = 7'b1111001;
            2: HEX1 = 7'b0100100;
            3: HEX1 = 7'b0110000;
            4: HEX1 = 7'b0011001;
            5: HEX1 = 7'b0010010;
            6: HEX1 = 7'b0000010;
            default HEX1 = 7'b1111111;
        endcase
		end
	end
endmodule
