
module tb_compa();
  
   reg a;
   reg b;
   wire eq;
   wire Ag;
   wire Bg;

Bit1_com BC1(
  .a(a),
  .b(b),
  .eq(eq),
  .Ag(Ag),
  .Bg(Bg)
);

initial begin
  #1 $monitor("a=%d  b=%d EQUAL=%d A>B=%d  A<B=%d",a,b,eq,Ag,Bg);
  #1;a=0;b=0;
  #1;a=0;b=1;
  #1;a=1;b=0;
  #1;a=1;b=1;
  end

endmodule