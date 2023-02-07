`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:12:44 12/21/2019 
// Design Name: 
// Module Name:    grf 
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
module grf(
    input [4:0] A1,
    input [4:0] A2,
    input [4:0] A3,
    input [31:0] WD,
    input [31:0] pc,
    input clk,
    input reset,
    input regwrite,
    output [31:0] data1,
    output [31:0] data2
    );
	reg[31:0]grf[31:0];
	
	integer i;
	initial
		begin
			for(i = 0;i<32;i = i+1)
				begin
					grf[i]<=0;
				end
		end
	
	always@(posedge clk)
		begin
			if(reset)
				begin
					for(i = 0;i<32;i = i+1)
						grf[i]<=0;
				end
			else
				begin
					if(regwrite&&A3!==0)
						begin
							grf[A3]<=WD;
							$display("%d@%h: $%d <= %h", $time ,pc, A3,WD);
						end
				end
		end
		
	assign data1 = (regwrite && (A1 === A3) && (A3!=0))? WD : grf[A1];
	assign data2 = (regwrite && (A2 === A3) && (A3!=0))? WD : grf[A2];
	
endmodule
