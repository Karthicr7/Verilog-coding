
module Mux_4x1(
  
  input i0,
  input i1,
  input i2,
  input i3,
  input s0,
  input s1,
  output y
);

wire not_s0;
wire not_s1;
wire and_n0;
wire and_n1;
wire and_n2;
wire and_n3;
wire or_y1;
wire or_y2;

not NOT1(not_s0,s0);
not NOT2(not_s1,s1);
and AND1(and_n0,not_s0,not_s1,i0);
and AND2(and_n1,not_s0,s1,i1);
and AND3(and_n2,s0,not_s1,i2);
and AND4(and_n3,s0,s1,i3);
or OR3(y,and_n0,and_n1,and_n2,and_n3);


endmodule


