`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:54:34 10/30/2019 
// Design Name: 
// Module Name:    alu 
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
module alu(
    input [31:0] A,
    input [31:0] B,
    input [2:0] ALUOp,
    output reg signed[31:0] C
    );
	 initial
		C = 32'h00000000;
	 always @(*)
		 begin
			if(ALUOp === 3'b000)
				C = $unsigned(A)+$unsigned(B);
			else if(ALUOp === 3'b001)
				C = $unsigned(A)-$unsigned(B);
			else if(ALUOp === 3'b010)
				C = A&B;
			else if(ALUOp === 3'b011)
				C = A|B;
			else if(ALUOp === 3'b100)
				C = $unsigned(A)>>$unsigned(B);
			else if (ALUOp === 3'b101)
				C = $signed(A)>>>$unsigned(B);
		end
endmodule
