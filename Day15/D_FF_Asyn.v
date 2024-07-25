
module D_FF_Asyn(

   input clk, 
   input reset_n,
   input d,
   output reg q,
   output q_not
);


always @(posedge clk or negedge reset_n) begin
     if(!reset_n)
         q<=0;
     else
        q<=d;
end

assign q_not=~q;

endmodule