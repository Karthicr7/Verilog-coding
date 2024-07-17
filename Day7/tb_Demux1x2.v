module tb_Demux1x2();
  reg s0;
  reg x;
  wire y0;
  wire y1;

Demux_1x2 DM1(
  .s0(s0),
  .x(x),
  .y0(y0),
  .y1(y1)
);

initial begin
	   #1; $display("Verilog is cool");
       #1; s0 = 1;  x = 1;
       #1; s0 = 0;  x = 0;
       #1; s0 = 1;  x = 1;
       #1; s0 = 0;  x = 1;
       #1; s0 = 1;  x = 1;
       #1; s0 = 0;  x = 0;
	 
	end

endmodule


