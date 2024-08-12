
module Traffic(

     input clk,
     input reset_n,
     input on,
     output reg red,
     output reg yellow,
     output reg green,
     output reg [2:0]state_out
);

parameter [2:0] OFF=3'b000, 
                RED=3'b001,
                YELLOW=3'b010,
                GREEN=3'b100; 
reg [2:0]timer_1;
reg timer;
reg [2:0]state;
reg [2:0]nxt_state;

always @(*) begin
   nxt_state=0;
   red=0;
   yellow=0;
   green=0;
   timer=0;
   case(state)
         OFF  : begin
                     if(on) nxt_state=RED;
                end 
      
         RED  : begin
                       red=1;
                       if(timer_1==7) begin
                           nxt_state=YELLOW;
                           timer=1;
                       end else begin
                            nxt_state=RED;
                       end
                end
         YELLOW : begin 
                    yellow=1;
                    if(timer_1==5) begin
                         nxt_state=GREEN;
                         timer=1;
                    end else begin
			  nxt_state = YELLOW;
			end
                 end
          
         GREEN : begin
                    green=1;
                    if(timer_1==7) begin
                         nxt_state=RED;
                         timer=1;
                    end else begin
                        nxt_state=GREEN;
                end 
    				end 							
      default: nxt_state = OFF; // best practice
endcase
		
		// Return from any state to OFF if enable == 0
		if (!on) begin
		    nxt_state = OFF;
		end
end

always @(posedge clk or negedge reset_n) begin

        if(!reset_n)
             state<=OFF;
        else
           state<=nxt_state;
end
assign state_out = state;
always @(posedge clk or negedge reset_n) begin
	    if(!reset_n)
		    timer_1 <= 3'd0;
	    else if ((timer == 1) || (!on))
		    timer_1 <= 3'd0;
	    else if (state != OFF)  // increment timer if state != OFF
		    timer_1 <= timer_1 + 1'b1; 
	end
	
endmodule