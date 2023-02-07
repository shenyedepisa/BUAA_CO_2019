`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:01:26 07/29/2020 
// Design Name: 
// Module Name:    alupro 
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
module alupro(
	input clk,
	input reset,
	input start,
	//input RDsel,
	input [31:0] alu1,
	input [31:0] alu2,
	input [3:0] op,
	output [31:0] out,
	output reg alubusy = 0
    );
	 
	reg [31:0] LO = 0;
	reg [31:0] HI = 0;
	reg [31:0] temp1 = 0;
	reg [31:0] temp2 = 0;
	reg [31:0] temp3 = 0;
	reg [31:0] temp4 = 0;	
	
	initial begin
		LO <= 0;
		HI <= 0;
	end
	
	integer mult_cnt = 0;
	integer div_cnt = 0; 
	
	assign out = (op === 7) ? LO : HI;					//mflo, mfhi
	
	always @(posedge clk) 
	begin
		if (reset) 
			begin
				alubusy <= 0;
				HI <= 0;
				LO <= 0;
				mult_cnt <= 0;
				div_cnt <= 0;
			end
		else 
			begin
				if(op === 1)//mult
					{HI, LO} <= $signed(alu1) * $signed(alu2);		
				if(op === 2)//multu
					{HI, LO} <= alu1 * alu2;								
				if(op === 3)//div
					begin
						if (alu2 != 0) 
							begin								
								LO <= $signed(alu1) / $signed(alu2);
								HI <= $signed(alu1) % $signed(alu2);
							end
					end
				if(op === 4)//divu
					begin
						if (alu2 != 0) 
							begin								
								LO <= alu1 / alu2;
								HI <= alu1 % alu2;
							end
					end
				if(op === 5)//mtlo
					LO <= alu1;											
				if(op === 6)// mthi
					HI <= alu1;	
				if(op === 9)//msub
					begin
						{temp2,temp1} = $signed(alu1) * $signed(alu2);
						{temp4,temp3} = {HI,LO} - {temp2,temp1};
						HI = temp4;
						LO = temp3;
					end
				
				if (start) 
					begin
						if (op === 1 || op === 2 || op === 9) 
							begin
								alubusy <= 1;
								mult_cnt <= 1;
							end
						else if (op === 3 || op === 4) 
							begin
								alubusy <= 1;
								div_cnt <= 1;
							end
					end
				else 
					begin
						if (mult_cnt === 5) 
							begin
								alubusy <= 0;
								mult_cnt <= 0;
							end
						else if (div_cnt === 10) 
							begin
								alubusy <= 0;
								div_cnt <= 0;
							end
						else if (mult_cnt != 0)
							mult_cnt <= mult_cnt + 1;
						else if (div_cnt != 0)
							div_cnt <= div_cnt + 1;
					end
			end
	end

endmodule
