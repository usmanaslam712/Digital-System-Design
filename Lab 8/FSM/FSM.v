`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:19:24 12/17/2020 
// Design Name: 
// Module Name:    FSM 
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
module FSM(out,Ct,Td,x,clk,rst);
output reg out, Ct;
input Td,clk,rst,x;
reg [1:0] state;
parameter [1:0] S0=2'b00;
parameter [1:0] S1=2'b01;
parameter [1:0] S2=2'b10;
parameter [1:0] S3=2'b11;

always @ (posedge clk or posedge rst)
begin //always begin
  if (rst==1'b1)
  begin // begin reset
    state=S0;
    out=0;
    Ct=1;
  end //end reset
  
  else
   begin //begin FSM
		 case (state)
	        S0:
			  begin //begin S0
			  if (x==1'b1)
			    begin //begin S0 if x=1
			      state=S1;
			      Ct=0;
			      out=0;
				 end //end s0 if x=1
			   else 
			     begin //begin S0 if x=0
			       state=S0;
			       Ct=1;
			       out=0;
			     end //end S0 if x=0
			   end //end S0
			 S1:
			    begin //begin S1
				  if (x==1'b1)
			       begin //begin S1 if x=1
			         if (Td==1'b1)
				       begin //begin S1 if Td=1
					      state=S2;
					      Ct=1;
					      out=1;
					    end //end S1 if Td=0
				     else
				       begin //begin S1 if x=0
					      state=S1;
					      Ct=0;
					      out=0;
				       end //end S1 if x=0
						end
			      else
				     begin
				      state=S0;
					   Ct=1;
					   out=0;
				     end
				  
				end
			 S2:
			 begin
			  if (x==1'b1)
			    begin
			     state=S2;
				  Ct=1;
				  out=1;
				 end
			  else
			    begin
				  state=S3;
				  Ct=0;
				  out=1;
				 end
			 end
			 S3:
			 begin
			  if (x==1'b1)
			   begin
				  state=S2;
				  Ct=1;
				  out=1;
				end
			  else
				 begin
				   if (Td==1'b1)
					 begin
					   state=S0;
						Ct=1;
						out=0;
					 end
					else
					 begin
					   state=S3;
						Ct=0;
						out=1;
					 end
			 end
			end 
        endcase
  
  
  end
 end
endmodule
