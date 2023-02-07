.data
	str1: .space 400
	str2: .space 400
	str3: .space 400
	space: .asciiz " "
	huanhang: .asciiz "\n"
.text
	li $v0,5
	syscall
	move $s0,$v0 
	li $v0,5
	syscall
	move $s1,$v0
	li $v0,5
	syscall
	move $s2,$v0 
	li $v0,5
	syscall
	move $s3,$v0
	
	sub $t0,$s0,$s2
	addi $s4,$t0,1
	sub $t1,$s1,$s3
	addi $s5,$t1,1

	li $t8,0
	li $t9,0
input1:
	slt $t2,$t8,$s0
	beq $t2,$0,endinput1
	li $t9,0
load1:
	slt $t3,$t9,$s1
	beq $t3,$0,endload1
	
	mult $t8,$s1
	mflo $t5
	add $t5,$t5,$t9
	sll $t5,$t5,2
	li $v0,5
	syscall
	sw $v0,str1($t5)
	
	addi $t9,$t9,1
	j load1
endload1:
	addi $t8,$t8,1
	j input1
endinput1:

	li $t9,0
	li $t8,0
input2:
	slt $t2,$t8,$s2
	beq $t2,$0,endinput2
	li $t9,0
load2:
	slt $t3,$t9,$s3
	beq $t3,$0,endload2
	
	mult $t8,$s3
	mflo $t5
	add $t5,$t5,$t9
	sll $t5,$t5,2
	li $v0,5
	syscall
	sw $v0,str2($t5)
	
	addi $t9,$t9,1
	j load2
endload2:
	addi $t8,$t8,1
	j input2
endinput2:
	li $t6,0
	li $t7,0
	li $t8,0
	li $t9,0
jisuan1:
	slt $t0,$t6,$s4
	beq $t0,$0,endjisuan1
	li $t7,0
jisuan2:
	slt $t0,$t7,$s5
	beq $t0,$0,endjisuan2
	li $t8,0
	
	mult $t6,$s5
	mflo $t5
	add $t5,$t5,$t7
	sll $t5,$t5,2
jisuan3:
	slt $t0,$t8,$s2
	beq $t0,$0,endjisuan3
	li $t9,0
	
jisuan4:
	slt $t0,$t9,$s3
	beq $t0,$0,endjisuan4
	
	add $t4,$t6,$t8
	mult $t4,$s1
	mflo $t4
	add $t4,$t4,$t7
	add $t4,$t4,$t9
	sll $t4,$t4,2
	
	mult $t8,$s3
	mflo $t3
	add $t3,$t3,$t9
	sll $t3,$t3,2
	
	lw $t0,str3($t5)
	lw $t1,str1($t4)
	lw $t2,str2($t3)
	mult $t1,$t2
	mflo $s7
	add $t0,$t0,$s7
	sw $t0,str3($t5)
	
	addi $t9,$t9,1
	j jisuan4
endjisuan4:
	addi $t8,$t8,1
	j jisuan3
endjisuan3:
	addi $t7,$t7,1
	j jisuan2
endjisuan2:
	addi $t6,$t6,1
	j jisuan1
endjisuan1:

	li $t9,0
	li $t8,0
output:
	slt $t2,$t8,$s4
	beq $t2,$0,endoutput
	li $t9,0
load3:
	slt $t3,$t9,$s5
	beq $t3,$0,endload3
	
	mult $t8,$s5
	mflo $t5
	add $t5,$t5,$t9
	sll $t5,$t5,2
	lw $a0, str3($t5)
	li $v0,1
	syscall
	
	la $a0,space
	li $v0, 4
	syscall
	addi $t9,$t9,1
	j load3
endload3:
	la $a0,huanhang
	li $v0,4
	syscall
	addi $t8,$t8,1
	j output
endoutput:
	li $v0,10
	syscall
