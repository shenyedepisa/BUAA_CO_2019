#jr test
#same as lw test!

ori $t4, $zero, 4
ori $ra, $zero, 0x3014

nop
#addu $ra, $ra, $t4
jr $ra
nop
ori $t1, $ra, 100
ori $t2, $t2, 500
nop
##############################################################################################
nop
nop
ori $t4, $zero, 4
ori $ra, $zero, 0x3040

nop
#addu $ra, $ra, $t4
subu $ra, $ra, $t4
jr $ra
nop
ori $t1, $ra, 100
ori $t2, $t2, 500
nop
nop
###############################################################################################
ori $t0, $zero, 0x3074
sw $t0, 0($a0)
ori $ra, $ra, 0x3000
nop
nop
nop
lw $ra, 0($a0)
jr $ra
#addu $ra, $ra, $t4
nop
nop
