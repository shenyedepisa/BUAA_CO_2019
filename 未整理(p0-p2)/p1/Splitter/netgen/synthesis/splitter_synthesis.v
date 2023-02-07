////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: splitter_synthesis.v
// /___/   /\     Timestamp: Wed Oct 30 03:42:00 2019
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim splitter.ngc splitter_synthesis.v 
// Device	: xa3s50-4-vqg100
// Input file	: splitter.ngc
// Output file	: D:\xilinx_ISE\Splitter\netgen\synthesis\splitter_synthesis.v
// # of Modules	: 1
// Design Name	: splitter
// Xilinx        : C:\Xilinx\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module splitter (
O1, O2, O3, O4, A
);
  output [7 : 0] O1;
  output [7 : 0] O2;
  output [7 : 0] O3;
  output [7 : 0] O4;
  input [31 : 0] A;
  wire O1_0_OBUF_40;
  wire O1_1_OBUF_41;
  wire O1_2_OBUF_42;
  wire O1_3_OBUF_43;
  wire O1_4_OBUF_44;
  wire O1_5_OBUF_45;
  wire O1_6_OBUF_46;
  wire O1_7_OBUF_47;
  wire O2_0_OBUF_56;
  wire O2_1_OBUF_57;
  wire O2_2_OBUF_58;
  wire O2_3_OBUF_59;
  wire O2_4_OBUF_60;
  wire O2_5_OBUF_61;
  wire O2_6_OBUF_62;
  wire O2_7_OBUF_63;
  wire O3_0_OBUF_72;
  wire O3_1_OBUF_73;
  wire O3_2_OBUF_74;
  wire O3_3_OBUF_75;
  wire O3_4_OBUF_76;
  wire O3_5_OBUF_77;
  wire O3_6_OBUF_78;
  wire O3_7_OBUF_79;
  wire O4_0_OBUF_88;
  wire O4_1_OBUF_89;
  wire O4_2_OBUF_90;
  wire O4_3_OBUF_91;
  wire O4_4_OBUF_92;
  wire O4_5_OBUF_93;
  wire O4_6_OBUF_94;
  wire O4_7_OBUF_95;
  IBUF   A_31_IBUF (
    .I(A[31]),
    .O(O1_7_OBUF_47)
  );
  IBUF   A_30_IBUF (
    .I(A[30]),
    .O(O1_6_OBUF_46)
  );
  IBUF   A_29_IBUF (
    .I(A[29]),
    .O(O1_5_OBUF_45)
  );
  IBUF   A_28_IBUF (
    .I(A[28]),
    .O(O1_4_OBUF_44)
  );
  IBUF   A_27_IBUF (
    .I(A[27]),
    .O(O1_3_OBUF_43)
  );
  IBUF   A_26_IBUF (
    .I(A[26]),
    .O(O1_2_OBUF_42)
  );
  IBUF   A_25_IBUF (
    .I(A[25]),
    .O(O1_1_OBUF_41)
  );
  IBUF   A_24_IBUF (
    .I(A[24]),
    .O(O1_0_OBUF_40)
  );
  IBUF   A_23_IBUF (
    .I(A[23]),
    .O(O2_7_OBUF_63)
  );
  IBUF   A_22_IBUF (
    .I(A[22]),
    .O(O2_6_OBUF_62)
  );
  IBUF   A_21_IBUF (
    .I(A[21]),
    .O(O2_5_OBUF_61)
  );
  IBUF   A_20_IBUF (
    .I(A[20]),
    .O(O2_4_OBUF_60)
  );
  IBUF   A_19_IBUF (
    .I(A[19]),
    .O(O2_3_OBUF_59)
  );
  IBUF   A_18_IBUF (
    .I(A[18]),
    .O(O2_2_OBUF_58)
  );
  IBUF   A_17_IBUF (
    .I(A[17]),
    .O(O2_1_OBUF_57)
  );
  IBUF   A_16_IBUF (
    .I(A[16]),
    .O(O2_0_OBUF_56)
  );
  IBUF   A_15_IBUF (
    .I(A[15]),
    .O(O3_7_OBUF_79)
  );
  IBUF   A_14_IBUF (
    .I(A[14]),
    .O(O3_6_OBUF_78)
  );
  IBUF   A_13_IBUF (
    .I(A[13]),
    .O(O3_5_OBUF_77)
  );
  IBUF   A_12_IBUF (
    .I(A[12]),
    .O(O3_4_OBUF_76)
  );
  IBUF   A_11_IBUF (
    .I(A[11]),
    .O(O3_3_OBUF_75)
  );
  IBUF   A_10_IBUF (
    .I(A[10]),
    .O(O3_2_OBUF_74)
  );
  IBUF   A_9_IBUF (
    .I(A[9]),
    .O(O3_1_OBUF_73)
  );
  IBUF   A_8_IBUF (
    .I(A[8]),
    .O(O3_0_OBUF_72)
  );
  IBUF   A_7_IBUF (
    .I(A[7]),
    .O(O4_7_OBUF_95)
  );
  IBUF   A_6_IBUF (
    .I(A[6]),
    .O(O4_6_OBUF_94)
  );
  IBUF   A_5_IBUF (
    .I(A[5]),
    .O(O4_5_OBUF_93)
  );
  IBUF   A_4_IBUF (
    .I(A[4]),
    .O(O4_4_OBUF_92)
  );
  IBUF   A_3_IBUF (
    .I(A[3]),
    .O(O4_3_OBUF_91)
  );
  IBUF   A_2_IBUF (
    .I(A[2]),
    .O(O4_2_OBUF_90)
  );
  IBUF   A_1_IBUF (
    .I(A[1]),
    .O(O4_1_OBUF_89)
  );
  IBUF   A_0_IBUF (
    .I(A[0]),
    .O(O4_0_OBUF_88)
  );
  OBUF   O1_7_OBUF (
    .I(O1_7_OBUF_47),
    .O(O1[7])
  );
  OBUF   O1_6_OBUF (
    .I(O1_6_OBUF_46),
    .O(O1[6])
  );
  OBUF   O1_5_OBUF (
    .I(O1_5_OBUF_45),
    .O(O1[5])
  );
  OBUF   O1_4_OBUF (
    .I(O1_4_OBUF_44),
    .O(O1[4])
  );
  OBUF   O1_3_OBUF (
    .I(O1_3_OBUF_43),
    .O(O1[3])
  );
  OBUF   O1_2_OBUF (
    .I(O1_2_OBUF_42),
    .O(O1[2])
  );
  OBUF   O1_1_OBUF (
    .I(O1_1_OBUF_41),
    .O(O1[1])
  );
  OBUF   O1_0_OBUF (
    .I(O1_0_OBUF_40),
    .O(O1[0])
  );
  OBUF   O2_7_OBUF (
    .I(O2_7_OBUF_63),
    .O(O2[7])
  );
  OBUF   O2_6_OBUF (
    .I(O2_6_OBUF_62),
    .O(O2[6])
  );
  OBUF   O2_5_OBUF (
    .I(O2_5_OBUF_61),
    .O(O2[5])
  );
  OBUF   O2_4_OBUF (
    .I(O2_4_OBUF_60),
    .O(O2[4])
  );
  OBUF   O2_3_OBUF (
    .I(O2_3_OBUF_59),
    .O(O2[3])
  );
  OBUF   O2_2_OBUF (
    .I(O2_2_OBUF_58),
    .O(O2[2])
  );
  OBUF   O2_1_OBUF (
    .I(O2_1_OBUF_57),
    .O(O2[1])
  );
  OBUF   O2_0_OBUF (
    .I(O2_0_OBUF_56),
    .O(O2[0])
  );
  OBUF   O3_7_OBUF (
    .I(O3_7_OBUF_79),
    .O(O3[7])
  );
  OBUF   O3_6_OBUF (
    .I(O3_6_OBUF_78),
    .O(O3[6])
  );
  OBUF   O3_5_OBUF (
    .I(O3_5_OBUF_77),
    .O(O3[5])
  );
  OBUF   O3_4_OBUF (
    .I(O3_4_OBUF_76),
    .O(O3[4])
  );
  OBUF   O3_3_OBUF (
    .I(O3_3_OBUF_75),
    .O(O3[3])
  );
  OBUF   O3_2_OBUF (
    .I(O3_2_OBUF_74),
    .O(O3[2])
  );
  OBUF   O3_1_OBUF (
    .I(O3_1_OBUF_73),
    .O(O3[1])
  );
  OBUF   O3_0_OBUF (
    .I(O3_0_OBUF_72),
    .O(O3[0])
  );
  OBUF   O4_7_OBUF (
    .I(O4_7_OBUF_95),
    .O(O4[7])
  );
  OBUF   O4_6_OBUF (
    .I(O4_6_OBUF_94),
    .O(O4[6])
  );
  OBUF   O4_5_OBUF (
    .I(O4_5_OBUF_93),
    .O(O4[5])
  );
  OBUF   O4_4_OBUF (
    .I(O4_4_OBUF_92),
    .O(O4[4])
  );
  OBUF   O4_3_OBUF (
    .I(O4_3_OBUF_91),
    .O(O4[3])
  );
  OBUF   O4_2_OBUF (
    .I(O4_2_OBUF_90),
    .O(O4[2])
  );
  OBUF   O4_1_OBUF (
    .I(O4_1_OBUF_89),
    .O(O4[1])
  );
  OBUF   O4_0_OBUF (
    .I(O4_0_OBUF_88),
    .O(O4[0])
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

