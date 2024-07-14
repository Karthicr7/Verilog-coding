module tb_halfadderdata();
    
    reg a;
    reg b;
    wire sum;
    wire carry;

Half_Adderda Add1(
  .a(a),
  .b(b),
  .sum(sum),
  .carry(carry)
);

  initial begin
  $monitor("a=%0d b=%0d sum=%0d carry=%0d",a,b,sum,carry);
  end

  initial begin
  #1;a=0;b=0;
  #1;a=0;b=1;
  #1;a=1;b=0;
  #1;a=1;b=1;
  #1;a=0;b=0;
  end
endmodule
