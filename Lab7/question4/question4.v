module universalShiftReg(din,S,clk,Q, reset, lsi, rsi,P);
	input [3:0]din;
	input [3:0]P;
	input [1:0]S;
	input reset, clk, lsi, rsi;
	output reg [3:0]Q;
	assign Q = din;
	wire [3:0]din;
	always@(posedge clk, negedge reset)
		if (!reset)
			Q <= 4'b0000;
		else
			begin
				Q <= din;
				case (S)
					// no change
					2'b00:
						begin
							Q[3] <= Q[3];
							Q[2] <= Q[2];
							Q[1] <= Q[1];
							Q[0] <= Q[0];
						end
					// shift right
					2'b01:
						begin		
							Q[3] <= rsi;
							Q[2] <= Q[3];
							Q[1] <= Q[2];
							Q[0] <= Q[1];
						end
					// shift left
					2'b10:
						begin						
							Q[0] <= lsi;
							Q[1] <= Q[0];
							Q[2] <= Q[1];
							Q[3] <= Q[2];
						end
					// load
					2'b11:
						begin			
							Q[3] <= P[3];
							Q[2] <= P[2];
							Q[1] <= P[1];
							Q[0] <= P[0];
						end
				endcase
			end
endmodule