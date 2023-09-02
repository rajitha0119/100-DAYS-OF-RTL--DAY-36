`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.09.2023 09:39:48
// Design Name: 
// Module Name: moore_nonoverlapping
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//detect sequence 1011
module moore_nonoverlapping(
    input clk,
    input rst,
    input x,
    output  z
    );
    parameter A=3'b000;
    parameter B=3'b001;
    parameter C=3'b010;
   parameter D=3'b011;
   parameter E=3'b100;
   
   reg [2:0]pst,nst;
   always@(posedge clk)
   begin
   if(!rst)
   begin
   pst<=A;
   end
   else
   pst<=nst;
   end
   
   always@(pst or x)
   begin
   case(pst)
   A:
   begin
   if(x)
   nst<=B;
   else
   nst<=A;
   end
   B:begin
   if(x)
   nst<=B;
   else
   nst<=C;
   end
   C:begin
   if(x)
   nst<=D;
   else
   nst<=A;
   end
   D:begin
   if(x)
   nst<=E;
   else
   nst<=A;
   end
   E:begin
   if(x)
   nst<=A;
   else
   nst<=A;
   end
   endcase
   end
  assign z =(pst==E)?1:0; 
   
      
endmodule
