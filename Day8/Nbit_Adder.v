
module Nbit_Adder

  #(parameter N=1)
 
  ( input [N-1:0]a,
    input [N-1:0]b,
    output reg [N:0]sum
);


always @(a or b) begin
  sum[N:0]=a[N-1:0] + b[N-1:0];
end

endmodule 