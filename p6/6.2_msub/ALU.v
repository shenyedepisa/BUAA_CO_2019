`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:16:24 12/23/2019 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input [31:0] alu1,
    input [31:0] alu2,
    input [3:0] ALUop,
    output [31:0] aluout
    );

	 assign small_zero = (alu1 < alu2) ? 1 : 0;
	 assign small_sign = (($signed(alu1)) < ($signed(alu2))) ? 1 : 0;

assign aluout = (ALUop === 0) ? alu1 & alu2:
					(ALUop === 1) ? alu1 | alu2:
					(ALUop === 2) ? alu1 + alu2:
					(ALUop === 3) ? alu1 ^ alu2:
					(ALUop === 4) ? ~(alu1 | alu2):
					(ALUop === 5) ? small_sign:
					(ALUop === 6) ? alu1 - alu2:
					(ALUop === 7) ? small_zero:
					(ALUop === 8) ? alu2 << alu1[4:0]:
					(ALUop === 9) ? alu2 >> alu1[4:0]: ( {32{alu2[31]}} << ( 6'd32 - {1'b0, alu1[4:0]} ) ) | ( alu2 >> alu1[4:0] );
				
//shiftres[31:0] = ( {32{alu2[31]}} << ( 6'd32 - {1'b0, alu1[4:0]} ) ) | ( alu2 >> alu1[4:0] ) ;
//shiftres[31:0] =  ( { {31{reg2_i}}, 1'b0 } << (~reg1_i[4:0]) ) | ( reg2_i >> reg1_i[4:0] ) ;

endmodule
