module sequence(y,z, x, rst, clk);
  output y,z;
  input x;
  input clk, rst;
  reg y,z;
  reg[2:0] state;
  parameter s0=3'd0, s1=3'd1, s2=3'd2, s3=3'd3, s4= 3'd4, s5= 3'd5, s6= 3'd6, s7= 3'd7;
  always @(posedge clk or negedge rst)
  if(rst==0) begin state=s0; y=0; z=0; end
  else begin
  case (state)
  s0: if(x==0) begin y=0; z=0; state=s2; end
  else begin y=0; z=0; state=s1; end
  s1: if(x==0) begin y=0; z=0; state=s3; end
  else begin y=0;z=0; state=s1; end
  s2: if(x==0) begin y=0; z=0; state=s2; end
  else begin y=0; z=0; state=s4; end
  s3: if(x==0) begin y=0; z=0; state=s2; end
  else begin y=1; z=0; state=s4; end
  s4: if(x==0) begin y=0; z=0; state=s3; end
  else begin y=0; z=1; state=s5; end
  s5: if(x==0) begin y=0; z=0; state=s6; end
  else begin y=0; z=0; state=s5; end
  s6: if(x==0) begin y=0; z=0; state=s6; end
  else begin y=0; z=0; state=s7; end
  s7: if(x==0) begin y=0; z=0; state=s6; end
  else begin y=0; z=1; state=s5; end
  default: state=s0;
  endcase
  end
endmodule