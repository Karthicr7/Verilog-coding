
module Mux4_x2(
  input i0,
  input i1,
  input i2,
  input i3,
  input s0,
  input s1,
  output y
);
wire n1;
wire n2;
Mux_2x1 M1(
  .I0(i0),
  .I1(i1),
  .S0(s1),
  .Y(n1)
);

Mux_2x1 M2(
  .I0(i2),
  .I1(i3),
  .S0(s1),
  .Y(n2)
);

Mux_2x1 M3(
  .I0(n1),
  .I1(n2),
  .S0(s0),
  .Y(y)
);

endmodule
