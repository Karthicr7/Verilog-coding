
module Four_beh(
  input [3:0]a,
  input [3:0]b,
  input cin,
  output  [3:0]s,
  output cout
);

wire c[2:0];
Fulladder FA1(
  .a(a[0]),
  .b(b[0]),
  .cin(cin),
  .sum(s[0]),
  .carry(c[0])
);

Fulladder FA2(
  .a(a[1]),
  .b(b[1]),
  .cin(c[0]),
  .sum(s[1]),
  .carry(c[1])
);

Fulladder FA3(
  .a(a[2]),
  .b(b[2]),
  .cin(c[1]),
  .sum(s[2]),
  .carry(c[2])
);

Fulladder FA4(
  .a(a[3]),
  .b(b[3]),
  .cin(c[2]),
  .sum(s[3]),
  .carry(cout)
);

endmodule

