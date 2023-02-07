`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:20:23 10/30/2019 
// Design Name: 
// Module Name:    counter 
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
module counter(
    input clk,
    input reset,
    output [3:0] cnt
    );
	reg [3:0]cnt;
	always@(posedge clk,negedge reset)
	begin
	if(!reset)
	cnt<=0;
	else
	cnt<=cnt+1;
	end

endmodule
