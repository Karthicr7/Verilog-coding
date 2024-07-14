
module Adder_testhalf();
 
   reg a;
   reg b;
   wire sum;
   wire carry;

Adder_beh half1(
   
   .a(a),
   .b(b),
   .sum(sum),
   .carry(carry)
);

  initial begin  
  $monitor("a=%b,b=%b sum=%b,carry=%b",a,b,sum,carry);
  end

  initial begin
  #1;a=0;b=0;
  #1;a=0;b=1;
  #1;a=1;b=0;
  #1;a=1;b=1;
  #1;a=0;b=0;
  end
endmodule
