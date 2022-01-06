module decimalUpDown (count_up, load, reset, counter_on, data_in_0,data_in_1, clk, count_0, count_1, TC);
 `include "decadeUpDown.v"
  input count_up, load, reset, counter_on;
  input [3:0]data_in_0;
  input [3:0]data_in_1;
  input clk;
  output reg [3:0]count_0;
  output reg [3:0]count_1;
  wire TC0,TC1;
  reg counter_on_1 = 0;
  output reg TC;
  decadeUpDown counter0(count_up, load, reset, counter_on, data_in_0,clk, count_0, TC0);
  decadeUpDown counter1(count_up, load, reset, TC0, data_in_1,clk, count_1, TC1);
endmodule