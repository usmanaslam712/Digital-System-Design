`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:24:55 12/17/2020 
// Design Name: 
// Module Name:    mux4x1 
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
module mux4x1(out,in1,in2,in3,in4,S);

output reg [3:0]out;
input [3:0]in1;
input [3:0]in2;
input [3:0]in3;
input [3:0]in4;
input [1:0]S;

always @(*)
begin
 case(S)
   2'b00: out=in1;
	2'b01: out=in2;
	2'b10: out=in3;
	2'b11: out=in4;
 endcase
end


endmodule
