.data
	stack:.data 400
.text
	ori $t1,$0,0
	ori $t2,$t1,4
	ori $t3,$t1,40
	
DFS:
	beq $t1,$t3,end
	ori $t4,$0,255
	sw $ra,stack($t1)
	jal DFS
	addu $t1,$t1,$t2
	
	subu $t1,$t1,$t2
	lw $ra,stack($t1)
	beq $t1,$0,sys
	ori $t4,$0,255
	jr $ra
	ori $t4,$0,255
end:jr $ra
	ori $t4,$0,255
sys:
