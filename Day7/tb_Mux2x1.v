
module tb_Mux2x1();


   reg I0;
   reg I1;
   reg S0;
   wire Y;

Mux_2x1 M2(
   .I0(I0),
   .I1(I1),
   .S0(S0), 
   .Y(Y)
);


initial begin 
  #1; $display("Verilog is cool");
       #1; I0 = 1; I1 = 0;  S0= 1;
       #1; I0 = 0; I1 = 1;  S0 = 0;
       #1; I0 = 0; I1 = 1;  S0 = 1;
       #1; I0 = 0; I1 = 0;  S0 = 1;
       #1; I0 = 1; I1 = 1;  S0 = 1;
       #1; I0 = 0; I1 = 1;  S0 = 0;

	end

endmodule
