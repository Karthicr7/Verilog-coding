
module Fulladder_Struct(

    input a,
    input b,
    input cin,
    output sum,
    output carry
);

wire sum1;
wire carry1;
wire carry2;

xor XOR1(sum1,a,b);
and AND1(carry1,a,b);
xor XOR2(sum,sum1,cin);
and AND2(carry2,sum1,cin);
or OR1(carry,carry1,carry2);

endmodule