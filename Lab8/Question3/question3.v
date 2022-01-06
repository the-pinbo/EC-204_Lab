module dispenser(w,c, x, rst, clk);
  output w,c;
  input[2:0] x;
  input clk, rst;
  reg w,c;
  reg[2:0] state;
  parameter s0=3'd0, s1=3'd1, s2=3'd2, s3=3'd3, s4= 3'd4, s5= 3'd5;
  always @(posedge clk or negedge rst)
  if(!rst) 
  begin 
   state=s0; w=0; c=0;
  end
  else 
  begin
    case (state)
    s0: if(x==3'd1) begin w<=0; c<=0; state<=s1; end
    else if(x==3'd2) begin w<=0; c<=0; state<= s2; end
    else if(x==3'd5) begin w<=1; c<=1; state<=s5; end
    else if(x==3'd0) begin w<=0; c<=0; state<=s0; end
    s1: if(x==3'd1) begin w<=0; c<=0; state<=s2; end
    else if(x==3'd2) begin w<=1; c<=0; state<= s0; end
    else if(x==3'd5) begin w<=1; c<=1; state<=s4; end
    else if(x==3'd0) begin w<=0; c<=0; state<=s1; end
    s2: if(x==3'd1) begin w<=1; c<=0; state<=s0; end
    else if(x==3'd2) begin w<=1; c<=1; state<= s0; end
    else if(x==3'd5) begin w<=1; c<=1; state<=s3; end
    else if(x==3'd0) begin w<=0; c<=0; state<=s2; end
    s3: if(x==3'd0) begin w<=0; c<=1; state<=s4; end
    s4: if(x==3'd0) begin w<=0; c<=1; state<=s5; end
    s5: if(x==3'd0) begin w<=0; c<=1; state<=s0; end
    default: state<=s0;
  endcase
  end
endmodule