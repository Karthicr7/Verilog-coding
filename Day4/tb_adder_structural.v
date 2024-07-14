
module test_adder();

   reg a;
   reg b;
   wire sum;
   wire carry;

AdderHalf Add1(
  .a(a),
  .b(b),
  .sum(sum),
  .carry(carry)
);

 initial begin
 $monitor("a=%d  b=%d sum=%d carry=%d",a,b,sum,carry);
end

 initial begin
 #1;a=0;b=0;
 #1;a=0;b=1;
 #1;a=1;b=0;
 #1;a=1;b=1;
 #1;a=0;b=0;
 end
endmodule