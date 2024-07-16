
module tb_half();
   
  reg a,b;
  wire diff,borrow;

Half_sub HS1(
  .a(a),
  .b(b),
  .diff(diff),
  .borrow(borrow)
);


initial begin
  $monitor(" a=%0d  b=%0d  diff=%0d  borrow=%0d ",a,b,diff,borrow);
  end

initial begin
 #1;a=0;b=0;
 #1;a=0;b=1;
 #1;a=1;b=0;
 #1;a=1;b=1;
end

endmodule