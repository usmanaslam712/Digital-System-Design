`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:53:07 11/13/2020 
// Design Name: 
// Module Name:    rca_16bit 
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
module rca_16bit(Cout,S,A,B,Cin);
output Cout;
output [15:0] S;
input [15:0] A;
input [15:0] B;
input Cin;

//wires for carry
wire n0,n1,n2;

rca_4bit z1 (n0,S[3:0],A[3:0],B[3:0],Cin);
rca_4bit z2 (n1,S[7:4],A[7:4],B[7:4],n0);
rca_4bit z3 (n2,S[11:8],A[11:8],B[11:8],n1);
rca_4bit z4 (Cout,S[15:12],A[15:12],B[15:12],n2);
endmodule
