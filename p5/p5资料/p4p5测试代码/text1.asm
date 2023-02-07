.data
	stack:.data 400
.text
	ori $t1,$0,0
	ori $t2,$0,4
	ori $t3,$0,40
	ori $t4,$0,4
DFS:
	beq $t1,$t3,end
	nop
	sw $ra,stack($t1)
	addu $t1,$t1,$t2
	jal DFS
	nop
	subu $t1,$t1,$t2
	lw $ra,stack($t1)
	beq $t1,$0,sys
	nop
	jr $ra
	nop
end:jr $ra
nop
sys:
