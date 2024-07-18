module tb_Dec16();

   reg [3:0]a;
   reg en;
   wire [15:0]y;

integer i;

Four_Dec D4(
  .a(a),
  .y(y)
);


initial begin
   $monitor($time,"a=%b  ; y=%b  ",a,y);
   #1 a=0; 
   for(i=0;i<16;i=i+1) begin
     #1 a=i ; 
   end
end

endmodule
   
