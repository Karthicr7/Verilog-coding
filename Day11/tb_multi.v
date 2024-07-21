
module tb_multi();
  
  reg [1:0]A;
  reg [1:0]B;
  wire [3:0]P;

multix2 M1(
  .A(A),
  .B(B),
  .P(P)
);

initial begin
  $monitor("A=%b   B=%b   P=%b  ",A,B,P);
  
  #1;A=2'b11;B=2'b01;
  #1;A=2'b11;B=2'b11;
  #1;A=2'b10;B=2'b01;
  #1;A=2'b00;B=2'b11;
 end

endmodule