`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:27:52 11/19/2020 
// Design Name: 
// Module Name:    BCD_2 
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
module BCD_2 (Thousands, Hundreds, Tens, Ones, Count);
input [11:0] Count;
output reg [3:0] Thousands;
output reg [3:0] Hundreds;
output reg [3:0] Tens;
output reg [3:0] Ones;

integer i;

always @ (Count)
begin
//tens hundreds and units will be initially placed as zero
Thousands = 4'd0;
Hundreds = 4'd0;
Tens = 4'd0;
Ones = 4'd0;
for (i=7; i>=0; i=i-1)
 begin 
//Check for all columns (H,T,U) for >=5
   if (Thousands >= 5) 
	    Thousands = Thousands + 3;
   if (Hundreds >= 5) 
	    Hundreds = Hundreds + 3;
	  if (Tens >= 5)
	    Tens = Tens + 3;
	   if (Ones >= 5)
		  Ones = Ones + 3;
		//Shift all binary digits left 1
	 Thousands = Thousands << 1;
	 Thousands[0] = Hundreds[3];
	 Hundreds = Hundreds <<1;
	 Hundreds[0] = Tens[3];
	 Tens = Tens << 1;
	 Tens[0] = Ones[3];
	 Ones = Ones << 1;
	 Ones[0] = Count[i];
 end
end

endmodule
