module prirority(E, I, A, GS, EO);
  input E; input [7:0]I;
  output reg [2:0]A;
  output reg GS;
  output reg EO;
  always @(E, I) begin
// active low enable 
    if(E == 1)
    begin
      GS = 1;
      EO = 1;
      A = 3'd7;
    end
    else
    begin
// cases for all the inputs acc to the truth table 
      casex (I)
        8'bxxxxxxx0: begin
            A = 0;
            GS = 0;
            EO = 1;
          end
        8'bxxxxxx01: begin
            A = 3'd1;
            GS = 0;
            EO = 1;
          end
        8'bxxxxx011: begin
            A = 3'd2;
            GS = 0;
            EO = 1;
          end
          8'bxxxx0111: begin
            A = 3'd3;
            GS = 0;
            EO = 1;
          end
         8'bxxx01111: begin
            A = 3'd4;
            GS = 0;
            EO = 1;
          end
          8'bxx011111: begin
            A = 3'd5;
            GS = 0;
            EO = 1;
          end
          8'bx0111111: begin
            A = 3'd6;
            GS = 0;
            EO = 1;
          end
          8'b01111111: begin
            A = 3'd7;
            GS = 0;
            EO = 1;
          end
          8'b11111111: begin
            A = 3'd7;
            GS = 1;
            EO = 0;
          end
      endcase
    end
  end
endmodule

