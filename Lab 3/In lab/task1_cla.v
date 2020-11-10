`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:10:50 11/10/2020 
// Design Name: 
// Module Name:    task1_cla 
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
module task1_cla(S, Cout, A, B, Cin);
output [3:0] S;
output Cout;
input [3:0] A;
input [3:0] B;
input Cin;

//stage wire
wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10;

//carry wires
wire n1,n2,n3;

// G and P wires
wire g0,g1,g2,g3;
wire p0,p1,p2,p3;

//For stage 0
xor a1(S[0],A[0],B[0],Cin); //S0
and a2 (g0,A[0],B[0]); //G0
or a3 (p0,A[0],B[0]); //P0
and a4 (w1,p0,Cin);
or a5 (n1,w1,g0); //C1

//For stage 1
xor b1(S[1],A[1],B[1],n1); //S1
and b2 (g1,A[1],B[1]); //G1
or b3 (p1,A[1],B[1]); //P1
and b4 (w2,p1,p0,Cin);
and b5 (w3,p1,g0);
or b6 (n2,g1,w2,w3); //C2

//For stage 2
xor c1(S[2],A[2],B[2],n2); //S2
and c2 (g2,A[2],B[2]); //G2
or c3 (p2,A[2],B[2]); //P2
and c4 (w4,p2,g1);
and c5 (w5,p2,p1,g2);
and c6 (w6,p2,p1,p0,Cin);
or c7 (n3,g2,w4,w5,w6); //C3

//For stage 3
xor d1(S[3],A[3],B[3],n3); //S3
and d2 (g3,A[3],B[3]); //G3
or d3 (p3,A[3],B[3]); //P3
and d4 (w7,p3,g2);
and d5 (w8, p3, p2, g1);
and d6 (w9, p3, p2, p1, g0);
and d7 (w10, p3, p2, p1, p0, Cin);
or d8 (Cout, g3, w7, w8, w9, w10); 
endmodule
