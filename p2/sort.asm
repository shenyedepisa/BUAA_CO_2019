.data
	array: .space 400
	message1: .asciiz "please input an integer\n"
	message2: .asciiz "please input followed with a line break\n"
	message3: .asciiz "the sorted sequence is\n"
	space: .asciiz " "
	stack: .space 100
.globl main
.text
input:
	la $a0,message1
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	
	li $t1,0
for_1_begin:
	slt $t2,$t1,$t0
	beq $t2,$0,for_1_end
	
	la $t2,array
	li $t3,4
	mult $t3,$t1
	mflo $t3
	addu $t2,$t2,$t3
	
	la $a0,message2
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	
	sw $v0, 0($t2)
	
	addi $t1,$t1,1
	j for_1_begin
for_1_end:
	move $v0,$t0
	jr $ra
	
output:
	move $t0,$a0
	
	la $a0,message3
	li $v0,4
	syscall
	
	li $t1,0
for_2_begin:
	slt $t2,$t1,$t0
	beq $t2,$0,for_2_end
	
	la $t2,array
	li $t3,4
	mult $t3,$t1
	mflo $t3
	addu $t2,$t2,$t3
	
	lw $a0,0($t2)
	li $v0,1
	syscall
	
	la $a0,space
	li $v0,4
	syscall
	
	addi $t1,$t1,1
	j for_2_begin
for_2_end:
	#jr $ra
	#move $a0,$v0
sort:
	move $t0,$a0
	li $t1,0
	for_4_begin:
		slt $t2,$t1,$t0
		beq $t2,$0,for_4_end
		
		la $t2,array
		li $t3,4
		mult $t1,$t3
		mflo $t3
		addu $t2,$t2,$t3
		
		move $a0,$t0
		move $a1,$t1
		
		sw $t2,28($sp)
		sw $t1,24($sp)
		sw $t0,20($sp)
		sw $ra,16($sp)
		jal findmin
		
		lw $ra,16($sp)
		lw $t0,20($sp)
		lw $t1,24($sp)
		lw $t2,28($sp)
		
		lw $t3,0($v0)
		lw $t4,0($t2)
		sw $t3,0($t2)
		sw $t4,0($v0)
		
		addi $t1,$t1,1
		j for_4_begin
	for_4_end:
	addiu $sp,$sp,32
	jr $ra
	
findmin:
	la $t0,array
	sll $a0,$a0,2
	subi $a0,$a0,4
	addu $t0,$t0,$a0
	
	lw $t1,0($t0)
	move $t2,$t0
	
	move $t3,$t0
	la $t0,array
	sll $a1,$a1,2
	addu $t0,$t0,$a1
for_3_begin:
	sge $t4,$t3,$t0
	beq $t4,$0,for_3_end
	
	lw $t5,0($t3)
	
	slt $t6,$t5,$t1
	beq $t6,$0,if_1_else
	
	move $t1,$t5
	move $t2,$t3
	j  if_1_end
	if_1_else:
	if_1_end:
	subi $t3,$t3,4
	j for_3_begin
for_3_end:
move $v0,$t2
jr $ra

main :
	la $sp,stack
	addiu $sp,$sp,100
	addiu $sp,$sp,-20
	jal input
	
	move $t0,$v0
	
	move $a0,$t0
	sw $t0,16($sp)
	
	move $a0,$t0
	jal output
	
	addiu $sp,$sp,20
	
	li $v0,10
	syscall
