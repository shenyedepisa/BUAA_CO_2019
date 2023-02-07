`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:17:58 10/30/2019 
// Design Name: 
// Module Name:    ext 
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
module ext(
	input [15:0] imm,
	input [1:0] EOp,
	output reg[31:0] ext
    );
	always @(*)
		begin
		if(EOp === 0)
			begin
				ext = {{16{imm[15]}},imm};
			end
		else if(EOp === 1)
			begin
				ext = {{16{1'b0}},imm};
			end
		else if(EOp === 2)
			begin
				ext = {imm,{16{1'b0}}};
			end
		else if(EOp === 3)
			begin
				ext = {{16{imm[15]}},imm};
				ext = ext << 2;
			end
	end
endmodule
