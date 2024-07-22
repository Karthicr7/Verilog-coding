module Dlatch(

   input d,
   input en,
   output  Q,
   output Qn
);


reg latch;

always @(d or en) begin

    if(en) 
        latch<=d;
    
end

assign Q=latch;
assign Qn=~Q;

endmodule