module SR_ff_sync(
	input reset_n,
    input clk,
    input S,
    input R,
    output reg q,
    output reg q_not
    );
	
	// reset_n is synchronous with the clk signal
	// Use non-blocking operator for sequential logic
	always @(posedge clk) begin
	    if (!reset_n)
		    q <= 1'b0;
	    else
		case({S,R})
                     2'b00:q <=q;
                     2'b01:q <=0;
                     2'b10:q <=1;
                     2'b11:q <=1'bz;
              endcase
        
               
	end
	
	assign q_not=~q;
	
endmodule
