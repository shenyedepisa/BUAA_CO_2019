lui $t1, 0x1234
ori $t2, 0x1234
addu $t3, $t2, $t1
subu $t4, $t3, $t2
sw $t3, 0($a0)
lw $v1, 0($a0)

 