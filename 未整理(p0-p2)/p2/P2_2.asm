.data
	str: .space 80
.text
	li $v0,5
	syscall
	move $s0,$v0
	li $t0,2
	div $s0,$t0
	mflo $s1
	mfhi $s2
	li $t0,0
read1:
	slt $t2,$t0,$s1
	beq $t2,$0,endread1
	sll $t3,$t0,2
	li $v0,12
	syscall
	move $s5,$v0
	sw $s5,str($t3)
	
	addi $t0,$t0,1
	j read1
endread1:
	addi $t0,$t0,-1
	li $s3,1
	
	beq $s2,$0,else
	
	li $v0,12
	syscall
else:
read2:
	sge $t2,$t0,$0
	beq $t2,$0,endread2
	
	li $v0,12
	syscall
	move $s5,$v0
	sll $t3,$t0,2
	lw $s4,str($t3)
	
	beq $s4,$s5,if
	li $s3,0
	j endread2
if:
	addi $t0,$t0,-1
	j read2
endread2:
	
	move $a0,$s3
	li $v0,1
	syscall
	
	li $v0,10
	syscall