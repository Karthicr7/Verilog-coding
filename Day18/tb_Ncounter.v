
module tb_Ncounter();

    parameter N=4;
    
     reg clk=0;
     reg reset_n; 
     wire [N-1:0]counter;


N_bit_counter

#(.N(N)) C1

(
 .clk(clk),
 .reset_n(reset_n),
 .counter(counter)
);

always begin
  #1 clk=~clk;
end

initial begin
   $monitor(" clk=%d  reset_n=%d   counter=%b",clk,reset_n,counter);
  
   reset_n=0;
   #2 reset_n=1;
   #40 $stop;
end
endmodule
