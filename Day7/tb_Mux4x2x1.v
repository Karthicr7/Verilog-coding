
module tb_Mux4x2x1();
  reg i0;
  reg i1;
  reg i2;
  reg i3;
  reg s0;
  reg s1;
  wire y;

Mux4_x2 M1(

  .i0(i0),
  .i1(i1),
  .i2(i2),
  .i3(i3),
  .s0(s0),
  .s1(s1),
  .y(y)
);

initial begin
  $monitor("i0=%d i1=%d i2=%d i3=%d s0=%d s1=%d y=%0d",i0,i1,i2,i3,s0,s1,y);
end
initial begin 
  $display("WOkkaliii ");
  #1; i0=0; i1=1; i2=0; i3=1; s0=0; s1=0;
  #1; i0=1; i1=0; i2=0; i3=0; s0=0; s1=1;
  #1; i0=1; i1=0; i2=1; i3=0; s0=1; s1=0;
  #1; i0=0; i1=1; i2=0; i3=1; s0=1; s1=1;
  #1; i0=1; i1=1; i2=1; i3=0; s0=0; s1=0;
  #1; i0=0; i1=0; i2=1; i3=1; s0=0; s1=1;
  #1; i0=0; i1=1; i2=0; i3=0; s0=1; s1=0;
  #1; i0=1; i1=0; i2=1; i3=1; s0=1; s1=1;
end

endmodule