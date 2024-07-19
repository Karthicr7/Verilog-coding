
module Nbit_Dec
  #(parameter N=1)
  (
  input [N-1:0]a,
  input en,
  output reg [2**N-1:0]y
);

always @(*) begin
  if(en==0) begin
    y=0;
  end else begin
    y=(1<<a);  
  end
end

endmodule