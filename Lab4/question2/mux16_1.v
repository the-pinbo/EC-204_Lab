module mux16_1(I,S,Y);
// input I 16 bit
  input [15:0] I;
// selector 4 bit
  input [3:0] S;
// output Y
  output reg Y;
// Bit Select operation 
  assign Y = I[S];
endmodule