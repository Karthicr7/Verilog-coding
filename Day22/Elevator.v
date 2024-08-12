
module Elevator(

     input clk,
     input reset_n,
     input on,
     input in,
     input [3:0] target_floor,  // Input for selecting the target floor (0-15)
     output reg idle,
     output reg move_up,
     output reg move_down,
     output reg opend,
     output reg closed,
     output reg [3:0]state_out,
     output reg [3:0]floor_out

);

parameter [3:0] 
                IDLE=4'b0000, 
                MOVE_UP=4'b0001,
                MOVE_DOWN=4'b1000,
                OPEND=4'b0010,
                CLOSED=4'b0100; 
reg [3:0]timer_1;
reg timer;
reg [3:0]state;
reg [3:0]nxt_state;
reg [3:0]current_floor;
always @(*) begin
   nxt_state=state;
   idle=0;
   move_up=0;
   move_down=0;
   closed=0;
   opend=0;
   timer=0;
   case(state)
         IDLE  : begin
                    if (on) begin
                idle = 1;
                if (target_floor > current_floor) begin
                    nxt_state = MOVE_UP;
                end else if (target_floor < current_floor) begin
                    nxt_state = MOVE_DOWN;
                end else begin
                    nxt_state = OPEND; // Already at the target floor
                end
            end
        end
         MOVE_UP : begin move_up=1;
                    timer=1;
                 
                  if (current_floor < target_floor) begin
                    if(timer_1==5) begin
                         nxt_state=OPEND;
                         timer=0;
                       
                    end else begin
			  nxt_state = MOVE_UP;
			end
                 end
                 else begin
                nxt_state = OPEND; // Reached the target floor
            end
               end
          
         OPEND: begin 
                    opend=1;
                    timer=1;
                    if(timer_1==3) begin
                         nxt_state=CLOSED;
                         timer=0;
                    end else begin
			  nxt_state = OPEND;
			end
                 end
          CLOSED: begin 
                    closed=1;
                    
                    if(in==1) begin
                           nxt_state=MOVE_UP;
             
                       end else if(in==0 && state!=IDLE)
                           nxt_state=MOVE_DOWN;
                       else begin
                            nxt_state=IDLE;
                       end
                end
         
          MOVE_DOWN : begin  
                    move_down=1;
                    timer=1;
                   if (current_floor > target_floor) begin
                   
                    if(timer_1==4) begin
                         nxt_state=OPEND;
                         timer=0;
                       
                    end else begin
			  nxt_state =MOVE_DOWN;
                end
                end else begin
                nxt_state = OPEND; // Reached the target floor
            end
             end
       						
      default: nxt_state = IDLE; // best practice
endcase


		// Return from any state to OFF if enable == 0
		if (!on) begin
		    nxt_state = IDLE;
		end
end

always @(posedge clk or negedge reset_n) begin

        if(!reset_n) begin
             state<=IDLE;
             current_floor <= 4'd0;
       end else
           state<=nxt_state;
end
assign state_out = state;
always @(posedge clk or negedge reset_n) begin
	    if(!reset_n)
		    timer_1 <= 4'd0;
	    else if ((timer == 0) || (!on))
		    timer_1 <= 4'd0;
	    else if (state != 4'b0000)  // increment timer if state != OFF
		    timer_1 <= timer_1 + 1'b1; 
	end

always @(posedge clk or negedge reset_n) begin
    if (!reset_n)
        current_floor <= 4'd0;  // Initialize to ground floor (0)
    else if (state == MOVE_UP && current_floor < target_floor && timer_1 == 5) begin
        current_floor <= current_floor + 1'b1;  // Increment floor when moving up
    end else if (state == MOVE_DOWN && current_floor > target_floor && timer_1 == 4) begin
        current_floor <= current_floor - 1'b1;  // Decrement floor when moving down
    end
end

assign floor_out = current_floor;  // Output the current floor

	
endmodule