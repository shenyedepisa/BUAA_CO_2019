`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:15:19 11/27/2019 
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
    
	wire blez;//////////////////////////////////
	//IM相关
	wire [31:0] pc;
	wire [31:0] instr;
	wire [5:0] func;
	wire [4:0] shamt;
	wire [4:0] rd;
	wire [4:0] rt;
	wire [4:0] rs;
	wire [5:0] op;
	wire [15:0] imm;
	wire [25:0] index26;
	//controller
	wire regwrite;
	wire memread;
	wire memwrite;
	wire [1:0]regdst;
	wire branch;
	wire [1:0]memtoreg;
	wire [1:0]pcsrc;
	wire [3:0]aluop;
	wire shift2s;
	wire [1:0]alusrc;
	wire istiaozhuan;/////////////////////////////////////
	
	//adder
	wire [31:0] pc_4;
	//ALU
	wire [31:0] indata2;
	wire [31:0]result;
	wire equal;
	//0-ext
	wire [31:0] imm_ext_0;
	wire [31:0] index26_ext_0;
	//shift2
	wire [31:0] s2;
	wire [31:0] inshift2;
	//ext
	wire [31:0] ext_imm;
	//shift16
	wire [31:0] shift16_imm;
	//grf
	wire [31:0] Rdata1;
	wire [31:0] Rdata2;
	wire [4:0] inrd;
	wire [31:0] indata;
	//DM
	//wire [31:0] dmaddress;
	//wire [31:0] dmwritedata;
	wire [31:0] dmreaddata;
	
	assign func = instr[5:0];
	assign shamt = instr[10:6];
	assign rd = instr[15:11];
	assign rt = instr[20:16];
	assign rs = instr[25:21];
	assign op = instr[31:26];
	assign imm = instr[15:0];
	assign index26 = instr[25:0];
	
	//o-ext 零扩展
	assign imm_ext_0 = {16'b0,instr[15:0]};
	
	assign index26_ext_0 = {10'b0,instr[25:0]};
	
	assign inshift2 = (shift2s === 1)?index26_ext_0:ext_imm;
	
	assign shift16_imm = {imm,16'b0};		/////加载到高位
	
	assign inrd = (regdst === 0)?rt:
					(regdst === 1)?rd:31;
					
	assign indata = (memtoreg === 0)?result:
					(memtoreg === 1)?dmreaddata:pc_4;
					
	assign indata2 = (alusrc === 0)?Rdata2:
						(alusrc === 1)?ext_imm:
						(alusrc === 2)?imm_ext_0:shift16_imm;
						
	//assign dmaddress = result;
	//assign dmwritedata = Rdata2;

IM im(
	.address(pc),
	.mipsop(instr)
	);

controller controller(
	.func(func),
	.op(op),
	.rt(rt),
	.RegWrite(regwrite),
	.MemRead(memread),
	.MemWrite(memwrite),
	.RegDst(regdst),				//[1:0]
	.branch(branch),
	.MemtoReg(memtoreg),		//[1:0]
	.PCSrc(pcsrc),				//[1:0]
	.ALUop(aluop),				//[3:0]
	.shift2s(shift2s),
	.ALUSrc(alusrc),				//[1:0]
	.istiaozhuan(istiaozhuan)		////////////////////////////////////////////////////////////
	);

adder adder(
    .pc(pc),							//[31:0]
    .pc_4(pc_4)						//[31:0]
    );
	
shift2 shift2(
	.a(inshift2),
	.shift2(s2)
	);
	
//符号扩展
ext ext(
	.in(imm),
	.out(ext_imm)
	);

GRF grf(
    .RS(rs),					//[4:0]
    .RT(rt),					//[4:0]
    .RD(inrd),				//[4:0]
    .WD(indata),			//[31:0]
    .WPC(pc),				//[31:0]
    .CLK(clk),
    .Reset(reset),
    .RegWrite(regwrite),
    .data1(Rdata1),		//[31:0]
    .data2(Rdata2)			//[31:0]
    );

ALU alu(
	.A(Rdata1),				//[31:0]
	.B(indata2),				//[31:0]
	.ALUop(aluop),			//[3:0]
	.result(result),				//[31:0]
	.zero(equal),
	.blez(blez)
    );
    
nPC nPC(
	.pc4(pc_4),				//[31:0]
	.shift2(s2),					//[31:0]
	.Rdata1(Rdata1),			//[31:0]
	.pcsrc(pcsrc),				//[1:0]
	.branch(branch),
	.equal(equal),
	.clk(clk),
	.reset(reset),
	.blez(blez),////////////////////////////////////////////////////////////////////////
	.istiaozhuan(istiaozhuan),	///////////////////////////////////////////////
	.Nextpc(pc)				//[31:0]
    );

DM dm(
    .clk(clk),
    .reset(reset),
    .memRead(memread),
    .memWrite(memwrite),
    .pc(pc),									//[31:0]
    .writedata(Rdata2),					//[31:0]
    .address(result),						//[31:0]
    .readdata(dmreaddata)				//[31:0]
    );
    
endmodule
