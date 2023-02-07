#initial memory!
ori $t4, $0, 4
ori $t1, $t1, 1
ori $t5, $0, 0x1f

for_initial_begin:
beq $t9, $t5, for_initial_end
nop

	addu $t8, $t8, $t4
	sw $t8, 0($t8)

addu $t9, $t9, $t1
j for_initial_begin
nop
for_initial_end:

#lw test
#lw $t3, 0($t1)
ori $0, $0, 0
ori $1, $0, 4
ori $2, $0, 8
ori $3, $0, 12
ori $4, $0, 16
ori $5, $0, 20
ori $6, $0, 24
ori $7, $0, 28
ori $8, $0, 32
ori $9, $0, 36
ori $10, $0, 40
ori $11, $0, 44
ori $12, $0, 48
ori $13, $0, 52
ori $14, $0, 56
ori $15, $0, 60
ori $16, $0, 64
ori $17, $0, 68
ori $18, $0, 72
ori $19, $0, 76
ori $20, $0, 80
ori $21, $0, 84
ori $22, $0, 88
ori $23, $0, 92
ori $24, $0, 96
ori $25, $0, 100
ori $26, $0, 104
ori $27, $0, 108
ori $28, $0, 112
ori $29, $0, 116
ori $30, $0, 120
ori $31, $0, 124

addu $t1, $t1, $t2
lw $t3, 0($t1)
nop
nop
subu $t2, $t1, $t2
lw $t3, 0($t1)
nop
nop
subu $t1, $t1, $t2
lw $t3, 0($t1)
nop
nop
addu $t2, $t1, $t2
lw $t3, 0($t1)
nop
nop
ori $t1, $t3, 100
lw $t3, 0($t1)
nop
nop
ori $t2, $t3, 100
lw $t3, 0($t1)
nop
nop
ori $t1, $t1,100
lw $t3, 0($t1)
nop
nop
ori $t2, $t2, 100
lw $t3, 0($t1)
nop
nop
#lui & lw conflict
#绝大情况下lui后面都难以冒险
ori $t1, $zero, 4
lui $t1, 0
lw $t3, 0($t1)
nop
nop
sw $t2, 4($a0)
lw $t1, 4($a0)
lw $t3, 0($t1)
nop
nop
sw $t6, 16($t7)
lw $t2, 16($t7)
lw $t3, 0($t1)
nop
nop
#$ra conflict
#这里ra中地址已经是指令区域了！ 所以需要减少地址！
jal label
lw $t1, -0x3100($ra)
nop
nop
label:
nop
nop
addu $0, $t1, $t2
lw $t3, 0($t1)
nop
nop
subu $0, $t1, $t2
lw $t3, 0($t1)
nop
nop
subu $0, $t1, $t2
lw $t3, 0($t1)
nop
nop
addu $0, $t1, $t2
lw $t3, 0($t1)
nop
nop
ori $0, $t3, 100
lw $t3, 0($t1)
nop
nop
ori $0, $t3, 100
lw $t3, 0($t1)
nop
nop
ori $0, $t1,100
lw $t3, 0($t1)
nop
nop
ori $0, $t2, 100
lw $t3, 0($t1)
nop
nop
lui $0, 100
lw $t3, 0($t1)
nop
nop
lui $0, 100
lw $t3, 0($t1)
nop
nop
sw $t2, 4($a0)
lw $0, 4($a0)
lw $t3, 0($t1)
nop
nop
sw $t6, 16($t7)
lw $0, 16($t7)
lw $t3, 0($t1)
nop
nop


