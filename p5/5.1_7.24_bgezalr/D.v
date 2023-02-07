`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:47:23 12/22/2019 
// Design Name: 
// Module Name:    D 
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
module D(
    input [31:0]IR,
    input [31:0]IR_E,
    input [31:0]IR_M,
    input [31:0]IR_W,
    input [31:0] pc,
    input [31:0] pc4,
    input [31:0] pc4_E,
    input [31:0] high_E,
    input [31:0] pc4_M,
    input [31:0] ALUout_M,
    input [31:0] mul_WD,
    input [4:0] mul_A3,
    input regWrite_W,
    input [31:0]pc_W,
    input clk,
    input reset,
    output [31:0] IR_D,
    output [31:0] data1,
    output [31:0] data2,
    output [31:0] sign_ext,
    output [31:0] zero_ext,
    output [31:0] high,
    output [31:0] PC_D,
    output [31:0] PC4_D,
    output [15:0] imm16,
    output [25:0] imm26,
    output [2:0] PCsel_D,
    output equal_D,
    output isbeq_D,
    output stop,
	 output da
    );
    
	wire [4:0]rs;
	wire [4:0]rt;
	wire [31:0]Rdata1;
	wire [31:0]Rdata2;
	
	wire [2:0]cmp1;
	wire [2:0]cmp2;
	
	assign rs = IR[25:21];
	assign rt = IR[20:16];
	
grf grf(
    .A1(rs),
    .A2(rt),
    .A3(mul_A3),
    .WD(mul_WD),
    .pc(pc_W),
    .clk(clk),
    .reset(reset),
    .regwrite(regWrite_W),
    .data1(Rdata1),
    .data2(Rdata2)
    );
    
controller D_controller(
	.IR(IR),
    .D_IR(IR),
    .E_IR(IR_E),
    .M_IR(IR_M),
    .W_IR(IR_W),
    .isbeq(isbeq_D),
    .RegWrite(),
    .MemRead(),
    .MemWrite(),
    .IMMsel(),
    .PCsel(PCsel_D),
    .ALUop(),
    .mul_A3(),
    .mul_WD(),
    .z_D_rs(cmp1),
    .z_D_rt(cmp2),
    .z_E_rs(),
    .z_E_rt(),
    .z_M_rt()
    );
    
pause pause(
    .IR(IR),
    .IR_E(IR_E),
    .IR_M(IR_M),
    .stop(stop)
    );  

    assign data1 = (cmp1 === 1) ? pc4_E+4:
					(cmp1 === 2) ? high_E:
					(cmp1 === 3) ? pc4_M+4:
					(cmp1 === 4) ? ALUout_M : Rdata1;
					
    assign data2 = (cmp2 === 1) ? pc4_E+4:
					(cmp2 === 2) ? high_E:
					(cmp2 === 3) ? pc4_M+4:
					(cmp2 === 4) ? ALUout_M : Rdata2;
					
	assign da = (data1[31] === 0)?1:0;			
					
	assign equal_D = (data1 === data2);
	
	assign sign_ext = (IR[15]===1)?{16'b1111111111111111, IR[15:0]}:{16'b0000000000000000, IR[15:0]};
	
	assign zero_ext = {16'b0000000000000000, IR[15:0]};
	
	assign high = {IR[15:0],16'b0000000000000000};
	
	assign PC_D = pc;
	assign PC4_D = pc4;
	assign imm16 = IR[15:0];
   assign imm26 = IR[25:0];
	
	assign IR_D = (stop) ? 32'b0 : IR;

endmodule
