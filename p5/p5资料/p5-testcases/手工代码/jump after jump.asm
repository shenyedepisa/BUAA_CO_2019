#beq & jal
ori $ra, 0x3100
jal label
nop
ori $t1, $zero, 22

label:
#beq $t1, $ra, label2
jr $ra
nop
nop
#if not branch:
ori $t2, 0x10
label2:
