
`timescale 1us/1ns
module tb_SR_dff();
	
	// Testbench variables
    
	reg clk = 0;
	reg reset_n;
        reg S;
        reg R;
        wire q;
    wire q_not;
	reg [1:0] delay;
    integer i;
	
	// Instantiate the DUT
	SR_ff_sync SRFF(
	    .reset_n(reset_n),
	    .clk    (clk    ),
        .S      (S      ),
	 .R(R),
          .q      (q      ),
        .q_not  (q_not  )
	);
	
	// Create the clk signal
	always begin
	    #2.5 clk = ~clk;
	end
	
    // Create stimulus	  
    initial begin
       $monitor("clk=%d     reset_n=%d          S=%d   R=%d   Q=%d   Qn=%d",clk,reset_n,S,R,q,q_not);
        reset_n = 0;
         //delay= $urandom_range(1,3); 
	#(5);S=0;R=0;
       
	#(5);S=1;R=0;
         reset_n=1;
      
	#(5);S=0;R=0;
     
	#(5);S=0;R=1;
          reset_n=0;
       
	#(5);S=1;R=0;
      
        #(5);S=0;R=0;
     
 
	#(5);S=1;R=0;
         reset_n=1;
     
	#(5);S=1;R=1;
         #(5);S=1;R=0;
      
        #(5);S=0;R=0;
     
   end
    // This will stop the simulator when the time expires
    initial begin
        #40 $stop;
    end  
endmodule