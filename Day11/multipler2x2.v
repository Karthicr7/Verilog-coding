
module multix2(
   
    input [1:0]A,
    input [1:0]B,
    output [3:0]P
);

wire c1;
wire c2;
wire c3;
wire c4;

assign P[0]=A[0]&B[0];
assign c1=A[1]&B[0];
assign c2=A[0]&B[1];
assign c4=A[1]&B[1];

Half_Adderda HF1( 
  .a(c1),
  .b(c2),
  .sum(P[1]),
  .carry(c3)
);

Half_Adderda HF2( 
  .a(c4),
  .b(c3),
  .sum(P[2]),
  .carry(P[3])
);

endmodule