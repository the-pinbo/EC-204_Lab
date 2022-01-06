module ring_ctr  #(parameter WIDTH=4)   
  (    
    input clk,                  
    input rst_n,  
    output reg [WIDTH-1:0] out  
  );
  integer i;     
  always @ (posedge clk) begin  
  // Self correction when the counter is at x000 where x is dont care it resets 
      if ((!rst_n) || out == 4'b0000 || out == 4'b1000)  
         out <= 1;  
      else 
      begin  
        out[WIDTH-1] <= out[0];  
        for (i = 0; i < WIDTH-1; i=i+1) 
        begin  
          out[i] <= out[i+1];  
        end  
      end  
  end  
endmodule  

