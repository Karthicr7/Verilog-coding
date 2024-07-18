
module Three_8De(

   input [2:0]a,
   input en,
   output reg [7:0]y
);


always @(*) begin
   if(en==0)begin
     y=7'b0;
   end else begin
     y=(1<<a);
   end
end

endmodule
   