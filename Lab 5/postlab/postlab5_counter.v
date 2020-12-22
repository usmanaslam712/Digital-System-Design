`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:49:41 12/12/2020 
// Design Name: 
// Module Name:    postlab5_counter 
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
module postlab5_counter #(parameter n=8, parameter N=256)(Count,sclk,up_down,En,rst,clk,num);
output reg sclk;
output reg [n-1:0] Count;
input up_down,En,rst,clk; //up_down is Up Down, En is Enable, rst is reset and clk is clock
input [7:0] num;

always @ (posedge clk or posedge rst)
begin //begin always
if(rst==1'b1) //if rst is 1 then all our values will be reset //rst if 
begin
if (up_down==1'b0) //if up_down pin is set to 0 then the counter or Count value will be set to 0 as per ascending 
begin
Count=0; 
end
else
begin
Count=N; //Otherwise the counter or Count value will be set to N as per descending
end
sclk=0; //sclk will be normally set to 0
end //ending rst if

else // rst else
begin // rst else begin
	if (En==1'b1) //if the Enable pin is 1 then ascending or descending can take place //Enable if
	begin
	
	if (up_down==1'b0) //If up_down bit is set to zero then begin counting in ascending order
		begin
		Count=Count+1; //counting in ascending order
				if(Count==num) //Once counting reaches its limit counting will be reset
			begin
			Count=0; //counter will be reset
			sclk=~sclk; //slow clock will be inverted
			end
			
				else
			begin
			Count=Count; //otherwise counting will continue
			sclk=sclk;  //slow clock will remain in its state
			end
		end
	else
		begin
		Count=Count-1; //counting in descending
			if(Count==0) //once decending is complete
			begin
			Count=num; //Count will be set to max value
			sclk=~sclk; //slow clock will be inverted
			end
			else
			begin
			Count=Count; //otherwise counting will continue
			sclk=sclk; //slow clock will remain in it's state
			end
				end
		end
		else //if Enable pin is 0 // Enable else
	begin
	Count=Count; // Count will remain the same
	sclk=sclk; // slow clock will remain in its present state
	end
end// rst else 
end //end always
endmodule