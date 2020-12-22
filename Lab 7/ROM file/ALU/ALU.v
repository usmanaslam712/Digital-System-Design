`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:06:50 11/17/2020 
// Design Name: 
// Module Name:    ALU 
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
module ALU(out, S, AddA, AddB, clk, rst);
input [2:0] AddA; //address for ROM 1
input [2:0] AddB; //Address for ROM 2
input clk,rst;
input [1:0] S; //Values for switch 
output reg [2:0] out;

wire A,B; //defining wires

ROM n1 (clk,AddA,A);
ROM n2 (clk,AddB,B);

always @ (posedge clk or posedge rst)
 begin if (rst==1'b1)
    begin
     out=0;
    end
 else	
   begin case (S)
    2'b00: out=A+B;
	 2'b01: out=A+B;
	 2'b11: out=A*B;
	 2'b10: out=A^B;
	 default: out=0;
	endcase	
 end
end 
endmodule
