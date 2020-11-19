`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:44:41 11/18/2020 
// Design Name: 
// Module Name:    bcd 
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
module bcd (Hundreds, Tens, Ones, Binary);
input [7:0] Binary;
output reg [3:0] Hundreds;
output reg [3:0] Tens;
output reg [3:0] Ones;

integer i;

always @ (Binary)
begin
//tens hundreds and units will be initially placed as zero
Hundreds = 4'd0;
Tens = 4'd0;
Ones = 4'd0;
for (i=7; i>=0; i=i-1)
 begin 
//Check for all columns (H,T,U) for >=5
   if (Hundreds >= 5) 
	    Hundreds = Hundreds + 3;
	  if (Tens >= 5)
	    Tens = Tens + 3;
	   if (Ones >= 5)
		  Ones = Ones + 3;
		//Shift all binary digits left 1
	 Hundreds = Hundreds <<1;
	 Hundreds[0] = Tens[3];
	 Tens = Tens << 1;
	 Tens[0] = Ones[3];
	 Ones = Ones << 1;
	 Ones[0] = Binary[i];
 end
end

endmodule
