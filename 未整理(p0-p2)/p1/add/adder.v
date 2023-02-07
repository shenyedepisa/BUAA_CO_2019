`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:55:21 10/30/2019 
// Design Name: 
// Module Name:    adder 
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
module adder(
    input [3:0] A,
    input [3:0] B,
    input Clk,
    input En,
    output reg[3:0] Sum = 0,
    output reg Overflow = 0
    );
always @(posedge Clk)
if(En)
	begin
		{Overflow,Sum} <= A+B;
	end

endmodule
