
module Demux_1x2(
    input s0,
    input x,
    output y0,
    output y1
);


wire not_s0;

not NOT1(not_s0,s0);
and AND1(y0,not_s0,x);
and AND2(y1,s0,x);

endmodule
