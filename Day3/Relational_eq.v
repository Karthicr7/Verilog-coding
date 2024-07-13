
module Relational_eq();

   reg[3:0]a;
   reg[3:0]b;


   initial begin
   a=4'b1001;
   #2
   b=a<<2;
   $display("\t a=%4b  b=%4b",a,b);
#2
   if(a>=12) begin // checks whether the a is eaual to 12 or greater than
   b=a>>2;         // if true right shift 2 times
   $display("\n\t a=%4b  b=%4b",a,b);
    end else begin
#2
    $display("\n\t a=%4b b=%4b",a,b); 
   end
#2
   a=4'b0011;
   if(a==3) begin
   a=a>>2;      // if true right shift e times
   $display("\n\ta=%4b",a);
   end else begin
#2
   $display("\n\ta=%4b",a);
   end
   end
endmodule