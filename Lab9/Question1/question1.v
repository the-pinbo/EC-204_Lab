module twos_com(input xin,clk,reset_n,output yout);
  parameter S0=3'b000,S1=3'b001,S2=3'b011,S3=3'b010,S4=3'b110,S5=3'b111;
  reg[2:0] M1_present,M1_next,M2_present,M2_next;
  reg y1out,y2out;
  assign yout=y2out;
  always@(posedge clk or negedge reset_n)
  begin
    if(reset_n==0)
    begin M1_present<=S0;M2_present<=S4;end
    else
    begin M1_present<=M1_next;M2_present<=M2_next;end
  end
  always@(M1_present)
  begin
    M1_next=M1_present;y1out=1'b0;
    case(M1_present)
    S0:M1_next=S1;
    S1:M1_next=S2;
    S2:M1_next=S3;
    S3:begin M1_next=S0;y1out=1'b1;end
    default: M1_next=S0;
    endcase
  end
  always@(*)
  begin
    M2_next=M2_present;y2out=1'b0;
    case(M2_present)
    S4:
    begin
      y2out=xin;
      if((xin==1'b1)&&(y1out==1'b0))M2_next=S5;else M2_next=S4;
    end
    S5:
    begin
      y2out=~xin;
      if(y1out==1'b1)M2_next=S4;else M2_next=S5;
    end
    endcase
  end
endmodule