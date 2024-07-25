`timescale 1us/1ns
module tb_D_FF_Asyn();

     reg clk=0; 
     reg reset_n;
     reg d;
     wire q;
     wire q_not;
integer i;

always begin
   #2.5 clk=~clk;
end

D_FF_Asyn  DFF1(

   .clk(clk), 
   .reset_n(reset_n),
   .d(d),
   .q(q),
   .q_not(q_not)
);

initial begin
    reset_n=0;d=0;
   for(i=0;i<3;i=i+1) begin
     #5 d=~d;
  end
   reset_n=1;d=0;
   for(i=0;i<8;i=i+1) begin
     #5 d=~d;
     if(i==5)
       reset_n=0;
  end
   reset_n=1;d=0;
   for(i=0;i<5;i=i+1) begin
     #5 d=~d;
        if(i==3)
           reset_n=0;
  end
end

initial begin
  #90 $stop;

end
endmodule

