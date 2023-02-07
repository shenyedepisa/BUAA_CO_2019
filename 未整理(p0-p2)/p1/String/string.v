`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:37:34 10/30/2019 
// Design Name: 
// Module Name:    string 
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
module string(
	input clk,
	input clr,
	input [7:0]in,
	output reg out
    );
	 reg [1:0]zz = 0;
always@(posedge clr or posedge clk)
	begin
	if(clr)
		begin
			zz <= 0;
			out <= 0;
		end
	else if(zz === 0)
		begin
			if(in >= 48 && in <= 57)
				begin
					zz <= 1;
					out <= 1;
				end
			else
				begin
					zz <= 3;
					out <= 0;
				end
		end
	else if(zz === 1)
		begin
			if(in === 42 || in === 43)
				begin
					zz <= 2;
					out <= 0;
				end
			else
				begin
					zz <= 3;
					out <= 0;
				end
		end
	else if(zz === 2)
		begin
			if(in >= 48 && in <= 57)
				begin
					zz <= 1;
					out <= 1;
				end
			else
				begin
					zz <= 3;
					out <= 0;
				end
		end	
	else if(zz === 3)
		begin
			zz <= 3;
			out <= 0;
		end
	end
endmodule
