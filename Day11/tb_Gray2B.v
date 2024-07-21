
module tb_Gray2B();

    reg [3:0]A;
    wire [3:0]Y;

Gray2B G1(
   .A(A),
   .Y(Y)
);


initial begin
  $monitor(" A=%b   Y=%b ",A,Y);

  #1;A=1100;
  #1;A=1001;
  #1;A=1010;
  #1;A=0101;
end

endmodule