module JK_ff_sync(
	input reset_n,
    input clk,
    input J,
    input K,
    output reg q,
    output reg q_not
    );
	
	
	// reset_n is synchronous with the clk signal
	// Use non-blocking operator for sequential logic
	always @(posedge clk) begin
	    if (!reset_n)
		    q <= 1'b0;
	    else
		case({J,K})
                     2'b00:q <=q;
                     2'b01:q <=0;
                     2'b10:q <=1;
                     2'b11:q <=~q;
              endcase
        
               
	end
	
	assign q_not=~q;
	
endmodule
