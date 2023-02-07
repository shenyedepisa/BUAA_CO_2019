ori $t0,$0,4
jal j1
sw $ra,0($t0)
addu $t0,$t0,$t0
addu $t0,$t0,$t0
addu $t0,$t0,$t0
b1:
addu $t0,$t0,$t0
addu $t0,$t0,$t0
addu $t0,$t0,$t0
addu $t0,$t0,$t0
j1:
lw $t1,0($t0)
beq $t1,$ra,b1
addu $t1,$ra,$t1