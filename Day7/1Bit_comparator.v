
module Bit1_com(

 input a,
 input b,
 output eq,
 output Ag,
 output Bg
);

wire nota;
wire notb;


not not1(nota,a);
not not2(notb,b);
and AND1(Ag,a,notb);
xnor XNOR1(eq,a,b);
and AND2(Bg,nota,b);

endmodule