nop
nop
ori $9 $9 0x00000001
subu $10 $0 $9
ori $8 $8 0x0000302c
sw $8 0($0)
ori $17 $17 0x00003038
lw $16 0($0)
nop			#bgezalr $9 $16 $21
nop
ori $26 $26 0x00000001
nop			#bgezalr $10 $17 $22
nop
ori $27 $27 0x00000002
nop
nop
