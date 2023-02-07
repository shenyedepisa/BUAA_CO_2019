`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:11:37 12/23/2019 
// Design Name: 
// Module Name:    E 
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
module E(
    input [31:0] IR,
    input [31:0] IR_M,
    input [31:0] IR_W,
    input [31:0] pc4_M,
    input [31:0] ALUout_M,
    input [31:0] mul_WD,
    input clk,
    input reset,
    input [31:0] zeroext,
    input [31:0] signext,
    input [31:0] high,
    input [31:0] pc,
    input [31:0] pc4,
    input [31:0]data1,
    input [31:0]data2,
    output [31:0] ALUout_E,//
    output [31:0] data2_E,//
    output [31:0] IR_E,//
    output [31:0] pc_E,//
    output [31:0] pc4_E//
    );

	wire [2:0]jump1;
	wire [2:0]jump2;
	wire [3:0]ALUop;
	wire [1:0]immsel;
	wire [31:0]mul_alu1;
	wire [31:0]mul_alu2;
	wire [31:0]mul_imm;
	wire isclz;
	
	wire [31:0]clzout;
	wire [31:0]ALUout;
	
	assign IR_E = IR;
	assign pc4_E = pc4;
	assign pc_E = pc;
	assign high_E = high;
	
	assign mul_alu1 = (jump1 === 1) ? pc4_M+4:
						(jump1 === 2) ? ALUout_M:
						(jump1 === 3) ? mul_WD : data1;
					
	assign mul_alu2 = (jump2 === 1) ? pc4_M+4:
						(jump2 === 2) ? ALUout_M:
						(jump2 === 3) ? mul_WD : data2;
					
	assign data2_E = mul_alu2;
	
	assign mul_imm = (immsel === 0) ? mul_alu2 :
						(immsel === 1) ? signext :
						(immsel === 2) ? zeroext : high;
ALU ALU(
    .alu1(mul_alu1),
    .alu2(mul_imm),
    .ALUop(ALUop),
	 .clk(clk),
    .aluout(ALUout)
    );
    
clz clz(
    .A(mul_alu1),
    .clzout(clzout)
    );
	 
	 assign ALUout_E = (isclz)?clzout:ALUout;
	 
controller E_controller(
	.IR(IR),
    .D_IR(),
    .E_IR(IR),
    .M_IR(IR_M),
    .W_IR(IR_W),
    .isbeq(),
    .RegWrite(),
    .MemRead(),
    .MemWrite(),
    .IMMsel(immsel),
    .PCsel(),
    .ALUop(ALUop),
    .mul_A3(),
    .mul_WD(),
    .z_D_rs(),
    .z_D_rt(),
    .z_E_rs(jump1),
    .z_E_rt(jump2),
    .z_M_rt(),
	 .isclz(isclz)
    );
    
endmodule
