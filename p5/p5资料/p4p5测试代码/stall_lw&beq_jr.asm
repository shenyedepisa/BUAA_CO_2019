ori $t0,$0,4
ori $t1,$0,5
ori $t3,$0,1
ori $t4,$0,2
sw $t1,0($t0)
addu $t1,$t1,$t1
sw $t1,4($t0)
lw $s1,0($t0)
lw $s2,0($t0)
beq $s1,$s2,beq_1
nop
beq $t3,$t4,end
nop
addu $t3,$t3,$t3
addu $s1,$s1,$s2
beq_1:
ori $t1,$0,12328
sw $t1,8($t0)
lw $ra,8($t0)
jr $ra
nop
end: