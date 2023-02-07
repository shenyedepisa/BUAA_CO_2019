`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:20:28 12/21/2019 
// Design Name: 
// Module Name:    IM 
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
module IM(
    input [31:0] address,
    output [31:0] IR
    );
	 
	reg[31:0]ROM[0:4095];

	initial
		begin
			$readmemh("code.txt",ROM);
		end
	
	wire [31:0]Addr = address - 32'h3000;
	assign IR = ROM[Addr[13:2]];
	
endmodule
