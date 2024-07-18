
module tb_Nbitcomp();
  
   parameter N=10;
   reg [N-1:0]a;
   reg [N-1:0]b;
   wire eq;
   wire ag;
   wire bg;

Nbit_comp 
#(.N(N))
NBC
(
 .a(a),
 .b(b),
 .eq(eq),
 .ag(ag),
 .bg(bg)
);

initial begin 

  $monitor("a=%0d  b=%0d  eq=%d  A>B=%d  A<B=%d",a,b,eq,ag,bg);

  #1;a=1;b=3;
  #1;a=18;b=14;
  #1;a=40;b=45;
  #1;a=111;b=111;
  #1;a=57;b=34;
  end

endmodule