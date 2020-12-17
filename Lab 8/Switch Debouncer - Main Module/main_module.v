`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:09:58 12/17/2020 
// Design Name: 
// Module Name:    main_module 
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
module main_module(dataline,anodeline,clk,rst,x);
//FSM(out,Ct,Td,x,clk,rst);
//BCD (Thousands, Hundreds, Tens, Ones, Count);
//mux4x1(out,in1,in2,in3,in4,S);
//seven_segment(out,bcd_in);
//up_down #(Count,sclk,up_down,En,rst,clk);



output [3:0]anodeline;
output [6:0]dataline;
input clk,rst,x;


//IN ACCORDANCE TO BLOCK DIAGRAM
wire sclk3,sclk4;
wire out,Ct,Td;
wire w1; //unused wire
//wire [24:0]count1; //counter wire for counter 1 //This wire will not be used as per block diagram only sclk1 will be used
//wire [11:0]count2; //counter wire for counter 2 //This wire will forward the counting data BCD converter
wire [17:0]count3; //counter wire for counter 3 //This wire will not be used a per block diagram only sclk3 will be used
wire [1:0]count4; //counter wire for counter 4 //This wire will forward the counting data BCD converter
wire [3:0] ones,tens,hundreds,thousands; //wire values that will go into 4x1 MUX
wire [3:0] bcd_input; //wire for bcd to seven segment

//UPPER PART - FSM & COUNTER
//up_down#(25,25000000) g1 (count1,sclk1,0,1,rst,clk); //counter1 //0 ascending counting //1 enable
FSM a1(out,Ct,Td,x,clk,rst);
  up_down#(12,4096) g2 (Td,w1,0,1,Ct,out); //counter2 //0 ascending counting //Ct (clear timer) for rst //Td (timer done) for count

//LOWER PART SLOW CLOCK AND COUNTER
up_down#(18,200000) g3 (count3,sclk3,0,1,rst,clk); //counter3 //0 ascending counting //1 enable
up_down#(2,4) g4 (count4,sclk4,0,1,rst,sclk3); //counter4 //0 ascending counting //1 enable

//COUNTER 2 TO BCD CONVERSTION
BCD z1 (thousands, hundreds, tens, ones, Td); //data from counter 2 to BCD conversion

// BCD CONVERSION TO 4X1 MUX
mux4x1 z2 (bcd_input,ones,tens,hundreds,thousands,count4); //count4 will act as a select line

//BCD TO 7 SEGMENT
seven_segment z3 (dataline,bcd_input); //This will convert BCD to 7 segment hence dataline

//ANODE LINE VALUES
mux4x1 z4 (anodeline,4'b1110,4'b1101,4'b1011,4'b0111,count4); //count4 will act as a select line

endmodule
