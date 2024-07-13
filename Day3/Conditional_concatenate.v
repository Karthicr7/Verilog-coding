
module Conditional_con();


    reg[4:0]a;
    reg[4:0]b;
    reg[9:0] c;

    initial begin
    a=5'b10001;
    c=(a==17)?1:0;
                   //it checks whether the value of a==17 and assigns the value of C = 1/0
    $display("\t a=%5b  b=%5b c=%b",a,b,c);
                   //it checks whether the value of a>12 and USing replication operator 
    c=(a>10)?{2{a[4:0]}}:0;
    $display("\n\t c=%b",c);
#2
   b=5'b00000;
   if(!b) begin
         // If b equal zero then c is concatenated by a & b
   c={b[4:0],a[4:0]};
   $display("\n\t b=%b  c=%b",b,c);
    end else begin
    $display("It fails ");
     end
     end
endmodule
