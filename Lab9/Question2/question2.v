module shift_reg(in_reg, par_load, enable, in_bit, Clk, out_reg);
    parameter n = 8;
    input [n-1:0] in_reg;
    input par_load, enable, in_bit, Clk;
    integer k;
    output reg [n-1:0] out_reg;
    always @ (posedge Clk )
    if (par_load)
    out_reg <= in_reg;
    else if (enable)
    begin
      for (k = n-1; k > 0; k = k - 1)
      out_reg[k-1] <= out_reg[k];
      out_reg[n-1] <= in_bit;
    end
  endmodule

module serial_adder(A, B, Reset, Clk, Sum);
  input [7:0] A, B;
  input Reset, Clk;
  reg sbit, cur_state, next_state;
  parameter G = 1'b0, H = 1'b1;
  output wire [7:0] Sum;
  reg [3:0] Cnt;
  wire [7:0] QA, QB;
  wire Run;
  shift_reg shift_A(A, Reset, 1'b1, 1'b0, Clk, QA);
  shift_reg shift_B(B, Reset, 1'b1, 1'b0, Clk, QB);
  shift_reg shift_sum(8'b0, Reset, Run, sbit, Clk, Sum);
  always @(QA, QB, cur_state)
    case (cur_state)
      G: 
      begin
        sbit = QA[0] ^ QB[0];
        if (QA[0] & QB[0]) next_state = H;
        else next_state = G;
      end
      H: 
      begin
        sbit = QA[0] ~^ QB[0];
        if (~QA[0] & ~QB[0]) next_state = G;
        else next_state = H;
      end
      default: 
      begin 
        sbit = 0; 
        next_state = G; 
      end
    endcase
    always @(posedge Clk)
    if (Reset) cur_state <= G;
    else cur_state <= next_state;
    always @(posedge Clk)
      if (Reset) Cnt <= 8;
      else if (Run) Cnt <= Cnt - 1;
      assign Run = |Cnt;
endmodule