
module tb_Fourbit();

  reg [3:0]a;
  reg [3:0]b;
  reg cin;
  wire [3:0]sum;
  wire cout;

integer i,j,c=0;

Four_bitadder FBA1(

  .a(a),
  .b(b),
  .cin(cin),
  .s(sum),
  .cout(cout)
);

initial begin
  $monitor($time,"  a=%b  b=%b  cin=%0b  sum=%0d  cout=%b",a,b,cin,sum,cout);
end


initial begin

  for(i=0;i<15;i=i+1) begin
    for(j=0;j<15;j=j+1) begin
      #1 a=i; b=j; cin=~(&i | |j);
        
    end
  end

end

endmodule