module dec2to4(a, En, Y);
  input [1:0] a;
  input En;
  output reg [3:0] Y;
  /*
  // Can be done using multiple assign statements 
  assign Y[0] = (En & ~a[1] & ~a[0]);
  assign Y[1] = (En & ~a[1] & a[0]);
  assign Y[2] = (En & a[1] & ~a[0]);
  assign Y[3] = (En & a[1] & a[0]);
  */
  // or a short version with one assign statement 
  // When enable is one 1 is right shifted by a bits 
  assign Y = En ? (1<<a) : (4'b0000);
endmodule