`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:34:37 12/21/2019 
// Design Name: 
// Module Name:    F 
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
module F(
	input clk,
	input reset,
	input stop,
	input [31:0]IR_E,
	input [31:0]IR_M,
	input [15:0]imm16,
	input [25:0]imm26,
	input [31:0]rs,
	input [31:0]rt,
	input [2:0]pcsel,
	input equal,
	input isbeq,
	input da,
	output [31:0]pc_F,
	output [31:0]pc4_F,
	output [31:0]IR_F
    );
    
	wire [31:0]IR;
      
	assign pc4_F = pc_F+4;
	
IM IM(
    .address(pc_F),
    .IR(IR)
    );
  
NPC npc(
    .pc4(pc4_F),
    .rs(rs),
	 .rt(rt),
	 .da(da),
    .PCsel(pcsel),
    .imm16(imm16),
    .imm26(imm26),
    .isbeq(isbeq),
    .stop(stop),
    .clk(clk),
    .reset(reset),
    .equal(equal),
    .Nextpc(pc_F)
    );
    
    assign IR_F = IR;
    
endmodule
