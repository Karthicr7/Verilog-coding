`timescale 1us/1ns
module tb_T_Tff_rstn();
	
	// Testbench variables
    reg T;
	reg clk = 0;
	reg reset_n;
	wire q;
    wire q_not;
	reg [1:0] delay;
    integer i;
	
	// Instantiate the DUT
	T_ff_sync_rstn DFF0(
	    .reset_n(reset_n),
	    .clk    (clk    ),
        .T      (T     ),
	    .q      (q      ),
        .q_not  (q_not  )
	);
	
	// Create the clk signal
	always begin
	    #2.5 clk = ~clk;
	end
	
    // Create stimulus	  
    initial begin
         $monitor("clk=%d     reset_n=%d       T=%d     Q=%d   Qn=%d",clk,reset_n,T,q,q_not);
        reset_n = 0;
         //delay= $urandom_range(1,3); 
	#(5);T=0;
       
	#(5);T=1;
         reset_n=1;
      
	#(5);T=0;
        
	#(5);T=0;
          reset_n=0;
   
	#(5);T=1;
      
        #(5);T=0;
     
       
	#(5);T=1;
         reset_n=1;
      
	#(5);T=1;
         #(5);T=0;
      
       end
    initial begin
        #40 $finish;
    end  
endmodule
