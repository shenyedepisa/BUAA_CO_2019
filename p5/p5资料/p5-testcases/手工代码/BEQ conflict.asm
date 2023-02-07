#test single beq's behavior!
lui $t1, 1
beq $t2, $t3, labelx
labelx: addu $t1, $t1, $t1 


#initial memory!
ori $t1, $zero, 1
ori $t4, $0, 4
ori $t1, $t1, 1
ori $t5, $0, 0x1f

for_initial_begin:
beq $t9, $t5, for_initial_end
nop

	addu $t8, $t8, $t4
	sw $t8, 0($t8)

addu $t9, $t9, $t1
j for_initial_begin
nop
for_initial_end:


#addu 作为供给者：
#addu $t1, $t3, $t4
#subu $t1, $t3, $t4
#ori $t2, $zero, 0x10
#lui $t1, 1
lw $t2, 8($a0)
beq $t1, $t2, label
nop
#test if branch! suppose not branch!
lw $t1, 8($a0)
label:
beq $t1, $t2, label2
ori $t1, $zero, 0x50
#test if branch! suppose branch
ori $t1, $zero, 0x70

label2: 

