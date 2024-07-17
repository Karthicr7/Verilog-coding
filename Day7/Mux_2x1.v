
module Mux_2x1(

   input I0,
   input I1,
   input S0,
   output Y
);

wire n1;
wire n2;
wire ns;

not NOT1(ns,S0);
and AND1(n1,I0,ns);
and AND2(n2,I1,S0);
or OR1(Y,n1,n2);

endmodule
