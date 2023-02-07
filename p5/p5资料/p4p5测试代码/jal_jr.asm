ori $t0,$0,8
jal j
addu $ra,$ra,$t0
ori $t1,$t0,5
lui $t5,50
ori $t5,$0,6
subu $t4,$t1,$t5
addu $ra,$ra,$t0
j:
jr $ra
nop