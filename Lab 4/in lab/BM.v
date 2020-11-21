`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:45:14 11/18/2020 
// Design Name: 
// Module Name:    BM 
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
module BM(P,Md,Mr,clk,rst);

output reg [7:0] P;
input [3:0]Md;
input [3:0]Mr;
input clk,rst;

reg [2:0]Count;
reg [8:0]temp;
reg [3:0]A;

always @ (posedge clk or posedge rst)
begin //begin always
   if (rst)
	    begin //begin if
         A=4'b0000;
			Count=3'b100;
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
             A = temp[8:5] + Md;
				 temp = {A[3],A,temp[4:1]};
				 Count=Count-1;
				 end //end 1
			   2'b10:
				  begin //begin 2
				  A = temp[8:5] - Md;
				  temp = {A[3],A,temp[4:1]};
				  Count=Count-1;
				  end //end 2
				default:
				   begin //begin default
					A=temp[8:5];
					temp = {A[3],A,temp[4:1]};
				   Count=Count-1;
			      end //end default
		      endcase //end case
			  end
			  else
			   begin
	           P = temp[8:1];
				end
          end //end else
end //end always			 
endmodule
