`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:07:45 10/31/2019
// Design Name:   adder
// Module Name:   D:/xilinx_ISE/add/addertest.v
// Project Name:  add
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module addertest;

	// Inputs
	reg [3:0] A;
	reg [3:0] B;
	reg Clk;
	reg En;

	// Outputs
	wire [3:0] Sum;
	wire Overflow;

	// Instantiate the Unit Under Test (UUT)
	adder uut (
		.A(A), 
		.B(B), 
		.Clk(Clk), 
		.En(En), 
		.Sum(Sum), 
		.Overflow(Overflow)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		Clk = 0;
		En = 0;

		// Wait 100 ns for global reset to finish
		#100;
		En = 1;
		#5;
		En =0;
		#5;
		// Add stimulus here
		
	end
      always #10 Clk <= ~Clk;
endmodule

