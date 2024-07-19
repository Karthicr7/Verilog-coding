
module tb_Encoder8x3();

   reg [7:0]a;
   reg en;
   wire [2:0]y;

integer i;
Encoder8x3 E1(

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

end

endmodule