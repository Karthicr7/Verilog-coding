
module shift_reg_piso(
	input clk,
	input reset_n,
	input sdi, // serial data in
	input pl,  // preload
    input [3:0] d,
	output sdo
    );
	
	// Internal 4 bits wide register
	reg [3:0] piso;
	 // nets after the mux'es
	
	// If pl == 1 uses the parallel input as data source
	
	
	// Async negative reset is used
	always @(posedge clk or negedge reset_n) begin
	    if (!reset_n)
		    piso <= 4'b0;
	    else
		    piso[3:0] <= {piso[2:0],sdi};
	end

    // Connect the sdo net to the register MSB
    assign sdo = piso[3];

endmodule
