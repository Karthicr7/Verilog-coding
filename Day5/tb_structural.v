
module tb_struct();
   
   reg a,b,cin;
   wire sum,carry;


Fulladder_Struct FA1(
  .a(a),
  .b(b),
  .cin(cin),
  .sum(sum),
  .carry(carry)
);

 initial begin
  $monitor("a=%0d  b=%0d  cin=%0d   sum=%0d  carry=%0d",a,b,cin,sum,carry);
  end


  initial begin
  #1;a=0;b=0;cin=0;
  #1;a=0;b=0;cin=1;
  #1;a=0;b=1;cin=0;
  #1;a=0;b=1;cin=1;
  #1;a=1;b=0;cin=0;
  #1;a=1;b=0;cin=1;
  #1;a=1;b=1;cin=0;
  #1;a=1;b=1;cin=1;
  #1;a=0;b=0;cin=0;
  end

endmodule