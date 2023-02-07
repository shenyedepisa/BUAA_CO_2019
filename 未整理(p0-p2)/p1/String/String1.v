`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:28:11 10/30/2019 
// Design Name: 
// Module Name:    String1 
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
    input [7:0] in,
    output reg out = 0
    );
	reg [1:0] S = 0;
	always @ (*)
	begin
		if(clr == 1)
		begin
			S = 0;
			out= 0;
		end
	end
	always @ (posedge clk) 
	begin
		case(S)
			0:begin
				if(in >= 48 && in <=57)begin
					S <= 1;
					out <= 1;
				end
				else begin
					S <= 3;
					out <= 0;
				end
			end
			1:begin
				if(in >= 42 && in <=43)begin
					S <= 2;
					out <= 0;
				end
				else begin
					S <= 3;
					out <= 0;
				end
			end
			2:begin
				if(in >= 42 && in <=57)begin
					S <= 1;
					out <= 1;
				end
				else begin
					S <= 3;
					out <= 0;
				end
			end
		endcase
	end
endmodule
