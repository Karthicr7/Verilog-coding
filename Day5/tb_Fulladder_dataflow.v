module tb_Fulldata();
  
    reg a;
    reg b;
    reg c;
    wire sum;
    wire carry;


Full_data FA1(
  .a(a),
  .b(b),
  .cin(c),
  .sum(sum),
  .carry_out(carry)
);


  initial begin
  $monitor("a=%0d  b=%0d  c=%0d   s2=%0d  c2=%0d",a,b,c,sum,carry);
  end


  initial begin
  #1;a=0;b=0;c=0;
  #1;a=0;b=0;c=1;
  #1;a=0;b=1;c=0;
  #1;a=0;b=1;c=1;
  #1;a=1;b=0;c=0;
  #1;a=1;b=0;c=1;
  #1;a=1;b=1;c=0;
  #1;a=1;b=1;c=1;
  #1;a=0;b=0;c=0;
  end

endmodule
