`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:49:45 11/27/2019 
// Design Name: 
// Module Name:    DM 
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
module DM(
    input clk,
    input reset,
    input memRead,
    input memWrite,
    input [31:0] pc,
    input [31:0] writedata,
    input [31:0] address,
    output [31:0] readdata
    );
	reg[31:0]RAM[0:1023];
	integer i;
	initial
		begin
			for(i = 0;i<1024;i = i+1)
				RAM[i] <=0;
		end
	
	always@(posedge clk)
		begin
			if(reset)
				begin
					for(i = 0;i<1024;i = i+1)
						RAM[i] <=0;
				end
			else
				begin
				if(memWrite)
					begin
						RAM[address[11:2]] <= writedata;
						$display("@%h: *%h <= %h",pc, address, writedata);
					end
				end
			end
	assign readdata = RAM[address[11:2]];
endmodule
