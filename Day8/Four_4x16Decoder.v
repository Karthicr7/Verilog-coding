
module Four_Dec(

   input [3:0]a,
   output [15:0]y
);

Three_8De D1(
 .a(a[2:0]),
 .en(~a[3]),
 .y(y[7:0])
);

Three_8De D2(
 .a(a[2:0]),
 .en(a[3]),
 .y(y[15:8])
);

endmodule