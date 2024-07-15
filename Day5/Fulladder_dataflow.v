module Full_data(

   input a,
   input b,
   input cin,
   output sum,
   output carry_out
);

  wire sum1;
  wire carry1;
  wire carry2;

Half_Adderda HA1(
  .a(a),
  .b(b),
  .sum(sum1),
  .carry(carry1)
);

Half_Adderda HA2(
  .a(sum1),
  .b(cin),
  .sum(sum),
  .carry(carry2)
);

assign carry_out=carry1+carry2;

endmodule
