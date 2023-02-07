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
	 input [1:0]save_sel,
    output [31:0] readdata
    );
	 
	reg[31:0]RAM[0:4095];
	integer i;
	
	assign address1 = (address[1] === 1);
	assign address0 = (address[0] === 1);
	
	initial
		begin
			for(i = 0;i<4096;i = i+1)
				RAM[i] <=0;
		end
		
		wire [31:0]datain_sh;
		wire [31:0]datain_sb;
		assign datain_sh = (address1)? {writedata[15:0],RAM[address[13:2]][15:0]}:{RAM[address[13:2]][31:16],writedata[15:0]};
		assign datain_sb = (~address1 && ~address0)?{RAM[address[13:2]][31:8],writedata[7:0]}:
								(~address1 && address0)?{RAM[address[13:2]][31:16],writedata[7:0],RAM[address[13:2]][7:0]}:
								(address1 && ~address0)?{RAM[address[13:2]][31:24],writedata[7:0],RAM[address[13:2]][15:0]}:{writedata[7:0],RAM[address[13:2]][23:0]};
	
	always@(posedge clk)
		begin
			if(reset)
				begin
					for(i = 0;i<4096;i = i+1)
						RAM[i] <=0;
				end
			else
				begin
					if(memWrite)
						begin
							if(save_sel === 1)//sh
								begin
									if(address1)//1
										begin
											RAM[address[13:2]][31:16] <= writedata[15:0];
											$display("%d@%h: *%h <= %h",$time,pc, {address[31:2],2'b00},datain_sh);
										end
									else //(address[1] === 0)
										begin
											RAM[address[13:2]][15:0] <= writedata[15:0];
											$display("%d@%h: *%h <= %h",$time,pc, {address[31:2],2'b00},datain_sh);
										end
								end
							else if(save_sel === 2)//sb
								begin
									if(~address1 && ~address0)//(00)
										begin
											RAM[address[13:2]][7:0] <= writedata[7:0];
											$display("%d@%h: *%h <= %h",$time,pc, {address[31:2],2'b00},datain_sb);
										end
									else  if(~address1 && address0)//(01)
										begin
											RAM[address[13:2]][15:8] <= writedata[7:0];
											$display("%d@%h: *%h <= %h",$time,pc, {address[31:2],2'b00},datain_sb);
										end
									else  if(address1 && ~address0)//(10)
										begin
											RAM[address[13:2]][23:16] <= writedata[7:0];
											$display("%d@%h: *%h <= %h",$time,pc, {address[31:2],2'b00},datain_sb);
										end
									else //11
										begin
											RAM[address[13:2]][31:24] <= writedata[7:0];
											$display("%d@%h: *%h <= %h",$time,pc, {address[31:2],2'b00},datain_sb);
										end
								end
							else//sw
								begin
									RAM[address[13:2]] <= writedata;
									$display("%d@%h: *%h <= %h",$time,pc, address, writedata);
								end
						end
				end
			end
			
	assign readdata = RAM[address[13:2]];
	
endmodule
