`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:57:54 11/25/2020 
// Design Name: 
// Module Name:    seven_segment 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module seven_segment(out,bcd_in);
output reg [6:0]out;
input [3:0]bcd_in;

always @ (*)
begin
    case (bcd_in)
	   4'b0000: out = 7'b0000001; //0
		4'b0001: out = 7'b1001111; //1
		4'b0010: out = 7'b0000010; //2
		4'b0011: out = 7'b0000110; //3
		4'b0100: out = 7'b0001100; //4
		4'b0101: out = 7'b0100100; //5
		4'b0110: out = 7'b0100000; //6
		4'b0111: out = 7'b0001111; //7
		4'b1000: out = 7'b0000000; //8
		4'b1001: out = 7'b0000100; //9
	 endcase
end
endmodule
