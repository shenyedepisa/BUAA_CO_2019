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
    output [2:0] b,
    output RegWrite,
    output MemRead,
    output MemWrite,
	 output IMMsel_rs,
    output [2:0] IMMsel,
    output [2:0] PCsel,
    output [3:0] ALUop,
	 output [3:0] alupro_op,
	 output start,
    output [1:0] mul_A3,
    output [1:0] mul_WD,
    output [2:0] z_D_rs,
    output [2:0] z_D_rt,
    output [2:0] z_E_rs,
    output [2:0] z_E_rt,
    output [1:0] z_M_rt,
	 output [1:0] save_sel,
	 output [2:0] load_sel
    );
	wire [5:0] op;
	wire [5:0] func;
	wire [4:0] rs;
	wire [4:0] rt;
	wire [4:0] rd;
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
	wire sb;
	wire lb;
	wire lh;
	wire lhu;
	wire lbu;
	
	wire jal_E;
	wire lui_E;
	wire [4:0]rs_E;
	wire [4:0]rt_E;
	wire [4:0]rd_E;
	wire [5:0]func_E;
	wire [5:0]op_E;
	
	wire lui_M;
	wire jal_M;
	wire addu_M;
	wire subu_M;
	wire ori_M;
	wire [4:0]rs_M;
	wire [4:0]rt_M;
	wire [4:0]rd_M;
	wire [5:0]func_M;
	wire [5:0]op_M;
	
	wire jal_W;
	wire addu_W;
	wire subu_W;
	wire ori_W;
	wire lui_W;
	wire lw_W;
	wire [4:0]rs_W;
	wire [4:0]rt_W;
	wire [4:0]rd_W;
	wire [5:0]func_W;
	wire [5:0]op_W;
	
	assign op = IR[31:26];
	assign func = IR[5:0];
	assign rs = IR[25:21];
	assign rt = IR[20:16];
	assign rd = IR[15:11];
	
	assign rs_E = E_IR[25:21];
	assign rt_E = E_IR[20:16];
	assign rd_E = E_IR[15:11];
	assign op_E = E_IR[31:26];
	assign func_E = E_IR[5:0];
	
	assign jal_E = (op_E === 6'b000011);
	assign jalr_E = (op_E === 6'b000000 && func_E === 6'b001001);
	assign lui_E = (op_E === 6'b001111);

	
	assign rs_M = M_IR[25:21];
	assign rt_M = M_IR[20:16];
	assign rd_M = M_IR[15:11];
	assign op_M = M_IR[31:26];
	assign func_M = M_IR[5:0];
	
	assign add_M = (op_M === 6'b000000 && func_M === 6'b100000);
	assign sub_M = (op_M === 6'b000000 && func_M === 6'b100010);
	assign lui_M = (op_M === 6'b001111);
	assign jal_M = (op_M === 6'b000011);
	assign jalr_M = (op_M === 6'b000000 && func_M === 6'b001001);
	assign addu_M = (op_M === 6'b000000 && func_M === 6'b100001) || add_M;
	assign subu_M = (op_M === 6'b000000 && func_M === 6'b100011) || sub_M;
	assign ori_M = (op_M === 6'b001101);
	assign addi_M = (op_M === 6'b001000);
	assign addiu_M = (op_M === 6'b001001) || addi_M;
	assign AND_M = (op_M === 6'b000000 && func_M === 6'b100100);
	assign OR_M = (op_M === 6'b000000 && func_M === 6'b100101);
	assign XOR_M = (op_M === 6'b000000 && func_M === 6'b100110);
	assign NOR_M = (op_M === 6'b000000 && func_M === 6'b100111);	
	assign andi_M = (op_M === 6'b001100);
	assign xori_M = (op_M === 6'b001110);
	assign slt_M = (op_M === 6'b000000 && func_M === 6'b101010);
	assign slti_M = (op_M === 6'b001010);
	assign sltiu_M = (op_M === 6'b001011);
	assign sltu_M = (op_M === 6'b000000 && func_M === 6'b101011);
	assign sll_M = (op_M === 6'b000000 && func_M === 6'b000000);
	assign sllv_M = (op_M === 6'b000000 && func_M  === 6'b000100);	
	assign srl_M = (op_M === 6'b000000 && func_M === 6'b000010);
	assign srlv_M = (op_M === 6'b000000 && func_M === 6'b000110); 
	assign sra_M = (op_M === 6'b000000 && func_M === 6'b000011);
	assign srav_M = (op_M === 6'b000000 && func_M === 6'b000111);
	assign mult_M = (op_M === 6'b000000 && func_M === 6'b011000);
	assign multu_M = (op_M === 6'b000000 && func_M === 6'b011001);
	assign div_M = (op_M === 6'b000000 && func_M === 6'b011010);
	assign divu_M = (op_M === 6'b000000 && func_M === 6'b011011);
	assign mtlo_M = (op_M === 6'b000000 && func_M === 6'b010011);
	assign mthi_M = (op_M === 6'b000000 && func_M === 6'b010001);
	assign mflo_M = (op_M === 6'b000000 && func_M === 6'b010010);
	assign mfhi_M = (op_M === 6'b000000 && func_M === 6'b010000);
	assign msub_M = (op_M === 6'b011100 && func_M === 6'b000100);	

	assign rs_W = W_IR[25:21];
	assign rt_W = W_IR[20:16];
	assign rd_W = W_IR[15:11];
	assign op_W = W_IR[31:26];
	assign func_W = W_IR[5:0];
	
	assign add_W = (op_W === 6'b000000 && func_W === 6'b100000);
	assign sub_W = (op_W === 6'b000000 && func_W === 6'b100010);
	assign lui_W = (op_W === 6'b001111);
	assign jal_W = (op_W === 6'b000011);
	assign jalr_W = (op_W === 6'b000000 && func_W === 6'b001001);
	assign addu_W = (op_W === 6'b000000 && func_W === 6'b100001) || add_W;
	assign subu_W = (op_W === 6'b000000 && func_W === 6'b100011) || sub_W;
	assign ori_W = (op_W=== 6'b001101);
	assign lw_W = (op_W === 6'b100011);
	assign lh_W = (op_W === 6'b100001);
	assign lb_W = (op_W === 6'b100000);
	assign lhu_W = (op_W === 6'b100101);
	assign lbu_W = (op_W === 6'b100100);
	assign addi_W = (op_W === 6'b001000);	
	assign addiu_W = (op_W === 6'b001001) || addi_W;
	assign AND_W = (op_W === 6'b000000 && func_W === 6'b100100);
	assign OR_W = (op_W === 6'b000000 && func_W === 6'b100101);
	assign XOR_W = (op_W === 6'b000000 && func_W === 6'b100110);
	assign NOR_W = (op_W === 6'b000000 && func_W === 6'b100111);
	assign andi_W = (op_W === 6'b001100);
	assign xori_W = (op_W === 6'b001110);
	assign slt_W = (op_W === 6'b000000 && func_W === 6'b101010);
	assign slti_W = (op_W === 6'b001010);
	assign sltiu_W = (op_W === 6'b001011);
	assign sltu_W = (op_W === 6'b000000 && func_W === 6'b101011);
	assign sll_W = (op_W === 6'b000000 && func_W === 6'b000000);
	assign sllv_W = (op_W === 6'b000000 && func_W  === 6'b000100);	
	assign srl_W = (op_W === 6'b000000 && func_W === 6'b000010);
	assign srlv_W = (op_W === 6'b000000 && func_W === 6'b000110);
	assign sra_W = (op_W === 6'b000000 && func_W === 6'b000011);
	assign srav_W = (op_W === 6'b000000 && func_W === 6'b000111);
	assign mult_W = (op_W === 6'b000000 && func_W === 6'b011000);
	assign multu_W = (op_W === 6'b000000 && func_W === 6'b011001);
	assign div_W = (op_W === 6'b000000 && func_W === 6'b011010);
	assign divu_W = (op_W === 6'b000000 && func_W === 6'b011011);
	assign mtlo_W = (op_W === 6'b000000 && func_W === 6'b010011);
	assign mthi_W = (op_W === 6'b000000 && func_W === 6'b010001);
	assign mflo_W = (op_W === 6'b000000 && func_W === 6'b010010);
	assign mfhi_W = (op_W === 6'b000000 && func_W === 6'b010000);
	assign msub_W = (op_W === 6'b011100 && func_W === 6'b000100);	
	
	assign add = (op === 6'b000000 && func === 6'b100000);
	assign sub = (op === 6'b000000 && func === 6'b100010);
	assign addu = (op === 6'b000000 && func === 6'b100001) || add;
	assign subu = (op === 6'b000000 && func === 6'b100011) || sub;
	assign addi = (op === 6'b001000);
	assign addiu = (op === 6'b001001) || addi;
	assign ori = (op === 6'b001101); 
	assign lw = (op === 6'b100011);
	assign lh = (op === 6'b100001);
	assign lb = (op === 6'b100000);
	assign lhu = (op === 6'b100101);
	assign lbu = (op === 6'b100100);
	assign sw = (op === 6'b101011);
	assign lui = (op === 6'b001111);
	assign j = (op === 6'b000010);
	assign jal = (op === 6'b000011);
	assign jr = (op === 6'b000000 && func === 6'b001000);
	assign jalr = (op === 6'b000000 && func === 6'b001001);
	assign sb = (op === 6'b101000);
	assign sh = (op === 6'b101001);
	assign AND = (op === 6'b000000 && func === 6'b100100);
	assign OR = (op === 6'b000000 && func === 6'b100101);
	assign XOR = (op === 6'b000000 && func === 6'b100110);
	assign NOR = (op === 6'b000000 && func === 6'b100111);
	assign andi = (op === 6'b001100);
	assign xori = (op === 6'b001110);
	assign beq = (op === 6'b000100);	
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
	assign msub = (op === 6'b011100 && func === 6'b000100);
	
	assign start = msub | mult | multu | div | divu;
	assign alupro_op[3] = msub | mfhi;
	assign alupro_op[2] = divu | mtlo | mthi | mflo;
	assign alupro_op[1] = multu | div | mthi | mflo;
	assign alupro_op[0] = msub | mult | div | mtlo | mflo;
	assign save_sel[0] = sh;
	assign save_sel[1] = sb;
	assign load_sel[0] = lh | lhu;
	assign load_sel[1] = lb | lhu;
	assign load_sel[2] = lbu;
	assign b[0] = blez | bgez | beq;
	assign b[1] = bltz | bgez | bne;
	assign b[2] = bltz | bgtz | blez;
	assign RegWrite = mflo | mfhi | sra | srav | srlv | srl | sllv | sll | slt | slti | sltiu | sltu | xori | andi | NOR | XOR | OR | AND | addiu | addu | subu | ori | lw | lh | lb | lhu | lbu | lui | jal |jalr;
	assign MemRead = lw | lh | lb | lhu | lbu;
	assign MemWrite = sw | sh | sb;
	assign IMMsel_rs = sra | srl | sll;
	assign IMMsel[2] = 0;
	assign IMMsel[1] = xori | andi | ori | lui;
	assign IMMsel[0] = slti | sltiu | addiu | lw | lh | lb | lhu | lbu | lui | sw | sh | sb;
	assign PCsel[2] = 0;
	assign PCsel[1] = j | jal | jr | jalr;
	assign PCsel[0] = bne | bgez | bgtz | blez | bltz | beq | jr | jalr;
	assign ALUop[3] = sra | srav | srlv | srl | sllv | sll;
	assign ALUop[2] = sltiu | sltu | slti | slt | NOR | subu | beq;
	assign ALUop[1] = sra | srav | sltiu | sltu | xori | XOR | addiu | addu | subu | lw | lh | lb | lhu | lbu | sw | sh | sb | lui | beq | j | jal | jr | jalr;
	assign ALUop[0] = srlv | srl | sltiu | sltu | slti | slt | xori | XOR | ori | OR;
	assign mul_A3[1] = jal;
	assign mul_A3[0] = mflo | mfhi | sra | srav | srlv | srl | sllv | sll | slt | sltu | NOR | XOR | OR | AND | addu | subu | jalr;
	assign mul_WD[1] = jal | jalr;
	assign mul_WD[0] = mflo | mfhi | sra | srav | srlv | srl | sllv | sll | slt | slti | sltiu | sltu | xori | andi | NOR | XOR | OR | AND | addiu | addu | subu | ori | sw | sh | sb | lui | beq | j | jr ;
	
	assign D1 = (beq || bne || bgez || bgtz || blez || bltz || jr || jalr);
	assign z_D_rs = (D1 && jal_E && (rs === 31) && (rs !== 0))?1 :
						(D1 && jalr_E && (rs === rd_E) && (rs !== 0))?1 :
						(D1 && lui_E && (rs === rt_E) && (rs !== 0))?2 :
						(D1 && jal_M && (rs === 31) && (rs !== 0))?3 :
						(D1 && jalr_M && (rs === rd_M) && (rs !== 0))?3 :
						(D1 && (slti_M || sltiu_M || xori_M || andi_M || addiu_M || lui_M || ori_M)&& (rs === rt_M) && (rs !== 0))?4 :
						(D1 && (mfhi_M || mflo_M || srav_M || sra_M || srlv_M || srl_M || sllv_M || sll_M || slt_M || sltu_M || NOR_M || XOR_M || OR_M || AND_M || addu_M || subu_M) && (rs === rd_M) && (rs !== 0))?4 : 0;
						
	assign D2 = (beq || bne);	
	assign z_D_rt = (D2 && jal_E && (rt === 31) && (rt !== 0))?1 :
						(D2 && jalr_E && (rt === rd_E) && (rt !== 0))?1 :
						(D2 && lui_E && (rt === rt_E) && (rt !== 0))?2 :
						(D2 && jal_M && (rt === 31) && (rt !== 0))?3 :
						(D2 && jalr_M && (rt === rd_M) && (rt !== 0))?3 :
						(D2 && (slti_M || sltiu_M || xori_M || andi_M || addiu_M || lui_M || ori_M) && (rt === rt_M) && (rt !== 0))?4 :
						(D2 && (mfhi_M || mflo_M || srav_M || sra_M || srlv_M || srl_M || sllv_M || sll_M || slt_M || sltu_M || NOR_M || XOR_M || OR_M || AND_M || addu_M || subu_M) && (rt === rd_M) && (rt !== 0))?4 : 0;
	
	assign E1 =  (msub || mthi || mtlo ||mult || multu || div || divu || srav || srlv || sllv || slt || slti || sltiu || sltu || xori || andi || NOR || XOR || OR || AND || addu || subu || ori || lw || lh || lhu || lb || lbu || sw || sh || sb || addiu);	
	assign z_E_rs = (E1 && jal_M && (rs === 31) && (rs !== 0))?1 :
						(E1 && jalr_M && (rs === rd_M) && (rs !== 0))?1 :
						(E1 && (slti_M || sltiu_M || xori_M || andi_M || addiu_M || lui_M || ori_M) && (rs === rt_M) && (rs !== 0))?2 :
						(E1 && (mfhi_M || mflo_M || srav_M || sra_M || srlv_M || srl_M || sllv_M || sll_M || slt_M || sltu_M || NOR_M || XOR_M || OR_M || AND_M || addu_M || subu_M) && (rs === rd_M) && (rs !== 0))?2 :
						(E1 && jal_W && (rs === 31) && (rs !== 0))?3 :
						(E1 && (mfhi_W || mflo_W || srav_W || sra_W || srlv_W || srl_W || sllv_W || sll_W || slt_W || sltu_W || NOR_W || XOR_W || OR_W || AND_W || addu_W || subu_W || jalr_W) && (rs === rd_W) && (rs !== 0))?3 :
						(E1 && (slti_W || sltiu_W || xori_W || andi_W || addiu_W || ori_W || lui_W || lw_W || lb_W || lh_W || lbu_W || lhu_W) && (rs === rt_W) && (rs !== 0))?3: 0;						
	
	assign E2 = (msub || mult || multu || div || divu || srav || sra || srlv || srl || sllv || sll || slt || sltu || NOR || XOR || OR || AND || addu || subu || sw || sh || sb);
	assign z_E_rt = (E2 && jal_M && (rt === 31) && (rt !== 0))?1 :
						(E2 && jalr_M && (rt === rd_M) && (rt !== 0))?1 :
						(E2 && (slti_M || sltiu_M || xori_M || andi_M || addiu_M || lui_M || ori_M) && (rt === rt_M) && (rt !== 0))?2 :
						(E2 && (mfhi_M || mflo_M || srav_M || sra_M || srlv_M || srl_M || sllv_M || sll_M || slt_M || sltu_M || NOR_M || XOR_M || OR_M || AND_M || addu_M || subu_M) && (rt === rd_M) && (rt !== 0))?2 :
						(E2 && jal_W && (rt === 31) && (rt !== 0))?3 :
						(E2 && (mfhi_W || mflo_W || srav_W || sra_W || srlv_W || srl_W || sllv_W || sll_W || slt_W || sltu_W || NOR_W || XOR_W || OR_W || AND_W || addu_W || subu_W || jalr_W) && (rt === rd_W) && (rt !== 0))?3 :
						(E2 && (slti_W || sltiu_W || xori_W || andi_W || addiu_W || ori_W || lui_W || lw_W || lb_W || lh_W || lbu_W || lhu_W) && (rt === rt_W) && (rt !== 0))?3: 0;
						
	assign M2 = (sw || sh || sb);
	assign z_M_rt = (M2 && jal_W && (rt === 31) && (rt !== 0))?1:
						(M2 && (mfhi_W || mflo_W || srav_W || sra_W || srlv_W || srl_W || sllv_W || sll_W || slt_W || sltu_W || NOR_W || XOR_W || OR_W || AND_W || addu_W || subu_W || jalr_W) && (rt === rd_W) && (rt !== 0))?1 :
						(M2 && (slti_W || sltiu_W || xori_W || andi_W || addiu_W || ori_W || lui_W || lw_W || lb_W || lh_W || lbu_W || lhu_W) && (rt === rt_W) && (rt !== 0))?1: 0;
	
	
	endmodule
