module ring_counter(
    Clock,
    Reset,
    Count
    );
    input Clock;
    input Reset;
    output [3:0] Count;
    reg [3:0] Count_temp;
    always @(posedge(Clock),Reset)
    begin
        if(Reset == 1'b1 || Count == 4'b0000|| Count == 4'b1000)   
        begin
            Count_temp = 4'b0001;   
        end 
        else if(Clock == 1'b1)  
        begin
            Count_temp = {Count_temp[2:0],Count_temp[3]};   
        end 
    end
    assign Count = Count_temp;
endmodule