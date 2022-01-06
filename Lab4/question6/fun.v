module fun(A,B,C,D,E,F);
  input A,B,C,D,E;
  output reg F;
  always @(A,B,C,D,E) begin
    // setting the value of F to 1 for the min terems 
      case ({A,B,C,D,E})
      0 : F = 1'b1;
      2 : F = 1'b1;  
      3 : F = 1'b1;  
      4 : F = 1'b1;  
      8 : F = 1'b1;  
      21 : F = 1'b1;  
      22 : F = 1'b1;  
      29 : F = 1'b1;  
      31 : F = 1'b1;   
      // setting the value as 0 for others 
      default: F = 0;
  endcase
  end
endmodule