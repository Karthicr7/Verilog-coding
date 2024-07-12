
module Bitwise();
   
   reg [3:0] x=0;
   reg [3:0] y=0;
   
   reg[3:0] z=0;
 
  initial begin
  $monitor(" \n\t x=%b  y=%b  z=%b ",x,y,z);
  end
  
  initial begin
  #1
  x=4'b0001;
  y=4'b0101;
  z=x|y;
  #1
  z=x&y;
#2
  x=4'b1010;
  y=4'b0101;
  z=x^y;
#2
 z=x~^y;
  end
endmodule
  
