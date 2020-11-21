`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:18:46 11/18/2020
// Design Name:   BM
// Module Name:   C:/Users/click/Desktop/Xilinx work/postlab1/booth_multiplier/tb_BM.v
// Project Name:  booth_multiplier
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_BM;

	// Inputs
	reg [3:0] Md;
	reg [3:0] Mr;
	reg clk;
	reg rst;

	// Outputs
	wire [7:0] P;

	// Instantiate the Unit Under Test (UUT)
	BM uut (
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

		// Wait 100 ns for global reset to finish
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

