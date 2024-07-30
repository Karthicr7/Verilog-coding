
module Ram_my_code_1(

    input clk,
    input wr_in,
    input [7:0]data_in,
    input [3:0]address,
    output reg [7:0]data_out
);


reg [7:0] ram [0:15];

always @(posedge clk ) begin
         if (wr_in) begin
		    ram[address] <= data_in;
	    end
	end


assign data_out=ram[address];

endmodule