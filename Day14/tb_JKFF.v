`timescale 1us/1ns
module tb_JK_dff();
	
	// Testbench variables
    
	reg clk = 0;
	reg reset_n;
        reg J;
        reg K;
        wire q;
    wire q_not;
	reg [1:0] delay;
    integer i;
	
	// Instantiate the DUT
	JK_ff_sync JKFF(
	    .reset_n(reset_n),
	    .clk    (clk    ),
        .J      (J      ),
	 .K(K),
          .q      (q      ),
        .q_not  (q_not  )
	);
	
	// Create the clk signal
	always begin
	    #2.5 clk = ~clk;
	end
	
    // Create stimulus	  
    initial begin
       $monitor("clk=%d     reset_n=%d          J=%d   K=%d   Q=%d   Qn=%d",clk,reset_n,J,K,q,q_not);
        reset_n = 0;
         //delay= $urandom_range(1,3); 
	#(5);J=0;K=0;
        
	#(5);J=1;K=0;
         reset_n=1;
       
	#(1);J=0;K=0;
        
	#(2);J=0;K=1;
          
       
	#(5);J=1;K=0;
        reset_n=0;
        #(5);J=0;K=0;
     
         
	#(3);J=1;K=0;
         reset_n=1;
       
	#(5);J=1;K=1;
         #(5);J=1;K=0;
      
        #(5);J=0;K=0;
     
   end
    // This will stop the simulator when the time expires
    initial begin
        #40 $finish;
    end  
endmodule
