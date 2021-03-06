module fullAdder2(input a,b,cin, output sum,cout);
  // Full adder using two half adders
  `include "halfAdder.v"
  wire sum1, cout1, cout2;
  halfAdder 
    h1(a, b, sum1, cout1),
    h2(cin, sum1, sum, cout2);
  assign cout = cout1|cout2;
endmodule