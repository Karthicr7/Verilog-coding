
module Reduction();
  
   reg[5:0] x=6'b10_0111;
   reg[7:0] y=8'b0100_0101;
   
   reg z;
 
  initial begin
  $monitor("\t x=%b   y=%b   z=%d",x,y,z);
  end

  initial begin
  z=|x;
  #1
  z=|y;
  #1
  z=~|x;
  #1
  z=~&x;
  #2
  z=&y; 
  end
endmodule