
module tb_Nand();
 
   reg S;
   reg R;
   wire Q;
   wire Qn;

SR_Nand SR1(

   .S(S),
   .R(R),
   .Q(Q),
   .Qn(Qn)
);

initial begin 
  $monitor($time,"S=%d  R=%d  Q=%d  Qn=%d ",S,R,Q,Qn);

  #1;S=0;R=0;
  #1;S=0;R=1;
  #1;S=1;R=0;
  #1;S=0;R=1;
  #1;S=1;R=1;
end

endmodule