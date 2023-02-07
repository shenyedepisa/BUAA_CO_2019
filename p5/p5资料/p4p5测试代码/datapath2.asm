.data
	stack:.data 400
.text
	ori $t1,$0,0
	ori $t2,$0,4
	ori $t3,$0,40
	ori $t4,$0,-4
DFS:
	nop
	nop
	nop
	nop
	beq $t1,$t3,end
	nop
	nop
	nop
	nop
	sw $ra,stack($t1)
	addu $t1,$t1,$t2
	jal DFS
	nop
	nop
	nop
	nop
	subu $t1,$t1,$t2
	nop
	nop
	nop
	nop
	lw $ra,stack($t1)
	nop
	nop
	nop
	nop
	beq $t1,$0,sys
	nop
	nop
	nop
	nop
	jr $ra
	nop
	nop
	nop
	nop
end:jr $ra
	nop
sys:
