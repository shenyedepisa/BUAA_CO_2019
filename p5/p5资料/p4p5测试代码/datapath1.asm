.data
arr:.space 44
.text
ori $t0,$0,0
ori $t1,$0,1
ori $s0,$0,1
ori $s1,$0,4
ori $s2,$0,40
for:
nop
nop
nop
nop
beq $t0,$s2,next
nop
sw $t1,arr($t0)
addu $t1,$t1,$s0
nop
nop
nop
nop
addu $t0,$t0,$s1
j for
nop
next:
ori $t0,$0,0
ori $t1,$0,0
ori $s0,$0,0
for1:
nop
nop
nop
nop
beq $t0,$s2,next1
nop
nop
nop
nop
lw $t1,arr($t0)
nop
nop
nop
nop
addu $s0,$s0,$t1
addu $t0,$t0,$s1
j for1
next1:
nop
nop
nop
nop
sw $s0,arr($t0)
nop
nop
nop
nop
li $t0,0x44897253
