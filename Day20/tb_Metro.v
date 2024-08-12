`timescale 1us/1ns
module tb_Metro();

        reg clk = 0;
	reg reset_n;
	reg validate_code;
	reg  [3:0] access_code;
	wire opendoor;
	wire [1:0] state_out;

    // Instantiate the module
    FSM_Metro M1(
        .clk             (clk             ),
		.reset_n           (reset_n           ),
		.validate_code   (validate_code   ),
		.access_code     (access_code     ),
		.opendoor(opendoor),
		.state_out       (state_out       )
        );
	
    always begin
		    #1 clk = ~clk;
	    end

    initial begin
	    $monitor($time, " access_code = %4b, state_out = %2b, opendoor = %b", 
		                access_code, state_out, opendoor);
		
	    reset_n = 0; #2.5; reset_n = 1;   // reset sequence
		validate_code = 0; access_code = 0;
	    @(posedge clk);               // invalid access_code
		validate_code = 1; access_code = 0;
	    @(posedge clk);               // invalid access_code
		validate_code = 1; access_code = 0;
	    @(posedge clk);               // valid access_code
		validate_code = 1; access_code = 9;
	    @(posedge clk);               // disable validate_code
		validate_code = 0; access_code = 9;
           #30; @(posedge clk);               // valid access_code
		validate_code = 1; access_code = 11;
	    @(posedge clk);               // disable validate_code
		validate_code = 0; access_code = 11;
	    #60 $stop;
	end   
    
endmodule
