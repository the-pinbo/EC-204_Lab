module zero_count_beg(A, zeros);
    input [0:7] A;
    output reg [3:0] zeros;
    integer i;
    always@(A)
      begin
          zeros = 0;  //initialize count variable.
          for(i=0; i<8 && A[i] == 1'b0; i=i+1)   //for all the bits.
          begin
            zeros = zeros + 1; 
          end
      end
endmodule
