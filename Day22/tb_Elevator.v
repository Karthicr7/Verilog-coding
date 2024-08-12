

`timescale 1us/1ns
module tb_Elevator();

     reg clk=0;
     reg reset_n;
     reg on;
     reg in;
     reg [3:0]target_floor;  // Input for selecting the target floor (0-15)
     wire idle;
     wire move_up;
     wire move_down;
     wire opend;
     wire closed;
     wire [3:0]state_out; 
     wire [3:0]floor_out;
Elevator E1(

.clk(clk),
.reset_n(reset_n),
.on(on),
.in(in),
.target_floor(target_floor),
.idle(idle),
.move_up(move_up),
.move_down(move_down),
.opend(opend),
.closed(closed),
.state_out(state_out),
.floor_out(floor_out)
);
parameter [3:0] 
                IDLE=4'b0000, 
                MOVE_UP=4'b0001,
                MOVE_DOWN=4'b0010,
                OPEND=4'b0100,
                CLOSED=4'b1000; 
always begin
  #1 clk=~clk;
end

  initial begin
	    $monitor($time, " on = %b, in=%b  move_up= %b, move_down= %b, opendoor = %b closedoor=%b target=%b", 
		                on,in,move_up,move_down, opend,closed,target_floor);
		
	    reset_n = 0; #2.5; reset_n = 1;   // reset sequence
		on = 0;
	    repeat(20) @(posedge clk);  // wait some time
		on = 1;
         
		// Let the semaphore cycle 2 times
	    @(posedge clk);
                in=1;target_floor=4;
           //  @(posedge clk) floor=4;
            #30; @(posedge clk);
                in=0;target_floor=1;
            #35;@(posedge clk);
                in=1;target_floor=5;
            #45; @(posedge clk);
                in=0; 

	    #60 $stop;
	end 
endmodule  