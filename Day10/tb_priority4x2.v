
module tb_prEnc();

   reg [3:0]a;
   reg en;
   wire [1:0]y;

integer i;
Pr_Encoder E1(

   .a(a),
   .en(en),
   .y(y)
);


initial begin

  $monitor("a=%b   y=%b  en=%d",a,y,en);
  #1  a=0; en=0;
  for(i=0;i<4;i=i+1) begin
   #1 a=(1<<i); en=1;
  end
   #1;a=4'b1111;en=1;
   #1;a=4'b1010;en=1;
   #1;a=4'b0010;en=1;
  

end

endmodule