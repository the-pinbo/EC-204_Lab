module multiplexer(x1,x2,s,f);
  // Behavioural model of multiplexer
  input x1,x2,s;
  output f;
  reg f;
  always @(x1,x2,s) 
  begin
    if (s==0) 
      begin
        f = x1;
      end 
    else
      begin
        f = x2;
      end
  end
endmodule