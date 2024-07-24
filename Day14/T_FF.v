module T_ff_sync_rstn(
	input reset_n,
    input clk,
    input T,
	output reg q,
    output q_not
    );
	
	

	// reset_n is synchronous with the clk signal
	// Use non-blocking operator for sequential logic
	always @(posedge clk) begin
	    if (!reset_n)
		    q <= 1'b0;
	    else
		    case(T)
                       1'b0:q<=q;
                       1'b1:q<=~q;
              endcase
	end
	
	assign q_not = ~q;
	
endmodule

