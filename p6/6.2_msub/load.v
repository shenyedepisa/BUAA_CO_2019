`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:09:33 07/27/2020 
// Design Name: 
// Module Name:    load 
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
module load(
    input [31:0] data,
    input [31:0] address,
	 input [2:0] load_sel,
    output [31:0] dataout
    );
	wire [31:0]signext_h0;
	wire [31:0]signext_h1;
	wire [31:0]zeroext_h0;
	wire [31:0]zeroext_h1;
	wire [31:0]signext_b0;
	wire [31:0]signext_b1;
	wire [31:0]signext_b2;
	wire [31:0]signext_b3;
	wire [31:0]zeroext_b0;
	wire [31:0]zeroext_b1;
	wire [31:0]zeroext_b2;
	wire [31:0]zeroext_b3;
	 
	 assign address1 = (address[1] === 1);
	 assign address0 = (address[0] === 1);	 
	 
	 assign signext_h0 = (data[15]===1)?{16'b1111111111111111, data[15:0]}:{16'b0000000000000000, data[15:0]};
	 assign signext_h1 = (data[31]===1)?{16'b1111111111111111, data[31:16]}:{16'b0000000000000000, data[31:16]};
	 assign signext_b0 = (data[7]===1)?{24'b111111111111111111111111, data[7:0]}:{24'b000000000000000000000000, data[7:0]};
	 assign signext_b1 = (data[15]===1)?{24'b111111111111111111111111, data[15:8]}:{24'b000000000000000000000000, data[15:8]};
	 assign signext_b2 = (data[23]===1)?{24'b111111111111111111111111, data[23:16]}:{24'b000000000000000000000000, data[23:16]};
	 assign signext_b3 = (data[31]===1)?{24'b111111111111111111111111, data[31:24]}:{24'b000000000000000000000000, data[31:24]};
	 assign zeroext_h0 = {16'b0000000000000000, data[15:0]};
	 assign zeroext_h1 = {16'b0000000000000000, data[31:16]};
	 assign zeroext_b0 = {24'b000000000000000000000000, data[7:0]};	
	 assign zeroext_b1 = {24'b000000000000000000000000, data[15:8]};
	 assign zeroext_b2 = {24'b000000000000000000000000, data[23:16]};
	 assign zeroext_b3 = {24'b000000000000000000000000, data[31:24]};
	 
	 wire [31:0]datalb;
	 wire [31:0]datalh;
	 wire [31:0]datalbu;
	 wire [31:0]datalhu;
	
	 assign datalh = (address1)?signext_h1:signext_h0;
	 assign datalb = (~address1 && ~address0)?signext_b0:
						 (~address1 && address0)?signext_b1:
						 (address1 && ~address0)?signext_b2:signext_b3;
	 assign datalhu = (address1)?zeroext_h1:zeroext_h0;
	 assign datalbu = (~address1 && ~address0)?zeroext_b0:
						 (~address1 && address0)?zeroext_b1:
						 (address1 && ~address0)?zeroext_b2:zeroext_b3;	

	assign dataout = (load_sel === 1)?datalh:
						(load_sel === 2)?datalb:
						(load_sel === 3)?datalhu:
						(load_sel === 4)?datalbu:data;

endmodule
