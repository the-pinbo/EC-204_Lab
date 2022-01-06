module twos_com_tb;
  parameter t_PERIOD =100;
  reg clk, reset_n, data, start;
  wire pout;
  integer data_file_in, data_file_out, scan_file;
  twos_com uut(data, clk, reset_n, pout);
  //clock generation
  initial
  begin
    clk =0; reset_n =0; data =0; start =0;
    #150 reset_n = 1; 
    #200 start = 1;
    data_file_in = $fopen("D:\\Documents\\NIT-K\\02_SecondYear\\EC204\\Lab9\\Question1\\input_sequence.txt","r");
    data_file_out = $fopen("D:\\Documents\\NIT-K\\02_SecondYear\\EC204\\Lab9\\Question1\\output_sequence.txt","w");
  end
  initial
  forever #(t_PERIOD/2) clk <= ~clk;
  always @(posedge clk) 
  begin
  if (start ==1)
    begin
      scan_file = $fscanf(data_file_in, "%b\n", data);
      #50
      if (!$feof(data_file_in))
        $fwrite (data_file_out, "clock=%b, data=%b, twosC=%b\n", clk, data, pout);
      else
      begin
        $fwrite (data_file_out, "clock=%b, data=%b, twosC=%b\n", clk, data, pout);
        $fclose(data_file_in);
        $fclose(data_file_out);
        $finish;
      end
    end
  end
endmodule