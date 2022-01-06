module multiplexer (
  x1,
  x2,
  s,
  f
);
  // Structural model of a multiplexer
  input x1,x2,s;
  output f;
  wire NOTs,x1_NOTs, s_x2;
  not(NOTs,s);
  and(x1_NOTs,x1,NOTs);
  and(s_x2,x2,s);
  or(f,s_x2,x1_NOTs);

endmodule
