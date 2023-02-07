`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:07:51 11/27/2019 
// Design Name: 
// Module Name:    controller 
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
module controller(
	input [5:0] func,
	input [5:0] op,
	input [4:0] rt,
	output  RegWrite,
	output  MemRead,
	output  MemWrite,
	output	[1:0]RegDst,
	output branch,
	output  [1:0] MemtoReg,
	output  [1:0] PCSrc,
	output 	[3:0]ALUop,
	output  shift2s,
	output  [1:0]ALUSrc,
	output istiaozhuan////////////////////////////////////////////////////////////////////////////////////
    );
    
	wire addu;
	wire subu;
	wire ori;
	wire lw;
	wire sw;
	wire lui;
	wire beq;
	wire jal;
	wire jr;
	wire nop;
	wire blez;/////////////////////////////////////////////////////////////////////////////////////////////////
	
	assign addu = (op === 6'b000000 && func === 6'b100001);
	assign subu = (op === 6'b000000 && func === 6'b100011);
	assign ori = (op === 6'b001101);
	assign lw = (op === 6'b100011);
	assign sw = (op === 6'b101011);
	assign lui = (op === 6'b001111);
	assign beq = (op === 6'b000100);
	assign jal = (op === 6'b000011);
	assign jr = (op === 6'b000000 && func === 6'b001000);
	assign nop = (op === 6'b000000 && func === 6'b000000);
	
	assign blez = (op === 6'b000110 && rt === 5'b00000);////////////////////////////
	
	assign RegWrite = addu | subu | ori | lw | lui | jal;
	assign MemRead = lw;
	assign MemWrite = sw;
	assign RegDst[1] = jal;
	assign RegDst[0] = addu | subu;
	assign branch = beq;
	assign MemtoReg[1] = jal;
	assign MemtoReg[0] = lw;
	assign PCSrc[1] = jal | jr;
	assign PCSrc[0] = beq | jr | blez;												//
	assign ALUop[3] = 0;
	assign ALUop[2] = subu | beq | blez;											//
	assign ALUop[1] = addu | subu | lw | sw | lui | beq | jal | jr | blez;				//
	assign ALUop[0] = ori;
	assign shift2s = jal;
	assign ALUSrc[1] = lui | ori; 
	assign ALUSrc[0] = lw | sw | lui;
	
	assign istiaozhuan = blez;////////////////////////////////////////////////////////////////////////////
	
endmodule
