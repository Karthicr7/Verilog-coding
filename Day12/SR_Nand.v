module SR_Nand(

    input S,
    input R,
    output Q,
    output Qn
);

assign Q=~(S & Qn);
assign Qn=~(R & Q);

endmodule
