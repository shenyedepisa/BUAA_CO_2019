`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:44:51 11/27/2019 
// Design Name: 
// Module Name:    nPC 
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
module nPC(
	input [31:0] pc4,
	input [31:0] shift2,
	input [31:0] Rdata1,
	input [1:0] pcsrc,
	input branch,
	input equal,
	input clk,
	input reset,
	input blez,////////////////////////////////////////////////////////////////////////
	input istiaozhuan,	///////////////////////////////////////////////////////////
	output reg[31:0] Nextpc=32'h3000
    );
   				
    always@(posedge clk)
	begin
		if(reset)
			Nextpc <= 32'h3000;
		else
			begin
			//Nextpc <= Insrc;
				if(pcsrc === 0)
					Nextpc <= pc4;
				else if(pcsrc === 1)
					begin
						if(equal && branch)
							Nextpc <= pc4 + shift2;
						else if(blez && istiaozhuan)///////////////////////////////////////////////////////
							Nextpc <= pc4 + shift2;////////////////////////////////////////////////////////
						else
							Nextpc <= pc4;
					end
				else if(pcsrc === 2)
					Nextpc<= {pc4[31:28],shift2[27:0]};
				else
					Nextpc <= Rdata1;
			end
	end
	
endmodule
