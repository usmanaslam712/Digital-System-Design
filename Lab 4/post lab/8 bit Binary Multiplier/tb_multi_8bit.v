`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:01:31 11/21/2020
// Design Name:   multi_8bit
// Module Name:   C:/Users/click/Desktop/Xilinx work/lab 4/post lab/8 bit multipliter/multi_2bit/tb_multi_8bit.v
// Project Name:  multi_2bit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: multi_8bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_multi_8bit;

	// Inputs
	reg [7:0] Md;
	reg [7:0] Mr;

	// Outputs
	wire [15:0] Prod;

	// Instantiate the Unit Under Test (UUT)
	multi_8bit uut (
		.Prod(Prod), 
		.Md(Md), 
		.Mr(Mr)
	);

	initial begin
		// Initialize Inputs
		Md = 0;
		Mr = 0;

		// Wait 100 ns for global reset to finish
		#10;
      Md = 2;
		Mr = 3;
		// Add stimulus here

	end
      
endmodule

