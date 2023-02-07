`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:58:51 12/23/2019 
// Design Name: 
// Module Name:    W 
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
module W(
    input [31:0] IR,
    input [31:0] pc,
    input [31:0] pc4,
    input [31:0] ALUout,
    input [31:0] DMout,
    output [31:0] WD_W,
    output [4:0] addr_W,
    output RegWrite_W
    );
    
    wire [1:0]mul_A3;
    wire [1:0]mul_WD;
    
    assign WD_W = (mul_WD === 0)?DMout :
						(mul_WD === 1)?ALUout :pc4+4 ;
    
    assign addr_W = (mul_A3 === 0)?IR[20:16] :
						(mul_A3 === 1)?IR[15:11] : 31;
						
controller W_controller(
	.IR(IR),
    .D_IR(),
    .E_IR(),
    .M_IR(),
    .W_IR(IR),
    .isbeq(),
    .RegWrite(RegWrite_W),
    .MemRead(),
    .MemWrite(),
    .IMMsel(),
    .PCsel(),
    .ALUop(),
    .mul_A3(mul_A3),
    .mul_WD(mul_WD),
    .z_D_rs(),
    .z_D_rt(),
    .z_E_rs(),
    .z_E_rt(),
    .z_M_rt()
    );

endmodule
