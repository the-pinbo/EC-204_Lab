module halfAdder(input ai,bi, output sum,cout);
  // Structural model for half adder using gates
  xor(sum, ai, bi);
  and(cout, ai, bi);
endmodule