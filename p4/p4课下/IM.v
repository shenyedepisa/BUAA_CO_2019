`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:29:50 11/27/2019 
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
    output [31:0] mipsop
    );
    reg[31:0]ROM[0:1023];
    
    initial
	begin
		$readmemh("code.txt",ROM);
	end
	
	assign mipsop = ROM[address[11:2]];

endmodule
