
module tb_Nbit_Dec();
 
  parameter N=2;
  reg [N-1:0]a;
  reg en;
  wire [2**N-1:0]y;

integer i;

Nbit_Dec 
  #(.N(N))
ND1
(
 .a(a),
 .en(en),
 .y(y)
);

initial begin 
  $monitor("a=%b   y=%b  en=%d",a,y,en);
  #1 a=0 ; en=0;
  for(i=0;i<2**N;i=i+1) begin
   #1 a=i ; en=1;
  end
end

endmodule
