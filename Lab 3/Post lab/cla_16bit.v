`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:35:48 11/12/2020 
// Design Name: 
// Module Name:    cla_16bit 
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
module cla_16bit(S, Cout, A, B, Cin);
output [15:0] S;
output Cout;
input [15:0] A;
input [15:0] B;
input Cin;

//stage wires
wire [119:1] w;

//carry wires
wire n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12,n13,n14;

// G and P wires
wire g0,g1,g2,g3,g4,g5,g6,g7,g8,g9,g10,g11,g12,g13,g14;
wire p0,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14;

//For stage 0
xor (S[0],A[0],B[0],Cin); //S0
and (g0,A[0],B[0]); //G0
or (p0,A[0],B[0]); //P0
and (w[1],p0,Cin);
or (n1,w[1],g0); //C1

//For stage 1 //C2
xor (S[1],A[1],B[1],n1); //S1
and (g1,A[1],B[1]); //G1
or (p1,A[1],B[1]); //P1
and (w[2],p1,p0,Cin);
and (w[3],p1,g0);
or (n2,g1,w[2],w[3]); //C2

//For stage 2 //C3
xor(S[2],A[2],B[2],n2); //S2
and (g2,A[2],B[2]); //G2
or (p2,A[2],B[2]); //P2
and (w[4],p2,g1);
and (w[5],p2,p1,g2);
and (w[6],p2,p1,p0,Cin);
or (n3,g2,w[4],w[5],w[6]); //C3

//For stage 3 //C4
xor (S[3],A[3],B[3],n3); //S3
and (g3,A[3],B[3]); //G3
or (p3,A[3],B[3]); //P3
and (w[7],p3,g2);
and (w[8], p3, p2, g1);
and (w[9], p3, p2, p1, g0);
and (w[10], p3, p2, p1, p0, Cin);
or (n4, g3, w[7], w[8], w[9], w[10]); //C4

//For stage 4 //C5
xor (S[4],A[4],B[4],n4); //S4
and (g4,A[4],B[4]); //G4
or (p4,A[4],B[4]); //P4
and (w[11],p4,g3);
and (w[12],P4,p3,g2);
and (w[13],p4,p3,p2,g1);
and (w[14],p4,p3,p2,p1,g0);
and (w[15],p4,p3,p2p,p1,p0,Cin);
or (n5,g4,w[11],w[12],w[13],w[14],w[15]); //C5

//For stage 5 //C6
xor (S[5],A[5],B[5],n5); //S5
and (g5,A[5],B[5]); //G5
or (p5,A[5],B[5]); //P5
and (w[16],p5,g4);
and (w[17],P5,p4,g3);
and (w[18],p5,p4,p3,g2);
and (w[19],p5,p4,p3,p2,g1);
and (w[20],p5,p4,p3,p2,p1,g0);
and (w[21],p5,p4,p3,p2,p1,p0,Cin);
or (n6,g5,w[16],w[17],w[18],w[19],w[20],w[21]); //C6

//For stage 6 //C7
xor (S[6],A[6],B[6],n6); //S6
and (g6,A[6],B[6]); //G6
or (p6,A[6],B[6]); //P6
and (w[22],p6,g5);
and (w[23],p6,p5,g4);
and (w[24],p6,p5,p4,g3);
and (w[25],p6,p5,p4,p3,g2);
and (w[26],p6,p5,p4,p3,p2,g1);
and (w[27],p6,p5,p4,p3,p2,p1,g0);
and (w[28],p6,p5,p4,p3,p2,p1,p0,Cin);
or (n7,g6,w[22],w[23],w[24],w[25],w[26],w[27],w[28]); //C7

//For stage 7 //C8
xor (S[7],A[7],B[7],n7); //S7
and (g7,A[7],B[7]); //G7
or (p7,A[7],B[7]); //P7
and (w[29],p7,g6);
and (w[30],p7,p6,g5);
and (w[31],p7,p6,p5,g4);
and (w[32],p7,p6,p5,p4,g3);
and (w[33],p7,p6,p5,p4,p3,g2);
and (w[34],p7,p6,p5,p4,p3,p2,g1);
and (w[35],p7,p6,p5,p4,p3,p2,p1,g0);
and (w[36],p7,p6,p5,p4,p3,p2,p1,p0,Cin);
or (n8,g7,w[29],w[30],w[31],w[32],w[33],w[34],w[35],w[36]); //C8

//For stage 8 //C9
xor (S[8],A[8],B[8],n8); //S8
and (g8,A[8],B[8]); //G8
or (p8,A[8],B[8]); //P8
and (w[37],p8,g7);
and (w[38],p8,p7,g6);
and (w[39],p8,p7,p6,g5);
and (w[40],p8,p7,p6,p5,g4);
and (w[41],p8,p7,p6,p5,p4,g3);
and (w[42],p8,p7,p6,p5,p4,p3,g2);
and (w[43],p8,p7,p6,p5,p4,p3,p2,g1);
and (w[44],p8,p7,p6,p5,p4,p3,p2,p1,g0);
and (w[45],p8,p7,p6,p5,p4,p3,g1,p0,Cin);
or (n9,g8,w[37],w[38],w[39],w[40],w[41],w[42],w[43],w[44],w[45]); //C9

//For stage 9 //C10
xor (S[9],A[9],B[9],n9); //S9
and (g9,A[9],B[9]); //G9
or (p9,A[9],B[9]); //P9
and (w[46],p9,g8);
and (w[47],p9,p8,g7);
and (w[48],p9,p8,p7,g6);
and (w[49],p9,p8,p7,p6,g5);
and (w[50],p9,p8,p7,p6,p5,g4);
and (w[51],p9,p8,p7,p6,p5,p4,g3);
and (w[52],p9,p8,p7,p6,p5,p4,p3,g2);
and (w[53],p9,p8,p7,p6,p5,p4,p3,p2,g1);
and (w[54],p9,p8,p7,p6,p5,p4,p3,p2,p1,g0);
and (w[55],p9,p8,p7,p6,p5,p4,p3,p2,p1,p0,Cin);
or (n10,g9,w[46],w[47],w[48],w[49],w[50],w[51],w[52],w[53],w[54],w[55]); //C10

//For stage 10 //C11
xor (S[10],A[10],B[10],n10); //S10
and (g10,A[10],B[10]); //G10
or (p10,A[10],B[10]); //P10
and (w[56],p10,g9);
and (w[57],p10,p9,g8);
and (w[58],p10,p9,p8,g7);
and (w[59],p10,p9,p8,p7,g6);
and (w[60],p10,p9,p8,p7,p6,g5);
and (w[61],p10,p9,p8,p7,p6,p5,g4);
and (w[62],p10,p9,p8,p7,p6,p5,p4,g3);
and (w[63],p10,p9,p8,p7,p6,p5,p4,p3,g2);
and (w[64],p10,p9,p8,p7,p6,p5,p4,p3,p2,g1);
and (w[65],p10,p9,p8,p7,p6,p5,p4,p3,p2,p1,g0);
and (w[66],p10,p9,p8,p7,p6,p5,p4,p3,p2,p1,p0,Cin);
or (n11,g10,w[56],w[57],w[58],w[59],w[60],w[61],w[62],w[63],w[64],w[65],w[66]); //C11

//For stage 11 //C12
xor (S[11],A[11],B[11],n11); //S11
and (g11,A[11],B[11]); //G11
or (p11,A[11],B[11]); //P11
and (w[67],p11,g10);
and (w[68],p11,p10,g9);
and (w[69],p11,p10,p9,g8);
and (w[70],p11,p10,p9,p8,g7);
and (w[71],p11,p10,p9,p8,p7,g6);
and (w[72],p11,p10,p9,p8,p7,p6,g5);
and (w[73],p11,p10,p9,p8,p7,p6,p5,g4);
and (w[74],p11,p10,p9,p8,p7,p6,p5,p4,g3);
and (w[75],p11,p10,p9,p8,p7,p6,p5,p4,p3,g2);
and (w[76],p11,p10,p9,p8,p7,p6,p5,p4,p3,p2,g1);
and (w[77],p11,p10,p9,p8,p7,p6,p5,p4,p3,p2,p1,g0);
and (w[78],p11,p10,p9,p8,p7,p6,p5,p4,p3,p2,p1,p0,Cin);
or (n12,g11,w[67],w[68],w[69],w[70],w[71],w[72],w[73],w[74],w[75],w[76],w[77],w[78]); //C12

//For stage 12 //C13
xor (S[12],A[12],B[12],n12); //S12
and (g12,A[12],B[12]); //G12
or (p12,A[12],B[12]); //P12
and (w[79],p12,g11);
and (w[80],p12,p11,g10);
and (w[81],p12,p11,p10,g9);
and (w[82],p12,p11,p10,p9,g8);
and (w[83],p12,p11,p10,p9,p8,g7);
and (w[84],p12,p11,p10,p9,p8,p7,g6);
and (w[85],p12,p11,p10,p9,p8,p7,p6,g5);
and (w[86],p12,p11,p10,p9,p8,p7,p6,p5,g4);
and (w[87],p12,p11,p10,p9,p8,p7,p6,p5,p4,g3);
and (w[88],p12,p11,p10,p9,p8,p7,p6,p5,p4,p3,g2);
and (w[89],p12,p11,p10,p9,p8,p7,p6,p5,p4,p3,p2,g1);
and (w[90],p12,p11,p10,p9,p8,p7,p6,p5,p4,p3,p2,p1,g0);
and (w[91],p12,p11,p10,p9,p8,p7,p6,p5,p4,p3,p2,p1,p0,Cin);
or (n13,g12,w[79],w[80],w[81],w[82],w[83],w[84],w[85],w[86],w[87],w[88],w[89],w[90],w[91]); //C13

//For stage 13 //C14
xor (S[13],A[13],B[13],n13); //S13
and (g13,A[13],B[13]); //G13
or (p13,A[13],B[13]); //P13
and (w[92],p13,g12);
and (w[93],p13,p12,g11);
and (w[94],p13,p12,p11,g10);
and (w[95],p13,p12,p11,p10,g9);
and (w[96],p13,p12,p11,p10,p9,g8);
and (w[97],p13,p12,p11,p10,p9,p8,g7);
and (w[98],p13,p12,p11,p10,p9,p8,p7,g6);
and (w[99],p13,p12,p11,p10,p9,p8,p7,p6,g5);
and (w[100],p13,p12,p11,p10,p9,p8,p7,p6,p5,g4);
and (w[101],p13,p12,p11,p10,p9,p8,p7,p6,p5,p4,g3);
and (w[102],p13,p12,p11,p10,p9,p8,p7,p6,p5,p4,p3,g2);
and (w[103],p13,p12,p11,p10,p9,p8,p7,p6,p5,p4,p3,p2,g1);
and (w[104],p13,p12,p11,p10,p9,p8,p7,p6,p5,p4,p3,p2,p1,g0);
and (w[105],p13,p12,p11,p10,p9,p8,p7,p6,p5,p4,p3,p2,p1,p0,Cin);
or (n14,g13,w[92],w[93],w[94],w[95],w[96],w[97],w[98],w[99],w[100],w[101],w[102],w[103],w[104],w[105]); //C14

//For stage 14 //C15 or Cout
xor (S[14],A[14],B[14],n14); //S14
and (g14,A[14],B[14]); //G14
or (p14,A[14],B[14]); //P14
and (w[106],p14,g13);
and (w[107],p14,p13,g12);
and (w[108],p14,p13,p12,g11);
and (w[109],p14,p13,p12,p11,g9);
and (w[110],p14,p13,p12,p11,p9,g8);
and (w[111],p14,p13,p12,p11,p9,p8,g7);
and (w[112],p14,p13,p12,p11,p9,p8,p7,g6);
and (w[113],p14,p13,p12,p11,p9,p8,p7,p6,g5);
and (w[114],p14,p13,p12,p11,p9,p8,p7,p6,p5,g4);
and (w[115],p14,p13,p12,p11,p9,p8,p7,p6,p5,p4,g3);
and (w[116],p14,p13,p12,p11,p9,p8,p7,p6,p5,p4,p3,g2);
and (w[117],p14,p13,p12,p11,p9,p8,p7,p6,p5,p4,p3,p2,g1);
and (w[118],p14,p13,p12,p11,p9,p8,p7,p6,p5,p4,p3,p2,p1,g0);
and (w[119],p14,p13,p12,p11,p9,p8,p7,p6,p5,p4,p3,p2,p1,p0,Cin);
or (Cout,g14,w[106],w[107],w[108],w[109],w[110],w[111],w[112],w[113],w[114],w[115],w[116],w[117],w[118],w[119]); //Cout

//S15 Overall Sum
xor (S[15],A[15],B[15],Cout); //S14
endmodule
