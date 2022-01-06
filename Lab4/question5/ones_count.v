module ones_count(A, ones);
    input [31:0] A;
    output reg [5:0] ones;
    integer i;
    always@(A)
      begin
          ones = 0;  //initialize count variable.
          for(i=0;i<32;i=i+1)   //for all the bits.
              ones = ones + A[i]; //Add the bit to the count.
      end
endmodule
