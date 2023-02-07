ori $t0,$0,20
jal j1
nop
addu $t0,$t0,$t0
addu $t0,$t0,$t0
addu $t0,$t0,$t0
b1:
addu $t0,$t0,$t0
addu $t0,$t0,$t0
addu $t0,$t0,$t0
addu $t0,$t0,$t0
j1:
addu $ra,$ra,$t0
sw $ra,0($t0)
addu $ra,$ra,$t0
lw $ra,0($t0)
jr $ra
nop