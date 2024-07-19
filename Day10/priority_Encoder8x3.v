
module Pr_Encoder8x3(

    input [7:0]a,
    input en,
    output reg [2:0]y
);

always @(*) begin
    if(en==0) begin
     y=0;
    end 
    case(1)
        a[7]:y=3'b111;
        a[6]:y=3'b110;
        a[5]:y=3'b101;
        a[4]:y=3'b100;
        a[3]:y=3'b011;
        a[2]:y=3'b010;
        a[1]:y=3'b001;
        a[0]:y=3'b000;
     default:y=0;
   endcase
end

endmodule