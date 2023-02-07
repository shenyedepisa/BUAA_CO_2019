.data
	array1: .space 256
	array2: .space 256
	array3: .space 256
	space: .asciiz " "
	huanhang: .asciiz "\n"
.text
	la $s4,array1
	la $s5,array2
	la $s6,array3
	
	li $v0,5
	syscall
	move $s0,$v0
	
	mult  $s0,$s0
	mflo $s1
	
	move $t0,$s1
	li $t1,0
read1:
	blez $t0,endread1
	li $v0 5
	syscall
	sw $v0,array1($t1)
	add $t1,$t1,4
	add $t0,$t0,-1
	j read1
endread1:
	
	move $t0,$s1
	li $t1,0
read2:
	blez $t0,endread2
	li $v0 5
	syscall
	sw $v0,array2($t1)
	add $t1,$t1,4
	add $t0,$t0,-1
	j read2
endread2:

	#move $t0,$s6
	li $t1,0
	li $t2,0
	li $t3,1
	li $t4,1
zhang:
	slt $t3,$t1,$s1
	beq $t3,$0,endzhang
	li $t2,0
	ze:
		slt  $t4,$t2,$s0
		beq $t4,$0,endze
		
		div $t1,$s0
		mflo $t5
		mult $t5,$s0
		mflo $t5
		add $t5,$t2,$t5 #a[t5]
		sll $t5,$t5,2
		lw $t9,array1($t5)
		
		mult $t2,$s0
		mflo $t6
		div $t1,$s0
		mfhi $t7
		add $t6,$t6,$t7#b[t6]
		sll $t6,$t6,2
		lw $t8,array2($t6)
		
		mult $t8,$t9
		mflo	$t7
		sll $t6,$t1,2
		lw $t8, array3($t6)
		add $t7,$t7,$t8
		sw $t7,array3($t6)
		addi $t2,$t2,1
		
		j ze
	endze:
	addi $t1,$t1,1
	j zhang
endzhang:
	
li $t1,0
li $t5,1
output:
	slt $t3,$t1,$s1
	beq $t3,$0,endoutput
	sll $t2,$t1,2
	
	lw $t3,array3($t2)
	move $a0,$t3
	li $v0,1
	syscall
	
	la $a0,space
	li $v0,4
	syscall
	add $t1,$t1,1
	
	beq $t5,$s0,print

	add $t5,$t5,1
	j output
print:	
	la $a0,huanhang
	li $v0,4
	syscall
	li $t5,1
	j output
endoutput:
