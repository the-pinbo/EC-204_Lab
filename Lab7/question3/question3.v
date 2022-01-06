module up_counter_nbit(R, Resetn, Clk, PCinc, PCload, Q);
	parameter n = 4;
	input [n-1:0] R;
	input Resetn, Clk, PCload, PCinc;
	output reg [n-1:0] Q;
	always@(negedge Resetn, posedge Clk)
		if (!Resetn)
			Q <=0;
		else if (PCload)
			Q <= R;
		else if (PCinc)
			Q <= Q + 1;
endmodule