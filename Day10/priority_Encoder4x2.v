
module Pr_Encoder(

    input [3:0]a,
    input en,
    output reg [1:0]y
);

always @(*) begin
    if(en==0) begin
     y=0;
    end 
    case(1)
        a[3]:y=2'b11;
        a[2]:y=2'b10;
        a[1]:y=2'b01;
        a[0]:y=2'b00;
     default:y=0;
   endcase
end

endmodule
