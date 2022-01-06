module dec2to4_case (W, En, Y);
// input lines 2 bit 
  input [1:0] W;
// enable input 
  input En;
// output line 4 bit
  output reg [0:3] Y;
  always @(W, En)
    begin
      // if enable is 0 then output is alaways 0
      if (En == 0)
        Y = 4'b0000;
      else
    case (W)
    // output mapped according to the truth table 
      0: Y = 4'b1000;
      1: Y = 4'b0100;
      2: Y = 4'b0010;
      3: Y = 4'b0001;
    endcase
  end
endmodule
