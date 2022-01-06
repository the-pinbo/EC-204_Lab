module moduleName (a, b, c, d, y);
  // Verilog code that implements this majority function
  input a,b,c,d;
  output y;
  wire aPb;
  or(aPb, a, b);
  wire aPc;
  or(aPc, a, c);
  wire aPd;
  or(aPd, a, d);
  wire bPc;
  or(bPc, b, c);
  wire bPd;
  or(bPd, b, d);
  wire cPd;
  or(cPd, c, d);
  and(y, aPb, aPc, aPd, bPc, bPd, cPd);
endmodule