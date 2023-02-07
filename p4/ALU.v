`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:13:03 11/27/2019 
// Design Name: 
// Module Name:    ALU 
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
///////////////////////////////////////////////////////////////////////////////////////////////////////
module ALU(
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALUop,
    output [31:0] result,
    output zero,
    output blez
    );
	assign result = (ALUop === 0)?A & B:
					(ALUop === 1)?A | B:
					(ALUop === 2)?A + B:A - B;
	assign zero = (A === B)?1 : 0 ;
	
	assign blez = ($signed(A)<=0)?1 : 0 ; ////////////////////////////////////////////
	
endmodule
