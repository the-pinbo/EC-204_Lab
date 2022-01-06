`timescale 1ps/1ps
`include "magComp.v"

module magComp_tb;
  reg [15:0]  In1, In2; //The two 16-bit Inputs In1 and In2 
  wire  Gt, Lt, Eq; //The Outputs of comparison 
  magComp uut(In1, In2, Gt, Lt, Eq);
  initial begin
    $dumpfile("magComp_tb.vcd");
    $dumpvars(0,magComp_tb);
    In1 = 16'd10; In2 = 16'd11; #20;
    In1 = 16'd11; In2 = 16'd11; #20;
    In1 = 16'd11; In2 = 16'd10; #20;
    In1 = 16'd0; In2 = 16'd11; #20;
  end
endmodule