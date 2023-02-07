.data
  	symbol:.space 32
	array :.space 32
   	space :.asciiz  " "
   	huanhang:.asciiz  "\n"
.text
   	la $s7,symbol
   	la $s6,array	# symbol=s7   array = s6   n=a1   i=s4
   	
   	li $v0,5
  	syscall
   	move $a1,$v0
   					  
   	jal FullArray

   	li $v0,10
   	syscall
FullArray:
	li $s4,0   #i=0
   	slt $t0,$a0,$a1    #if(index>=n) //a0 = index
   	beq $t0,$0,print
	li $s4,0
for:
   	slt $t0,$s4,$a1
   	beq $t0,$0,forend

	sll $t0,$s4,2
   	add $t0,$s7,$t0

   	lw $t0,0($t0)   #t0=  symbol[i]
   	bne $t0,$0,else

   	sll $t0,$a0,2
   	add $t0,$s6,$t0
   	addi $t1,$s4,1
   	sw $t1,0($t0)	#array[index] = i+1;
   	
	sll $t0,$s4,2
   	add $t0,$s7,$t0
   	li $t1,1
   	sw $t1,0($t0)	#symbol i = 1
   	
  	subi $sp,$sp,16
   	sw $t0,12($sp)
   	sw $s4,8($sp)
   	sw $a0,4($sp)
  	sw $ra,0($sp)

   	addi $a0,$a0,1
   	jal FullArray
  
   	lw $t0,12($sp)
   	lw $s4,8($sp)#
   	lw $ra,0($sp)#
   	lw $a0,4($sp)#
   	addi $sp,$sp,16

   	#symbol[i]=0
   	sw $0,0($t0)
else:   
	addi $s4,$s4,1
	j for
forend:
	jr $ra

print:
   	slt $t0,$s4,$a1   #i<n
   	beq $t0,$0,endprint
   	#address
   	sll $t0,$s4,2
   	add $t1,$t0,$s6
   	lw $a0,0($t1)
   	li $v0,1
   	syscall
   	
   	la $a0 ,space
	li $v0 ,4
	syscall   #output space
	
  	addi $s4,$s4,1
  	j print
endprint:
  	la $a0 ,huanhang
	li $v0 ,4
	syscall   #output huanhang
	
	jr $ra