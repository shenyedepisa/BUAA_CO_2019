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
    output  stop
    );
    
	wire [5:0] op;
	wire [5:0] func;
	wire [4:0] rs;
	wire [4:0] rt;
	
	wire lw_E;
	wire addu_E;
	wire subu_E;
	wire ori_E;
	wire [4:0]rt_E;
	wire [4:0]rd_E;

	wire lw_M;
	wire [4:0]rt_M;
	
	wire addu;
	wire subu;
	wire ori;
	wire lw;
	wire sw;
	wire beq;
	wire jr;
	wire bgezalr;
	
	assign op = IR[31:26];
	assign func = IR[5:0];
	assign rs = IR[25:21];
	assign rt = IR[20:16];
	assign rt_E = IR_E[20:16];
	assign rd_E = IR_E[15:11];
	assign rt_M = IR_M[20:16];
	
	assign bgezalr = (op === 6'b111111 && func === 6'b000000);
	
	assign addu = (op === 6'b000000 && func === 6'b100001);
	assign subu = (op === 6'b000000 && func === 6'b100011);
	assign ori = (op === 6'b001101);
	assign lw = (op === 6'b100011);
	assign sw = (op === 6'b101011);
	assign beq = (op === 6'b000100);
	assign jr = (op === 6'b000000 && func === 6'b001000);

	
	assign lw_E = (IR_E[31:26] === 6'b100011);
	assign addu_E = (IR_E[31:26] === 6'b000000 && IR_E[5:0] === 6'b100001);
	assign subu_E = (IR_E[31:26] === 6'b000000 && IR_E[5:0] === 6'b100011);
	assign ori_E = (IR_E[31:26] === 6'b001101);
	
	assign lw_M = (IR_M[31:26] === 6'b100011);
	
	assign s1 = ((sw || lw) && lw_E && (rs === rt_E) && (rs !== 0));
	assign s2 = ((addu || subu) && lw_E && (rs === rt_E) && (rs !== 0));
	assign s3 = ((addu || subu) && lw_E && (rt === rt_E) && (rt !== 0));
	assign s4 = (ori && lw_E && (rs === rt_E) && (rs !== 0));
	assign s5 = ((beq||bgezalr) && ((lw_E && (rs === rt_E) && (rs !== 0))|| 
					(addu_E && (rs === rd_E) && (rs !== 0)) ||
					(subu_E && (rs === rd_E) && (rs !== 0)) ||
					(ori_E && (rs === rt_E) && (rs !== 0)) ||
					(lw_M && (rs === rt_M) && (rs !== 0))));
	assign s6 = ((beq||bgezalr) && ((lw_E && (rt === rt_E) && (rt !== 0)) || 
					(addu_E && (rt === rd_E) && (rt !== 0)) ||
					(subu_E && (rt === rd_E) && (rt !== 0)) ||
					(ori_E && (rt === rt_E) && (rt !== 0)) ||
					(lw_M && (rt === rt_M) && (rt !== 0))));
	assign s7 = (jr &&((lw_E && (rs === rt_E) && (rs !== 0))|| 
					(addu_E && (rs === rd_E) && (rs !== 0)) ||
					(subu_E && (rs === rd_E) && (rs !== 0)) ||
					(ori_E && (rs === rt_E) && (rs !== 0)) ||
					(lw_M && (rs === rt_M) && (rs !== 0))));
							
	assign stop = s1 || s2 || s3 || s4 || s5 || s6 || s7;
	
endmodule
