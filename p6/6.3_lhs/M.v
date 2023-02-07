`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:41:20 12/23/2019 
// Design Name: 
// Module Name:    M 
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
module M(
    input [31:0] IR,
    input [31:0] IR_W,
    input clk,
    input reset,
    input [31:0] pc,
    input [31:0] pc4,
    input [31:0] ALUout,
    input [31:0] data2,
    input [31:0] mul_WD,
    output [31:0] aluout_M,
    output [31:0] DMout_M,
    output [31:0] pc_M,
    output [31:0] pc4_M,
    output [31:0] IR_M
    );
    
	 wire [1:0]save_sel;
	 wire [2:0]load_sel;
    wire memRead;
    wire memWrite;
    wire [1:0]WDsel;
    wire [31:0]WD;
	 wire [31:0]DMout;
    
    assign aluout_M = ALUout;
    assign pc_M = pc;
    assign pc4_M = pc4;
    assign IR_M = (load_sel === 5 && (ALUout[1:0] === 1 || ALUout[1:0] === 3))?{IR[31:21],5'b00000,IR[15:0]}:IR;
    
    assign WD = (WDsel === 1)? mul_WD : data2;
    
DM DM(
    .clk(clk),
    .reset(reset),
    .memRead(memRead),
    .memWrite(memWrite),
    .pc(pc),
    .writedata(WD),
    .address(ALUout),
	 .save_sel(save_sel),
    .readdata(DMout)
    );
    
load load(
	.data(DMout),
	.load_sel(load_sel),
	.address(ALUout), 
	.dataout(DMout_M)
	 );
	 
controller M_controller(
	.IR(IR),
    .D_IR(),
    .E_IR(),
    .M_IR(IR),
    .W_IR(IR_W),
    .b(),
    .RegWrite(),
    .MemRead(memRead),
    .MemWrite(memWrite),
    .IMMsel(),
	 .IMMsel_rs(), 
    .PCsel(),
    .ALUop(),
	 .alupro_op(),
	 .start(),	 
    .mul_A3(),
    .mul_WD(),
    .z_D_rs(),
    .z_D_rt(),
    .z_E_rs(),
    .z_E_rt(),
    .z_M_rt(WDsel),
	 .save_sel(save_sel),
	 .load_sel(load_sel)
    );
    
endmodule