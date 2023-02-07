ori $t0,$0,4
jal j1
addu $t1,$t0,$t0
addu $t1,$t1,$t0
j1:
sw $ra,0($t0)
jal j2
lw $ra,0($t0)
j2:
jr $ra
nop