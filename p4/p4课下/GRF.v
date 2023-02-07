`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:43:05 11/27/2019 
// Design Name: 
// Module Name:    GRF 
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
module GRF(
    input [4:0] RS,
    input [4:0] RT,
    input [4:0] RD,
    input [31:0] WD,
    input [31:0] WPC,
    input CLK,
    input Reset,
    input RegWrite,
    output [31:0] data1,
    output [31:0] data2
    );
	reg [31:0] grf[31:0];
	
	integer i;
	initial
		begin
			for(i = 0;i<32;i = i+1)
				begin
					grf[i]<=0;
				end
		end
	always@(posedge CLK)
	begin
		if(Reset)
			begin
				for(i = 0;i<32;i = i+1)
					grf[i]<=0;
			end
		else
			begin
				if(RegWrite&&RD!=0)
				begin
					grf[RD]<=WD;
					$display("@%h: $%d <= %h", WPC, RD,WD);
				end
			end
	end
	
	assign	data1 = grf[RS];
	assign	data2 = grf[RT];
	
endmodule
