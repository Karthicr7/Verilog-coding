
module Nbit_comp
 
  #(parameter N=1)
  
  ( input [N-1:0]a,
    input [N-1:0]b,
    output reg eq,
    output reg ag,
    output reg bg
);


always @(a or b) begin
   eq= a==b;
   ag=a>b;
   bg=a<b;
end

endmodule 