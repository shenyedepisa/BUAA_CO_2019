`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:05:43 12/22/2019 
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
	input [31:0] IR,
    input [31:0] D_IR,
    input [31:0] E_IR,
    input [31:0] M_IR,
    input [31:0] W_IR,
    output isbeq,
    output RegWrite,
    output MemRead,
    output MemWrite,
    output [1:0] IMMsel,
    output [2:0] PCsel,
    output [3:0] ALUop,
    output [1:0] mul_A3,
    output [1:0] mul_WD,
    output [2:0] z_D_rs,
    output [2:0] z_D_rt,
    output [2:0] z_E_rs,
    output [2:0] z_E_rt,
    output [1:0] z_M_rt,
	 output issh
    );
	wire [5:0] op;
	wire [5:0] func;
	wire [4:0] rs;
	wire [4:0] rt;
	wire addu;
	wire subu;
	wire ori;
	wire lw;
	wire sw;
	wire lui;
	wire beq;
	wire j;
	wire jal;
	wire jr;
	wire sh;
	
	wire jal_E;
	wire lui_E;
	wire [4:0]rt_E;
	
	wire lui_M;
	wire jal_M;
	wire addu_M;
	wire subu_M;
	wire ori_M;
	wire [4:0]rs_M;
	wire [4:0]rt_M;
	wire [4:0]rd_M;
	
	wire jal_W;
	wire addu_W;
	wire subu_W;
	wire ori_W;
	wire lui_W;
	wire lw_W;
	wire [4:0]rs_W;
	wire [4:0]rt_W;
	wire [4:0]rd_W;
	
	assign op = IR[31:26];
	assign func= IR[5:0];
	assign rs = IR[25:21];
	assign rt = IR[20:16];
	
	assign jal_E = (E_IR[31:26] === 6'b000011);
	assign lui_E = (E_IR[31:26] === 6'b001111);
	assign rt_E = E_IR[20:16];
	
	assign rs_M = M_IR[25:21];
	assign rt_M = M_IR[20:16];
	assign rd_M = M_IR[15:11];
	assign lui_M = (M_IR[31:26] === 6'b001111);
	assign jal_M = (M_IR[31:26] === 6'b000011);
	assign addu_M = (M_IR[31:26] === 6'b000000 && M_IR[5:0] === 6'b100001);
	assign subu_M = (M_IR[31:26] === 6'b000000 && M_IR[5:0] === 6'b100011);
	assign ori_M = (M_IR[31:26] === 6'b001101);

	assign rs_W = W_IR[25:21];
	assign rt_W = W_IR[20:16];
	assign rd_W = W_IR[15:11];
	assign lui_W = (W_IR[31:26] === 6'b001111);
	assign jal_W = (W_IR[31:26] === 6'b000011);
	assign addu_W = (W_IR[31:26] === 6'b000000 && W_IR[5:0] === 6'b100001);
	assign subu_W = (W_IR[31:26] === 6'b000000 && W_IR[5:0] === 6'b100011);
	assign ori_W = (W_IR[31:26] === 6'b001101);
	assign lw_W = (W_IR[31:26] === 6'b100011);
	
	assign addu = (op === 6'b000000 && func === 6'b100001);
	assign subu = (op === 6'b000000 && func === 6'b100011);
	assign ori = (op === 6'b001101);
	assign lw = (op === 6'b100011);
	assign sw = (op === 6'b101011);
	assign lui = (op === 6'b001111);
	assign beq = (op === 6'b000100);
	assign j = (op === 6'b000010);
	assign jal = (op === 6'b000011);
	assign jr = (op === 6'b000000 && func === 6'b001000);
	
	assign sh = (op === 6'b101001);
	assign issh = sh;
	
	assign isbeq = beq;
	assign RegWrite = addu | subu | ori | lw | lui | jal;
	assign MemRead = lw;
	assign MemWrite = sw | sh;
	assign IMMsel[1] = ori | lui;
	assign IMMsel[0] = lw | sw | lui | sh;
	assign PCsel[2] = 0;
	assign PCsel[1] = j | jal | jr;
	assign PCsel[0] = beq | jr;
	assign ALUop[3] = 0;
	assign ALUop[2] = subu | beq;
	assign ALUop[1] = addu | subu | lw | sw | sh | lui | beq | j | jal | jr;
	assign ALUop[0] = ori;
	assign mul_A3[1] = jal;
	assign mul_A3[0] = addu | subu;
	assign mul_WD[1] = jal ;
	assign mul_WD[0] = addu | subu | ori | sw | sh | lui | beq | j | jr ;
	
	assign z_D_rs = ((beq || jr) && jal_E && (rs === 31) && (rs !== 0))?1 :
						((beq || jr) && lui_E && (rs === rt_E) && (rs !== 0))?2 :
						((beq || jr) && jal_M && (rs === 31) && (rs !== 0))?3 :
						((beq || jr) && (lui_M || ori_M)&& (rs === rt_M) && (rs !== 0))?4 :
						((beq || jr) && (addu_M || subu_M) &&(rs === rd_M) && (rs !== 0))?4 : 0;
						
	assign z_D_rt = (beq && jal_E && (rt === 31) && (rt !== 0))?1 :
						(beq && lui_E && (rt === rt_E) && (rt !== 0))?2 :
						(beq && jal_M && (rt === 31) && (rt !== 0))?3 :
						(beq && (lui_M || ori_M) && (rt === rt_M) && (rt !== 0))?4 :
						(beq && (addu_M || subu_M) && (rt === rd_M) && (rt !== 0))?4 : 0;
						
	assign z_E_rs = ((addu || subu || ori || lw || sw || sh) && jal_M && (rs === 31) && (rs !== 0))?1 :
						((addu || subu || ori || lw || sw || sh) && (lui_M || ori_M) && (rs === rt_M) && (rs !== 0))?2 :
						((addu || subu || ori || lw || sw || sh) && (addu_M || subu_M) && (rs === rd_M) && (rs !== 0))?2 :
						((addu || subu || ori || lw || sw || sh) && jal_W && (rs === 31) && (rs !== 0))?3 :
						((addu || subu || ori || lw || sw || sh) && (addu_W || subu_W) && (rs === rd_W) && (rs !== 0))?3 :
						((addu || subu || ori || lw || sw || sh) && (ori_W || lui_W || lw_W) && (rs === rt_W) && (rs !== 0))?3: 0;						
	
	assign z_E_rt = ((addu || subu || sw || sh) && jal_M && (rt === 31) && (rt !== 0))?1 :
						((addu || subu || sw || sh) && (lui_M || ori_M) && (rt === rt_M) && (rt !== 0))?2 :
						((addu || subu || sw || sh) && (addu_M || subu_M) && (rt === rd_M) && (rt !== 0))?2 :
						((addu || subu || sw || sh) && jal_W && (rt === 31) && (rt !== 0))?3 :
						((addu || subu || sw || sh) && (addu_W || subu_W) && (rt === rd_W) && (rt !== 0))?3 :
						((addu || subu || sw || sh) && (ori_W || lui_W || lw_W) && (rt === rt_W) && (rt !== 0))?3: 0;
						
	assign z_M_rt = ((sw || sh) && jal_W && (rt === 31) && (rt !== 0))?1:
						((sw || sh) && (addu_W || subu_W) && (rt === rd_W) && (rt !== 0))?1 :
						((sw || sh) && (ori_W || lui_W || lw_W) && (rt === rt_W) && (rt !== 0))?1: 0;
	
endmodule
