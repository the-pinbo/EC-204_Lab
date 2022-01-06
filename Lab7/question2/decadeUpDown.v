module decadeUpDown (count_up, load, reset, counter_on, data_in,clk, count, TC);
  input count_up, load, reset, counter_on;
  input [3:0]data_in;
  input clk;
  output reg [3:0]count;
  output reg TC;
  always @(posedge clk, negedge reset) begin
    if(reset == 1)
      count <= 0;
    else if(load == 1)
      count <= data_in;
    else if(counter_on == 1)
    begin
      if(count_up == 1)
        count <= count + 1;
      else
        count <= count - 1;
    end
    if(count_up == 1 && count == 9)
    begin
      TC <= 1;
      count <= 0;
    end
    else if(count_up == 0 && count == 0)
    begin
      TC <= 1;
      count <= 9;
    end
    else
      TC <= 0;
  end
endmodule