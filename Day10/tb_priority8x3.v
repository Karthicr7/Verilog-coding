module tb_prEnc();

   reg [7:0]a;
   reg en;
   wire [2:0]y;

integer i;
Pr_Encoder8x3 E1(

   .a(a),
   .en(en),
   .y(y)
);


initial begin

  $monitor("a=%b   y=%b  en=%d",a,y,en);
  #1  a=0; en=0;
  for(i=0;i<8;i=i+1) begin
   #1 a=(1<<i); en=1;
  end
   #1;a=8'b111100000;en=1;
   #1;a=4'b10111110;en=1;
   #1;a=4'b00111110;en=1;
  

end

endmodule
