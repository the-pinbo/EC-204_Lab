module halfAdder(input a,b, output sum,cout);
  // Data flow model of half adder
  assign sum = a^b;
  assign cout = (a&b);
endmodule