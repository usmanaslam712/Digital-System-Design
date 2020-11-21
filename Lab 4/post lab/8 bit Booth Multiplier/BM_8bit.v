`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:30:27 11/21/2020 
// Design Name: 
// Module Name:    BM_8bit 
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
module BM_8bit(P,Md,Mr,clk,rst);

output reg [15:0] P;
input [7:0]Md;
input [7:0]Mr;
input clk,rst;

reg [3:0]Count;
reg [16:0]temp;
reg [7:0]A;

always @ (posedge clk or posedge rst)
begin //begin always
   if (rst)
	    begin //begin if
         A=8'b00000000;
			Count=4'b1000;
         temp={A,Mr,1'b0};
        end //end if
	else
	    begin //begin else
		  if (Count>0)
		   begin
         case (temp[1:0])
          //begin //begin case
           2'b01:
             begin //begin 1
             A = temp[16:9] + Md;
				 temp = {A[7],A,temp[8:1]};
				 Count=Count-1;
				 end //end 1
			   2'b10:
				  begin //begin 2
				  A = temp[16:9] - Md;
				  temp = {A[7],A,temp[8:1]};
				  Count=Count-1;
				  end //end 2
				default:
				   begin //begin default
					A=temp[16:9];
					temp = {A[7],A,temp[8:1]};
				   Count=Count-1;
			      end //end default
		      endcase //end case
			  end
			  else
			   begin
	           P = temp[16:1];
				end
          end //end else
end //end always			 
endmodule
