.data
  	symbol:.space 32
	array :.space 32
   	str1 :.asciiz  " "
   	 str2 :.asciiz  "\n"
.text
   	la $s7,symbol
   	la $s6,array
   	# symbol=s7   array = s6   n=a1   i=s4
   	li $v0,5
  	syscall
   	move $a1,$v0
   	# move $a0,$0   #scanf n
   	jal xhqhandsome

   	li $v0,10   #return 0
   	syscall
   	
xhqhandsome:
   	slt $t0,$a0,$a1    #if(index>=n) 
   	bne $0,$t0,xhqshuai

   	li $s4,0   #i=0
 for:
   	slt $t0,$s4,$a1   #i<n
   	bne $t0,$0,forend
   	#address
   	sll $t0,$s4,2
   	add $t1,$t0,$s6
   	lw $a0,0($t1)
   	li $v0,1
   	syscall
   	la $a0 ,str1
	li $v0 ,4
	syscall   #output space
	
  	addi $s4,$s4,1
  	j for
forend:
  	la $a0 ,str2
	li $v0 ,4
	syscall   #output huanhang
	jr $ra
	

xhqshuai:
   	# symbol=s7   array = s6   n=s5    i=s4
	li $s4,0
for2:
   	slt $t0,$s4,$a1
   	beq $t0,$0,for2end

	sll $t0,$s4,2
   	add $t0,$s7,$t0

   	lw $t0,0($t0)   #t0=  symbol[i]
   	bne $t0,$0,xhq1

   	#array[index]=i+1
   	li $t0,0
   	sll $t0,$a0,2
   	add $t0,$s6,$t0
   	addi $t1,$s4,1
   	sw $t1,0($t0)
   	#symbol i = 1
	sll $t0,$s4,2
   	add $t0,$s7,$t0

   	li $t1,1
   	sw $t1,0($t0)
   	
  	subi $sp,$sp,16
   	sw $t0,12($sp)
   	sw $s4,8($sp)
   	sw $a0,4($sp)
  	sw $ra,0($sp)
   	#function
   	addi $a0,$a0,1
   	jal xhqhandsome
  
   	lw $t0,12($sp)
   	lw $s4,8($sp)
   	lw $ra,0($sp)
   	lw $a0,4($sp)
   	addi $sp,$sp,16

   	#symbol[i]=0
   	sw $0,0($t0)
xhq1:   
	addi $s4,$s4,1
	j for2
for2end:
	jr $ra
