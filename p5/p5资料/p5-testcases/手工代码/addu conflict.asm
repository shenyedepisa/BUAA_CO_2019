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
addu $t3, $t1, $t2
nop
nop
subu $t2, $t1, $t2
addu $t3, $t1, $t2
nop
nop
subu $t1, $t1, $t2
addu $t3, $t1, $t2
nop
nop
addu $t2, $t1, $t2
addu $t3, $t1, $t2
nop
nop
ori $t1, $t3, 100
addu $t3, $t1, $t2
nop
nop
ori $t2, $t3, 100
addu $t3, $t1, $t2
nop
nop
ori $t1, $t1,100
addu $t3, $t1, $t2
nop
nop
ori $t2, $t2, 100
addu $t3, $t1, $t2
nop
nop
lui $t1, 100
addu $t3, $t1, $t2
nop
nop
lui $t2, 100
addu $t3, $t1, $t2
nop
nop
sw $t2, 4($a0)
lw $t1, 4($a0)
addu $t3, $t1, $t2
nop
nop
sw $t6, 16($t7)
lw $t2, 16($t7)
addu $t3, $t1, $t2
nop
nop
jal label
addu $ra, $ra, $ra
label:
nop
nop
addu $0, $t1, $t2
addu $t3, $0, $t2
nop
nop
subu $0, $t1, $t2
addu $t3, $t1, $0
nop
nop
subu $0, $t1, $t2
addu $t3, $0, $t2
nop
nop
addu $0, $t1, $t2
addu $t3, $t1, $0
nop
nop
ori $0, $t3, 100
addu $t3, $0, $t2
nop
nop
ori $0, $t3, 100
addu $t3, $t1, $0
nop
nop
ori $0, $t1,100
addu $t3, $0, $t2
nop
nop
ori $0, $t2, 100
addu $t3, $t1, $0
nop
nop
lui $0, 100
addu $t3, $0, $t2
nop
nop
lui $0, 100
addu $t3, $t1, $0
nop
nop
sw $t2, 4($a0)
lw $0, 4($a0)
addu $t3, $0, $t2
nop
nop
sw $t6, 16($t7)
lw $0, 16($t7)
addu $t3, $t1, $0
nop
nop


