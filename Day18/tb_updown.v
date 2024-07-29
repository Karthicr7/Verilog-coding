module tb_updown();

    parameter N=3;
    
     reg clk=0;
     reg reset_n; 
     reg m;
     wire [N-1:0]counter;


updown_c

#(.N(N)) C1

(
 .clk(clk),
 .reset_n(reset_n),
 .m(m),
 .counter(counter)
);

always begin
  #1 clk=~clk;
end

initial begin
   $monitor(" clk=%d  reset_n=%d  m=%d  counter=%b",clk,reset_n,m,counter);
  
   reset_n=0;
   #2;reset_n=1;m=1;
    #30;m=0;
   #60 $stop;
end
endmodule
