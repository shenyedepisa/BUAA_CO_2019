ori $t2,$0,4
sll $t1,$t2,5
jal j1
addu $t2,$t2,$t1
addu $t2,$t2,$t1
addu $t2,$t2,$t1
addu $t2,$t2,$t1
j1:
jalr $t3,$ra
nop