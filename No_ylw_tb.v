`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:00:47 04/21/2022
// Design Name:   traffic
// Module Name:   C:/sig_2_no_ylw/sig_no_ylw/No_ylw_tb.v
// Project Name:  sig_no_ylw
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: traffic
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module No_ylw_tb;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [2:0] f_n;
	wire [2:0] f_s;
	wire [2:0] f_e;
	wire [2:0] f_w;
	wire [2:0] s_n;
	wire [2:0] s_s;
	wire [2:0] s_e;
	wire [2:0] s_w;

	// Instantiate the Unit Under Test (UUT)
	traffic uut (
		.f_n(f_n), 
		.f_s(f_s), 
		.f_e(f_e), 
		.f_w(f_w), 
		.s_n(s_n), 
		.s_s(s_s), 
		.s_e(s_e), 
		.s_w(s_w), 
		.clk(clk), 
		.rst(rst)
	);

	initial begin
		// Initialize Inputs
/*		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;*/
		
		clk=1'b1;
		forever #5 clk=~clk;
		end
 
		initial
		begin
		rst=1'b1;
		#15;
		rst=1'b0;
		#1000;
		$stop;
		//end
		// Wait 100 ns for global reset to finish
		//#100;
        
		// Add stimulus here

	end
      
endmodule

