module full_sub(
  input a,
  input b,
  input c,
  output reg diff,borrow
);

reg diff1;
reg borrow1;
reg borrow2;

always @(a or b or c) begin
   diff1=a^b;
   borrow1=~a&b;
   diff=diff1^c;
   borrow2=~borrow1&c;
   borrow=borrow1 | borrow2;
end 

endmodule
