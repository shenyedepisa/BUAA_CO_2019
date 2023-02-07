ori $t1,$0,4
ori $t2,$t1,5
ori $t3,$t1,8
addu $s1,$t2,$t3
addu $s2,$t2,$t2
sw $s1,0($t1)
addu $t1,$t1,$t1
sw $s2,0($t1)
sw $t1,4($t1)
lw $t2,4($t1)
lw $t3,-4($t2)

