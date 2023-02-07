`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:45:27 12/23/2019 
// Design Name: 
// Module Name:    M_W 
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
module M_W(
    input [31:0] IR,
    input [31:0] pc,
    input [31:0] pc4,
    input [31:0] ALUout,
    input [31:0] DMout,
    input clk,
    input reset,
    output reg[31:0] IR_W,
    output reg[31:0] pc_W,
    output reg[31:0] pc4_W,
    output reg[31:0] ALUout_W,
    output reg[31:0] DMout_W
    );
    always@(posedge clk)
		begin
			if(reset)
				begin
					IR_W <= 0;
					pc_W <= 0;
					pc4_W <= 0;
					ALUout_W <= 0;
					DMout_W <= 0;
				end
			else
				begin
					IR_W <= IR;
					pc_W <= pc;
					pc4_W <= pc4;
					ALUout_W <= ALUout;
					DMout_W <= DMout;
				end
		end

endmodule
