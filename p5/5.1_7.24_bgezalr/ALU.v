`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:16:24 12/23/2019 
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
//////////////////////////////////////////////////////////////////////////////////
module ALU(
    input [31:0] alu1,
    input [31:0] alu2,
    input [3:0] ALUop,
    output [31:0] aluout
    );
    
assign aluout = (ALUop === 0)?alu1 & alu2:
					(ALUop === 1)?alu1 | alu2:
					(ALUop === 2)?alu1 + alu2:alu1 - alu2;

endmodule
