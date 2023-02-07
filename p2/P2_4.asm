.data
	symbol: .space 32
	array: .space 32
	space: .asciiz " "
	huanhang: .asciiz "\n"
.text
	li $v0,5
	syscall
	move $a1,$v0 	# scanf		a1 = n
	
	jal FullArray

	li $v0,10
	syscall

FullArray:
	li $t9,0
	slt $t0,$s0,$a1   # s0 = index
	beq $t0,$0,print
	
	li $t7,0  		#t7 = i	
for:
	slt $t0,$t7,$a1
	beq $t0,$0,endfor
	
	sll $t1,$t7,2
	lw $s1,symbol($t1)	#s1 symbol[i] i
	bne $s1,$0,else
	
	sll $s2,$s0,2		#s2  array[index] = i+1;
	addi $s3,$t7,1
	sw $s3,array($s2)
	
	li $t4,1
	sw $t4,symbol($t1)	#symbol[i] = 1;
	
	subi $sp,$sp,16
	sw $ra,12($sp)
	sw $s0,8($sp)
	sw $t7,4($sp)
	sw $t1,0($sp)
	
	addi $s0,$s0,1
   	jal FullArray
   	
	lw $t1,0($sp)
	lw $t7,4($sp)
	lw $s0,8($sp)
	lw $ra,12($sp)
	addi $sp,$sp,16
	
	sw $0,symbol($t1)	#symbol[i] = 0;
else:	
	addi $t7,$t7,1
	j for
endfor:
	li $t7,0
	jr $ra
	
#output
print:
	slt $t0,$t9,$a1 #t9 = i
	beq $t0,$0,endprint
	
	sll $t1,$t9,2
	lw $a0,array($t1)
	li $v0,1
	syscall	#print
	
	la $a0,space
	li $v0,4
	syscall	#print space
	
	addi $t9,$t9,1
	j print
endprint:
	la $a0,huanhang
	li $v0,4
	syscall	#print huanhang
	
	li $t9,0
	jr $ra
