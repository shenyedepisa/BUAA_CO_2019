`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:47:43 07/22/2020 
// Design Name: 
// Module Name:    clz 
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
module clz(
    input [31:0] A,
    output reg [31:0] clzout
    );
	
	
	integer i = 0;
	integer flag = 0;
	
	always @ *
	begin
		flag = 0;
		for(i = 31;i >= 0; i = i - 1)
		begin
			if(A[i] == 1 && flag == 0)
				begin
					clzout = 31 - i;
					flag = 1;
				end
		end
		if(flag == 0)
			begin
				clzout = 32;
			end
	end
	
endmodule
