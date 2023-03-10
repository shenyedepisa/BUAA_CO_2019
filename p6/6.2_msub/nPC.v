`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:29:01 12/21/2019 
// Design Name: 
// Module Name:    NPC 
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

module NPC(
    input [31:0] pc4,
    input [31:0] rs,
    input [2:0] PCsel,
    input [15:0] imm16,
    input [25:0] imm26,
    input [2:0] b,
	 input [1:0] cmp_zero,
    input stop,
    input clk,
    input reset,
    input equal,
    output reg[31:0] Nextpc= 32'h3000
    );
	wire [31:0]ext26;
	wire [31:0]ext16;
	assign ext16 = (imm16[15]===1)?{14'b11111111111111, imm16, 2'b00}:{14'b00000000000000, imm16, 2'b00};
	assign ext26 = {pc4[31:28], imm26, 2'b00};
	
	always@(posedge clk)
		begin
			if(reset)
				begin
					Nextpc <= 32'h3000;
				end
			else if(stop)////////////////////////////??ͣ
				Nextpc <= pc4-4;
			else
				begin
					if(PCsel === 1)
						begin
							if(equal && b === 1) //beq
								begin
									Nextpc <= pc4 - 4 + ext16;
								end
							if(~equal && b === 1)
								begin
									Nextpc <= pc4;
								end
							if(~equal && b === 2) //bne
								begin
									Nextpc <= pc4 - 4 + ext16;
								end
							if(equal && b === 2)
								begin
									Nextpc <= pc4;
								end
							if((cmp_zero === 0 || cmp_zero === 1) && b === 3) //bgez
								begin
									Nextpc <= pc4 - 4 + ext16;
								end
							if(~(cmp_zero === 0 || cmp_zero === 1) && b === 3)
								begin
									Nextpc <= pc4;
								end
							if(cmp_zero === 1 && b === 4) //bgtz
								begin
									Nextpc <= pc4 - 4 + ext16;
								end
							if(cmp_zero != 1 && b === 4)
								begin
									Nextpc <= pc4;
								end
							if((cmp_zero === 0 || cmp_zero === 2) && b === 5) //blez
								begin
									Nextpc <= pc4 - 4 + ext16;
								end
							if(~(cmp_zero === 0 || cmp_zero === 2) && b === 5) 
								begin
									Nextpc <= pc4;
								end
							if(cmp_zero === 2 && b === 6) //bltz
								begin
									Nextpc <= pc4 - 4 + ext16;
								end
							if(cmp_zero != 2 && b === 6)
								begin
									Nextpc <= pc4;
								end
						end
					else if(PCsel === 2 )
						Nextpc <= ext26;
					else if(PCsel === 3)
						Nextpc <= rs;
					else/////////////(PCsel === 0)
						Nextpc <= pc4;
				end
		end

endmodule
