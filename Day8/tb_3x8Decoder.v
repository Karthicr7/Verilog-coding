
module tb_Dec();

   reg [2:0]a;
   reg en;
   wire [7:0]y;

integer i;

Three_8De D1(
  .a(a),
  .en(en),
  .y(y)
);


initial begin
   $monitor($time,"a=%b  ; y=%b  ; en=%d",a,y,en);
   #1 a=0; en=0;
   for(i=0;i<8;i=i+1) begin
     #1 a=i ; en=1;
   end
end

endmodule
   