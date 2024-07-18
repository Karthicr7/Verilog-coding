
module tb_Nbit();
 
  parameter N=10;
  reg [N-1:0]a;
  reg [N-1:0]b;
  wire [N:0]sum;

Nbit_Adder

#(.N(N))
NA1
(
 .a(a),
 .b(b),
 .sum(sum)
);

initial begin

 $monitor("a=%0b  b=%0b  sum=%0b ",a,b,sum);
 #1;a=1;b=3;
 #1;a=10;b=14;
 #1;a=78;b=45;
 #1;a=111;b=0;
end

endmodule
