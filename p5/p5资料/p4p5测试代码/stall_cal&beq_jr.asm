ori $t0,$0,3
ori $t1,$0,4
beq $t1,$t0,beq_1
nop
ori $t2,$0,1
subu $t1,$t1,$t2
beq $t1,$t0,beq_2
nop
beq_1:
beq $t2,$t3,end
addu $t2,$t1,$t0
addu $t3,$t0,$t0
beq_2:
ori $31,$0,12316
nop
jr $ra
nop
end:
