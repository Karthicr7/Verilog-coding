
module tb_Ram1();


    reg clk=0;
    reg wr_in;
    reg [7:0]data_in;
    reg [3:0]address;
    wire [7:0]data_out;

reg [7:0]wr_data;
integer i;
integer success_count, error_count, test_count;

Ram_my_code_1 Ram1(

  
    .clk(clk),
    .wr_in(wr_in),
    .data_in(data_in),
    .address(address),
    .data_out(data_out)
);
always begin #0.5 clk = ~clk; end
	

 task write_dr(input [3:0] add_in,input [7:0] data);
     begin
         @(posedge clk) begin
              wr_in=1;
              address<=add_in;
              data_in<=data;
          end
     end
 endtask

task read_dr(input [3:0] add_in);
     begin
         @(posedge clk) begin
              wr_in=0;
              address<=add_in;
              
          end
     end
 endtask

task compare_data(input [3:0] add_in, input [7:0] expected_data, input [7:0] observed_data); 
	    begin
		    if (expected_data === observed_data) begin // use case equality opearator
				$display($time, " SUCCESS address = %0d, expected_data = %2x, observed_data = %2x", 
				                  address, expected_data, observed_data);
                success_count = success_count + 1;				
            end else begin
				$display($time, " ERROR address = %0d, expected_data = %2x, observed_data = %2x", 
				                  address, expected_data, observed_data);	
				error_count = error_count + 1;
            end
            test_count = test_count + 1;			
		end
	endtask

initial begin

  #1;success_count=0; error_count=0;test_count=0;
   #3;
   for(i=0;i<16;i=i+1) begin
    #1; wr_data=$random;
      #1;  write_dr(i,wr_data);
        read_dr(i);
      #2;  compare_data(address,data_in,data_out);
     end
    $display($time, " TEST RESULTS success_count = %0d, error_count = %0d, test_count = %0d", 
		                success_count, error_count, test_count);

  #40 $stop;
	end
endmodule
