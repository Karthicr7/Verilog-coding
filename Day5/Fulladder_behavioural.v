module Fulladder_data(
  
   input a,
   input b,
   input cin,
   output reg sum,
   output reg carry
);

reg sum1;
reg carry1;
reg carry2;

  always @(a or b or cin) begin
   
  sum1=a^b;
  carry1=a&b;
  carry2=sum1&cin;
  sum=sum1^cin;
  carry=carry1+carry2;
  end

endmodule
