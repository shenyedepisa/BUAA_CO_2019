# 北航计算机组成原理课设 2019 (P0~P6)

北京航空航天大学	计算机组成原理课程设计(Computer Organization)

2019~2020秋季学期

代码存档

### P0

熟悉Logisim, 主要难点是理解时序电路和有限状态机

要求完成CRC校验电路, ALU等

### P1

熟悉Verilog HDL, (基本上是类C代码)

本质是用verilog完成P0的内容, 

### P2

使用MIPS汇编语言完成矩阵乘法, 回文数列判断;

先写c代码, 再翻译成汇编

注意递归时参数栈的维护

### P3

使用Logisim开发支持7条指令的单周期CPU

**支持的指令**: addu, subu, oir,  lw, sw, lui, beq, 

### P4

使用Verilog开发支持7条指令单周期CPU

**支持的指令**: addu, subu, oir,  lw, sw, lui, beq, jal, jr

### P5

使用Verilog开发支持10条指令的流水线CPU

单周期到流水线难度提升极大, 注意设计好暂停和转发

涉及数字比较时注意是无符号数还是有符号数(小问题但巨坑)

**支持的指令**: lw, lh, lb, sw, addu, subu, lui, ori, beq, j, jal, jr, jalr

### P6

使用Verilog开发支持50条指令的流水线CPU

乘除单元需要额外设计, 其余变动主要在控制逻辑

P5到P6的跨度主要在工程量, 总体难度跨度小于P4到P5

**支持的指令**: lw, lh, lhu, lb, lbu, sw, sb, sh, add, addu, addi, addiu, sub, subu, lui, and, or, xor, nor, andi, xori, ori, beq, bne, blez, bgtz, bltz, bgez, j, jal, jr, jalr, sll, srl, sra, sllv, srlv, srav, slt, slti, sltiu, sltu, mult, multu, div, divu, mfhi, mflo, mthi, mtlo

---

以下部分未完成

---

### P7

 开发IO和中断

### P8

完成MIPS微系统(据说要上板子)











