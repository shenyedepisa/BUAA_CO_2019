`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:20:43 12/23/2019 
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
	 input issh,
    output [31:0] readdata
    );
	reg[31:0]RAM[0:1023];
	integer i;
	
	assign address1 = address[1] === 1;
	
	initial
		begin
			for(i = 0;i<1024;i = i+1)
				RAM[i] <=0;
		end
		
		wire [31:0]datain;
		assign datain = (address1)? {writedata[15:0],RAM[address[11:2]][15:0]}:{RAM[address[11:2]][31:16],writedata[15:0]};
	
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
							if(issh)
								begin
									if(address1)
										begin
											RAM[address[11:2]][31:16] <= writedata[15:0];
											$display("%d@%h: *%h <= %h",$time,pc, {address[31:2],2'b00},datain);
										end
									else //(address[1] === 0)
										begin
											RAM[address[11:2]][15:0] <= writedata[15:0];
											$display("%d@%h: *%h <= %h",$time,pc, {address[31:2],2'b00},datain);
										end
								end
							else
								begin
									RAM[address[11:2]] <= writedata;
									$display("%d@%h: *%h <= %h",$time,pc, address, writedata);
								end
						end
				end
			end
			
	assign readdata = RAM[address[11:2]];
	
endmodule