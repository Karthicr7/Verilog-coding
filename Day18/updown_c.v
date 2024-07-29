
module updown_c
  
      #(parameter N=1)
  
      ( input clk,
        input reset_n,
        input m,
        output reg [N-1:0] counter
);

always @(posedge clk or negedge reset_n) begin

    if(!reset_n)
          counter<=0;
   else
      if(m==1)
      counter<=counter+1'b1;
      else
       counter<=counter-1'b1;
end

endmodule