module tb_full();
   
  reg a,b,c;
  wire diff,borrow;

full_sub FS1(
  .a(a),
  .b(b),
  .c(c),
  .diff(diff),
  .borrow(borrow)
);


initial begin
  $monitor(" a=%0d  b=%0d  c=%0d diff=%0d  borrow=%0d ",a,b,c,diff,borrow);
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
end

endmodule