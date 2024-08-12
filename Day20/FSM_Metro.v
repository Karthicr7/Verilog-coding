
module FSM_Metro(

    input clk,
    input reset_n,
    input validate_code,
    input [3:0]access_code,
    output reg  opendoor,
    output [1:0]state_out
);

  parameter [1:0]IDLE=2'b00,
             CHECK_CODE=2'b01,
             ACCESS_GR=2'b10;

reg [1:0]state;
reg [1:0]Nxt_state;
reg [2:0]timer;

always @(*)begin
  Nxt_state=IDLE;
  opendoor=0;
  case(state) 

        IDLE       : begin 
                          if(validate_code) 
                                      Nxt_state=CHECK_CODE;
                        end

        CHECK_CODE : begin
                          if ((access_code >= 4'd4) && (access_code <= 4'd11)) 
						Nxt_state = ACCESS_GR;
		       end

        ACCESS_GR :  begin
                          opendoor=1;
                         if(timer==4'd7)
                            Nxt_state=IDLE;
                         else
                            Nxt_state=ACCESS_GR;
                       end
        default :
                  Nxt_state=IDLE;
      
   endcase
end


always @(posedge clk or negedge reset_n) begin

     if(!reset_n) 
           state<=IDLE;
     else
         state<=Nxt_state;
end

assign state_out = state; // connect with output port
	
	// Timer logic
	always @(posedge clk or negedge reset_n) begin
	    if(!reset_n)
		    timer <= 0;
	    else if (state == ACCESS_GR)
		    timer <= timer + 1'b1; // increment timer only in this state
	    else
		    timer <= 0;
	end
	
endmodule
