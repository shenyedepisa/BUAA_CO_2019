`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:16:27 12/21/2019 
// Design Name: 
// Module Name:    mips 
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
module mips(
    input clk,
    input reset
    );
	
	wire [31:0]ir_F;
	wire [31:0]pc_F;
	wire [31:0]pc4_F;
	wire stop;
	
	wire [31:0]ir_FD;
	wire [31:0]pc_FD;
	wire [31:0]pc4_FD;
	
	wire [1:0]cmp_zero_D;
	wire equal_D;
	wire [2:0]b_D;
	wire [2:0]PCsel_D;
	wire [15:0]imm16_D;
	wire [25:0]imm26_D;
	wire [31:0]data1_D;
	wire [31:0]data2_D;
	wire [31:0]signext_D;
	wire [31:0]zeroext_D;
	wire [31:0]high_D;
	wire [31:0]PC_D;
	wire [31:0]PC4_D;
	wire [31:0]ir_D;

	wire [31:0]ir_DE;
	wire [31:0]pc_DE;
	wire [31:0]pc4_DE;
	wire [31:0]high_DE;
	wire [31:0]data1_DE;
	wire [31:0]data2_DE;
	wire [31:0]signext_DE;
	wire [31:0]zeroext_DE;
	
	wire [31:0]aluout_E;
	wire [31:0]data2_E;
	wire [31:0]IR_E;
	wire [31:0]pc_E;
	wire [31:0]pc4_E;
	wire alubusy_E;

	wire [31:0]ir_EM;
	wire [31:0]pc_EM;
	wire [31:0]pc4_EM;
	wire [31:0]high_EM;
	wire [31:0]aluout_EM;
	wire [31:0]data2_EM;
	
	wire [31:0]ALUout_M;
	wire [31:0]DMout_M;
	wire [31:0]high_M;
	wire [31:0]pc_M;
	wire [31:0]pc4_M;
	wire [31:0]ir_M;
    
	wire [31:0]ir_MW;
	wire [31:0]pc_MW;
	wire [31:0]pc4_MW;
	wire [31:0]high_MW;
	wire [31:0]ALUout_MW;
	wire [31:0]DMout_MW;
    
	wire [31:0]mulWD_W;
   wire [4:0]mulA3_W;
	wire regWrite_W;
    
F F(
	.clk(clk),
	.reset(reset),
	.stop(stop),
	.IR_E(ir_DE),
	.IR_M(ir_EM),
	.imm16(imm16_D),
	.imm26(imm26_D),
	.rs(data1_D),
	.pcsel(PCsel_D),
	.equal(equal_D),
	.cmp_zero(cmp_zero_D),
	.b(b_D),
	.pc_F(pc_F),
	.pc4_F(pc4_F),
	.IR_F(ir_F)
    );
    
F_D F_D(
    .IR(ir_F),
    .PC(pc_F),
    .PC4(pc4_F),
    .clk(clk),
    .reset(reset),
    .stop(stop),
    .IR_D(ir_FD),
    .PC_D(pc_FD),
    .PC4_D(pc4_FD)
    );
   
D D(
    .IR(ir_FD),
    .IR_E(ir_DE),
    .IR_M(ir_EM),
    .IR_W(ir_MW),
    .pc(pc_FD),
    .pc4(pc4_FD),
    .pc4_E(pc4_DE),
    .high_E(high_DE),
    .pc4_M(pc4_EM),
    .ALUout_M(aluout_EM),
    .mul_WD(mulWD_W),
    .mul_A3(mulA3_W),
    .regWrite_W(regWrite_W),
    .pc_W(pc_MW),
    .clk(clk),
    .reset(reset),
	 .alubusy(alubusy_E),
    .IR_D(ir_D),
    .data1(data1_D),
    .data2(data2_D),
    .sign_ext(signext_D),
    .zero_ext(zeroext_D),
    .high(high_D),
    .PC_D(PC_D),
    .PC4_D(PC4_D),
    .imm16(imm16_D),
    .imm26(imm26_D),
    .PCsel_D(PCsel_D),
    .equal_D(equal_D),
	 .cmp_zero(cmp_zero_D),
    .b_D(b_D),
    .stop(stop)
    );
    
D_E D_E(
	.clk(clk),
	.reset(reset),
    .RD1(data1_D),
    .RD2(data2_D),
    .sign_ext(signext_D),
    .ext_0(zeroext_D),
    .high(high_D),
    .pc(PC_D),
    .pc4(PC4_D),
    .IR(ir_D),
    .RD1_E(data1_DE),
    .RD2_E(data2_DE),
    .sign_ext_E(signext_DE),
    .ext_0_E(zeroext_DE),
    .high_E(high_DE),
    .pc4_E(pc4_DE),
    .pc_E(pc_DE),
    .IR_E(ir_DE)
    );

E E(
    .IR(ir_DE),
    .IR_M(ir_EM),
    .IR_W(ir_MW),
    .pc4_M(pc4_EM),
    .ALUout_M(aluout_EM),
    .mul_WD(mulWD_W),
    .clk(clk),
    .reset(reset),
    .zeroext(zeroext_DE),
    .signext(signext_DE),
    .high(high_DE),
    .pc(pc_DE),
    .pc4(pc4_DE),
    .data1(data1_DE),
    .data2(data2_DE),
    .ALUout_E(aluout_E),
    .data2_E(data2_E),
    .IR_E(IR_E),
    .pc_E(pc_E),
    .pc4_E(pc4_E),
	 .alubusy_E(alubusy_E)
    );
    
E_M E_M(
    .ALUout(aluout_E),
    .data2(data2_E),
    .IR(IR_E),
    .pc(pc_E),
    .pc4(pc4_E),
    .clk(clk),
    .reset(reset),
    .ALUout_M(aluout_EM),
    .data2_M(data2_EM),
    .IR_M(ir_EM),
    .pc_M(pc_EM),
    .pc4_M(pc4_EM)
    );
    
M M(
    .IR(ir_EM),
    .IR_W(ir_MW),
    .clk(clk),
    .reset(reset),
    .pc(pc_EM),
    .pc4(pc4_EM),
    .ALUout(aluout_EM),
    .data2(data2_EM),
    .mul_WD(mulWD_W),
    .aluout_M(ALUout_M),
    .DMout_M(DMout_M),
    .pc_M(pc_M),
    .pc4_M(pc4_M),
    .IR_M(ir_M)
    );
    
M_W M_W(
    .IR(ir_M),
    .pc(pc_M),
    .pc4(pc4_M),
    .ALUout(ALUout_M),
    .DMout(DMout_M),
    .clk(clk),
    .reset(reset),
    .IR_W(ir_MW),
    .pc_W(pc_MW),
    .pc4_W(pc4_MW),
    .ALUout_W(ALUout_MW),
    .DMout_W(DMout_MW)
    );
    
W W(
    .IR(ir_MW),
    .pc(pc_MW),
    .pc4(pc4_MW),
    .ALUout(ALUout_MW),
    .DMout(DMout_MW),
    .WD_W(mulWD_W),
    .addr_W(mulA3_W),
    .RegWrite_W(regWrite_W)
    );
    
endmodule
