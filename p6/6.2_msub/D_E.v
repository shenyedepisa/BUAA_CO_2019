`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:10:56 12/22/2019 
// Design Name: 
// Module Name:    D_E 
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
module D_E(
    input clk,
    input reset,
    input [31:0] RD1,
    input [31:0] RD2,
    input [31:0] sign_ext,
    input [31:0] ext_0,
    input [31:0] high,
    input [31:0] pc,
    input [31:0] pc4,
    input [31:0] IR,
    output reg[31:0] RD1_E,
    output reg[31:0] RD2_E,
    output reg[31:0] sign_ext_E,
    output reg[31:0] ext_0_E,
    output reg[31:0] high_E,
    output reg[31:0] pc4_E,
    output reg[31:0] pc_E,
    output reg[31:0] IR_E
    );
    
    always@(posedge clk)
		begin
			if(reset)
				begin
					RD1_E <= 0;
					RD2_E <= 0;
					sign_ext_E <= 0;
					ext_0_E <= 0;
					high_E <= 0;
					pc_E <= 0;
					pc4_E <= 0;
					IR_E <= 0;
				end
			else
				begin
					RD1_E <= RD1;
					RD2_E <= RD2;
					sign_ext_E <= sign_ext;
					ext_0_E <= ext_0;
					high_E <= high;
					pc_E <= pc;
					pc4_E <= pc4;
					IR_E <= IR;
				end
		end
    
endmodule
