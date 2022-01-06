module HalfAdderdf(input a,b,output sum, carry);
 assign sum = a^b;
 assign carry = a&b;
endmodule
module FullAdder2haor(input a, b, carryin,output sum, carryout);
 wire m2b, m1co, m2co;
 HalfAdderdf m1 (.a(a),.b(b),.sum(m2b),.carry(m1co));
 HalfAdderdf m2 (.a(carryin),.b(m2b),.sum(sum),.carry(m2co));
 assign y = m1co | m2co;
endmodule