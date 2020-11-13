`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:53:37 11/13/2020 
// Design Name: 
// Module Name:    rca_4bit 
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
// 4 bit ripple carry adder created to further design 16 bit ripple carry adder
module rca_4bit(Cout,S,A,B,Cin);
output Cout;
output [3:0] S;
input Cin;
input [3:0] A;
input [3:0] B; 

//wires for carry
wire n0,n1,n2;

fa v1(n0,S[0],A[0],B[0],Cin); //calling a full adder verilog module that has been pre built
fa v2(n1,S[1],A[1],B[1],n0);
fa v3(n2,S[2],A[2],B[2],n1);
fa v4 (Cout,S[3],A[3],B[3],n2);
endmodule
