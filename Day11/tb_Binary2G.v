module tb_Binary2G();

    reg [3:0]A;
    wire [3:0]Y;

Binary2G B1(
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
