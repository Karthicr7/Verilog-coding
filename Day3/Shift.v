
module Shift();

   reg[4:0]a;
   reg[4:0]b;


   initial begin
   a=5'b10110;
   #2
   b=a << 2;  // left shit of a for 2 times
   $display("\t a=%5b  b=%5b",a,b);
   #2
   b=b >> 2; // right shift of b for 2 times
   $display("\n\t a=%5b  b=%5b",a,b);
   end
endmodule