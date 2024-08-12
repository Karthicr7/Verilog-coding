

`timescale 1us/1ns
module tb_Traffic123();

     reg clk=0;
     reg reset_n;
     reg on;
     wire red;
     wire yellow;
     wire green;
    wire [2:0]state_out;

Traffic T1(

.clk(clk),
.reset_n(reset_n),
.on(on),
.red(red),
.yellow(yellow),
.green(green),
.state_out(state_out)
);
parameter [2:0] OFF    = 3'b000,
	                RED    = 3'b001,
					YELLOW = 3'b010,
					GREEN  = 3'b100;


always begin
  #1 clk=~clk;
end

  initial begin
	    $monitor($time, " on = %b, red = %b, yellow = %b, green = %b", 
		                on, red, yellow, green);
		
	    reset_n = 0; #2.5; reset_n = 1;   // reset sequence
		on = 0;
	    repeat(10) @(posedge clk);  // wait some time
		on = 1;
         
		// Let the semaphore cycle 2 times
	    repeat(2) begin 
		    wait (state_out === GREEN);
			@(state_out); // wait for GREEN to be over
	    end
		
	    // Disable the semaphore during Yellow state
	    wait (state_out === YELLOW);
        @(posedge clk); on = 0;
		
		// Enable the semaphore again
	    repeat(10) @(posedge clk); 
        @(posedge clk); on = 1; 

	    #40 $stop;
	end   
    


endmodule