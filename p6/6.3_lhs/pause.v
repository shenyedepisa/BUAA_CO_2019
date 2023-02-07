`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:43:23 12/22/2019 
// Design Name: 
// Module Name:    pause 
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
module pause(
    input [31:0] IR,
    input [31:0] IR_E,
    input [31:0] IR_M,
	 input alubusy,
    output  stop
    );
    
	wire [5:0] op;
	wire [5:0] func;
	wire [4:0] rs;
	wire [4:0] rt;
	wire [4:0] rd;
	
	wire lw_E;
	wire addu_E;
	wire subu_E;
	wire ori_E;
	wire [4:0]rs_E;
	wire [4:0]rt_E;
	wire [4:0]rd_E;
	wire [5:0]func_E;
	wire [5:0]op_E;

	wire lw_M;
	wire [4:0]rs_M;
	wire [4:0]rt_M;
	wire [4:0]rd_M;
	wire [5:0]func_M;
	wire [5:0]op_M;

	wire addu;
	wire subu;
	wire ori;
	wire lw;
	wire sw;
	wire beq;
	wire jr;
	wire sh;
	wire sb;
	wire lb;
	wire lh;
	wire lhu;
	wire lbu;
	
	assign op = IR[31:26];
	assign func = IR[5:0];
	assign rs = IR[25:21];
	assign rt = IR[20:16];
	assign rd = IR[15:11];
	
	assign rt_E = IR_E[20:16];
	assign rd_E = IR_E[15:11];
	assign rs_E = IR_E[25:21];
	assign op_E = IR_E[31:26];
	assign func_E = IR_E[5:0];

	assign rs_M = IR_M[25:21];
	assign rt_M = IR_M[20:16];
	assign rd_M = IR_M[15:11];
	assign op_M = IR_M[31:26];
	assign func_M = IR_M[5:0];
	
	assign add = (op === 6'b000000 && func === 6'b100000);
	assign sub = (op === 6'b000000 && func === 6'b100010);
	assign addu = (op === 6'b000000 && func === 6'b100001) || add;
	assign subu = (op === 6'b000000 && func === 6'b100011) || sub;
	assign addi = (op === 6'b001000);
	assign addiu = (op === 6'b001001) || addi;
	assign ori = (op === 6'b001101);
	assign lw = (op === 6'b100011);
	assign sw = (op === 6'b101011);
	assign beq = (op === 6'b000100);
	assign jr = (op === 6'b000000 && func === 6'b001000);
	assign jalr = (op === 6'b000000 && func === 6'b001001);
	assign sh = (op === 6'b101001);
	assign sb = (op === 6'b101000);
	assign lh = (op === 6'b100001);
	assign lb = (op === 6'b100000);
	assign lhu = (op === 6'b100101);
	assign lbu = (op === 6'b100100);
	assign AND = (op === 6'b000000 && func === 6'b100100);
	assign OR = (op === 6'b000000 && func === 6'b100101);	
	assign XOR = (op === 6'b000000 && func === 6'b100110);
	assign NOR = (op === 6'b000000 && func === 6'b100111);	
	assign andi = (op === 6'b001100);
	assign xori = (op === 6'b001110);
	assign bne = (op === 6'b000101);
	assign bgez = (op === 6'b000001 && rt === 5'b00001);
	assign bgtz = (op === 6'b000111);
	assign blez = (op === 6'b000110);
	assign bltz = (op === 6'b000001 && rt === 5'b00000);
	assign slt = (op === 6'b000000 && func === 6'b101010);
	assign slti = (op === 6'b001010);
	assign sltiu = (op === 6'b001011);
	assign sltu = (op === 6'b000000 && func === 6'b101011);
	assign sll = (op === 6'b000000 && func === 6'b000000);
	assign sllv = (op === 6'b000000 && func  === 6'b000100);
	assign srl = (op === 6'b000000 && func === 6'b000010);
	assign srlv = (op === 6'b000000 && func === 6'b000110);
	assign sra = (op === 6'b000000 && func === 6'b000011);
	assign srav = (op === 6'b000000 && func === 6'b000111); 
	assign mult = (op === 6'b000000 && func === 6'b011000);
	assign multu = (op === 6'b000000 && func === 6'b011001);
	assign div = (op === 6'b000000 && func === 6'b011010);
	assign divu = (op === 6'b000000 && func === 6'b011011);
	assign mtlo = (op === 6'b000000 && func === 6'b010011);
	assign mthi = (op === 6'b000000 && func === 6'b010001);
	assign mflo = (op === 6'b000000 && func === 6'b010010);
	assign mfhi = (op === 6'b000000 && func === 6'b010000);
	assign lhs = (op === 6'b011001);
	
	assign add_E = (op_E === 6'b000000 && func_E === 6'b100000);
	assign sub_E = (op_E === 6'b000000 && func_E === 6'b100010);
	assign lw_E = (op_E === 6'b100011);
	assign lh_E = (op_E === 6'b100001);
	assign lb_E = (op_E === 6'b100000);
	assign lhu_E = (op_E === 6'b100101);
	assign lbu_E = (op_E === 6'b100100);
	assign addu_E = (op_E === 6'b000000 && func_E === 6'b100001) || add_E;
	assign subu_E = (op_E === 6'b000000 && func_E === 6'b100011) || sub_E;
	assign addi_E = (op_E === 6'b001000);
	assign addiu_E = (op_E === 6'b001001) || addi_E;
	assign ori_E = (op_E === 6'b001101);
	assign AND_E = (op_E === 6'b000000 && func_E === 6'b100100);
	assign OR_E = (op_E === 6'b000000 && func_E === 6'b100101);
	assign XOR_E = (op_E === 6'b000000 && func_E === 6'b100110);
	assign NOR_E = (op_E === 6'b000000 && func_E === 6'b100111);
	assign andi_E = (op_E === 6'b001100);
	assign xori_E = (op_E === 6'b001110);
	assign slt_E = (op_E === 6'b000000 && func_E === 6'b101010);
	assign slti_E = (op_E === 6'b001010);
	assign sltiu_E = (op_E === 6'b001011);
	assign sltu_E = (op_E === 6'b000000 && func_E === 6'b101011);	
	assign sll_E = (op_E === 6'b000000 && func_E === 6'b000000);	
	assign sllv_E = (op_E === 6'b000000 && func_E  === 6'b000100);
	assign srl_E = (op_E === 6'b000000 && func_E === 6'b000010);
	assign srlv_E = (op_E === 6'b000000 && func_E === 6'b000110); 
	assign sra_E = (op_E === 6'b000000 && func_E === 6'b000011);
	assign srav_E = (op_E === 6'b000000 && func_E === 6'b000111);
	assign mult_E = (op_E === 6'b000000 && func_E === 6'b011000);
	assign multu_E = (op_E === 6'b000000 && func_E === 6'b011001);
	assign div_E = (op_E === 6'b000000 && func_E === 6'b011010);
	assign divu_E = (op_E === 6'b000000 && func_E === 6'b011011);
	assign mtlo_E = (op_E === 6'b000000 && func_E === 6'b010011);
	assign mthi_E = (op_E === 6'b000000 && func_E === 6'b010001);
	assign mflo_E = (op_E === 6'b000000 && func_E === 6'b010010);
	assign mfhi_E = (op_E === 6'b000000 && func_E === 6'b010000);
	assign lhs_E = (op_E === 6'b011001);	
	
	assign lw_M = (op_M === 6'b100011);
	assign lh_M = (op_M === 6'b100001);
	assign lb_M = (op_M === 6'b100000);
	assign lhu_M = (op_M === 6'b100101);
	assign lbu_M = (op_M === 6'b100100);
	assign lhs_M = (op_M === 6'b011001);
	
	assign rs_1 = (lhs || mthi || mtlo || mult || multu || div || divu || srav || srlv || sllv || slt || slti || sltiu || sltu || NOR || XOR || OR || AND || sh || sw || sb || lw || lh || lb || lhu || lbu || addu || subu || ori || andi || xori || addiu);
	assign rt_1 = (mult || multu || div || divu || srav || sra || srlv || srl || sllv || sll || slt || sltu || NOR || XOR || OR || AND || addu || subu);
	assign rs_0 = (beq || bne || bgez || bgtz || blez || bltz || jr || jalr);
	assign rt_0 = (beq || bne);    
	
	assign s1 = ( rs_1 && (lhs_E || lw_E || lh_E || lb_E || lbu_E || lhu_E) && (rs === rt_E) && (rs !== 0));
	assign s2 = ( rt_1 && (lhs_E || lw_E || lh_E || lb_E || lbu_E || lhu_E) && (rt === rt_E) && (rt !== 0));
	assign s3 = ( rs_0 && (((lhs_E || lw_E || lh_E || lb_E || lbu_E || lhu_E) && (rs === rt_E) && (rs !== 0))|| 
								((mfhi_E || mflo_E || srav_E || sra_E || srlv_E || srl_E || sllv_E || sll_E || slt_E || sltu_E || NOR_E || XOR_E || OR_E || addu_E || subu_E || AND_E) && (rs === rd_E) && (rs !== 0)) ||
								((slti_E || sltiu_E || andi_E || xori_E || ori_E || addiu_E) && (rs === rt_E) && (rs !== 0)) ||
								((lhs_M || lw_M || lh_M || lb_M || lbu_M || lhu_M) && (rs === rt_M) && (rs !== 0))));
	assign s4 = ( rt_0 && (((lhs_E || lw_E || lh_E || lb_E || lbu_E || lhu_E) && (rt === rt_E) && (rt !== 0))|| 
								((mfhi_E || mflo_E || srav_E || sra_E || srlv_E || srl_E || sllv_E || sll_E || slt_E || sltu_E || NOR_E || XOR_E || OR_E || addu_E || subu_E || AND_E) && (rt === rd_E) && (rt !== 0)) ||
								((slti_E || sltiu_E || andi_E || xori_E || ori_E || addiu_E) && (rt === rt_E) && (rt !== 0)) ||
								((lhs_M ||  lw_M || lh_M || lb_M || lbu_M || lhu_M) && (rt === rt_M) && (rt !== 0))));

	assign s5 = ((mult||multu||div||divu||mfhi||mflo||mthi||mtlo) && alubusy);
	
	assign s6 = ((mult||multu||div||divu||mfhi||mflo||mthi||mtlo) && (mult_E||multu_E||div_E||divu_E));
	
	assign stop = s1 || s2 || s3 || s4 || s5 || s6;
	
endmodule
