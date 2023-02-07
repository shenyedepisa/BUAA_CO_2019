`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:37:21 12/23/2019 
// Design Name: 
// Module Name:    E_M 
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
module E_M(
    input [31:0] ALUout,
    input [31:0] data2,
    input [31:0] IR,
    input [31:0] pc,
    input [31:0] pc4,
    input clk,
    input reset,
    output reg[31:0] ALUout_M,
    output reg[31:0] data2_M,
    output reg[31:0] IR_M,
    output reg[31:0] pc_M,
    output reg[31:0] pc4_M
    );

    always@(posedge clk)
		begin
			if(reset)
				begin
					ALUout_M <= 0;
					data2_M <= 0;
					IR_M <= 0;
					pc_M <= 0;
					pc4_M <= 0;
				end
			else
				begin
					ALUout_M <= ALUout;
					data2_M <= data2;
					IR_M <= IR;
					pc_M <= pc;
					pc4_M <= pc4;
				end
		end
endmodule
