module alu ( A, B, Cin, S, O, Cout);
  input [3:0] A,B;
  input Cin;
  input [1:0]S;
  reg [4:0] Y;
  output reg [3:0] O;
  output reg Cout;
  always @(A,B,Cin,S) begin
    // case for the given selector variable
    case(S)
    // addn
      0 : Y = A + B + Cin; 
      // sub
      1 : Y = A - B - Cin; 
      // bitwise and
      2 : Y = A & B; 
      // bitwise or 
      3 : Y = A | B; 
    endcase
    // assigining output to Cout and O
    {Cout, O} = Y;
  end
endmodule