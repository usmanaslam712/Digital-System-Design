`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:56:47 11/21/2020
// Design Name:   BM_8bit
// Module Name:   C:/Users/click/Desktop/Xilinx work/lab 4/post lab/8 bit BM/booth_multiplier_8bit/tb_BM_8bit.v
// Project Name:  booth_multiplier_8bit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BM_8bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_BM_8bit;

	// Inputs
	reg [7:0] Md;
	reg [7:0] Mr;
	reg clk;
	reg rst;

	// Outputs
	wire [15:0] P;

	// Instantiate the Unit Under Test (UUT)
	BM_8bit uut (
		.P(P), 
		.Md(Md), 
		.Mr(Mr), 
		.clk(clk), 
		.rst(rst)
	);

	initial begin
		// Initialize Inputs
		Md = 0;
		Mr = 0;
		clk = 0;
		rst = 0;

		// Wait 10 ns for global reset to finish
		#10;
		Md = 2;
		Mr = 3;
		rst = 1;
		
		#10;
		rst = 0;
        
		// Add stimulus here

	end
      always #5 clk=~clk;
endmodule

