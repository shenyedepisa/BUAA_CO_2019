`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:17:06 10/31/2019 
// Design Name: 
// Module Name:    code 
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
module code(
    input Clk,
    input Reset,
    input Slt,
    input En,
    output reg[63:0] Output0,
    output reg[63:0] Output1
    );
    reg [1:0]temp  = 0;
    initial
    begin
		Output0 <= 0;
		Output1 <= 0;
    end
always @(posedge Clk)
begin
	if(Reset ==  1)
	begin
		Output0 <= 0;
		Output1 <= 0;
		temp <= 0;
	end
	else if(En == 1)
	begin
		if(Slt == 0)
		begin
			Output0 <= Output0 + 1;
			temp <= 0;
		end
		else
		begin
			if(temp == 0)
				temp <= 1;
			else if(temp == 1)
				temp <= 2;
			else if (temp == 2)
				temp <= 3;
			else if(temp == 3)
			begin
				temp <= 0;
				Output1<= Output1+1;
			end
		end
	end
end

endmodule
