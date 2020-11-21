`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:09:16 11/21/2020 
// Design Name: 
// Module Name:    multi_8bit 
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
module multi_8bit(Prod,Md,Mr);
input [7:0]  Mr, Md; //Defining multiplier and multiplicand
output reg [15:0] Prod; //defining Product as an output register
integer i; //As this an 8 bit binary  multiplication hence 8 iterations

   always @( Mr or Md )
     begin
        
        Prod = 0; //Initializing Product
            
        for(i=0; i<7; i=i+1) 
          if( Mr[i] == 1'b1) //If Multipliter has 1 bit 
			 Prod = Prod + ( Md << i ); //Then take initial value of product and add it to the Multiplicand after it has been shifted i times
			 else
			 Prod = Prod; //If there is a zero in multiplier then Product value remains the same
  
     end
     
endmodule
