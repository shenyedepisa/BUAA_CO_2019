`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:35:05 12/22/2019 
// Design Name: 
// Module Name:    F_D 
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
module F_D(
    input [31:0] IR,
    input [31:0] PC,
    input [31:0] PC4,
    input clk,
    input reset,
    input stop,
    output reg[31:0] IR_D,
    output reg[31:0] PC_D,
    output reg[31:0] PC4_D
    );
	always@(posedge clk)
 		begin
			if(reset)
				begin
					IR_D <= 0;
					PC4_D <= 0;
					PC_D <= 0;
				end
			else if(stop)
				begin

				end
			else
				begin
					IR_D <= IR;
					PC4_D <= PC4;
					PC_D <= PC;
				end
		end

endmodule
