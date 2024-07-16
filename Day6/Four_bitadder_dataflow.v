
module Four_bitadder(

   input [3:0]a,
   input [3:0]b,
   input cin,
   output [3:0]s,
   output cout
);

wire c[2:0];

assign s[0]=a[0]^b[0]^cin;
assign c[0]=a[0]&b[0] | b[0]&cin | a[0]&cin; 
assign s[1]=c[0]^a[1]^b[1];
assign c[1]=a[1]&b[1] | b[1]&c[0] | a[1]&c[0];
assign s[2]=c[1]^a[2]^b[2];
assign c[2]=a[2]&b[2] | b[2]&c[1] | a[2]&c[1];
assign s[3]=c[2]^a[1]^b[1];
assign cout=a[3]&b[3] | b[3]&c[2] | a[3]&c[2];

endmodule