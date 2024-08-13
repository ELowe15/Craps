module TestLogic(
	input clock,
	input clock_en,
	input [3:0] num,
	output reg D7,
	output reg D711,
	output reg D2312
	);
	
	always @(posedge clock) begin
		if (clock_en) begin
			case (num)
				2, 3, 12: begin 
					D2312 = 1; D7 = 0; D711 = 0;
				end
				7: begin
					D711 = 1; D7 = 1; D2312 = 0;
				end
				11: begin
					D711 = 1; D2312 = 0; D7 = 0;
				end
				default: begin
					D2312 = 0; D711 = 0; D7 = 0;
				end
			endcase
		end
	end
endmodule