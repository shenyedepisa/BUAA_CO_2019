.data
	array:.space 40
.text

	ori $1,$0,4
	sw $1,array($0)
	ori $2,$0,3
	sw $2,array+4($0)
	ori $3,$0,2
	sw $3,array+8($0)
	ori $6,$0,4
	
a0:	addu $1,$2,$3
	beq $1,$6,a1
	lui $5,44
	ori $4,$0,7

a1:	addu $1,$3,$3
	beq $6,$1,a2
	lui $5,45
	ori $4,$0,7
	
a2:	addu $1,$2,$3
	ori $4,$0,8
	beq $1,$6,a3
	lui $5,46
	ori $4,$0,7
	
a3:	addu $1,$3,$3
	ori $4,$0,8
	beq $6,$1,a4
	lui $5,47
	ori $4,$0,7
	
a4:	addu $1,$2,$3
	ori $4,$0,8
	ori $4,$0,9
	beq $1,$6,a5
	lui $5,48
	ori $4,$0,7
	
a5:	addu $1,$3,$3
	ori $4,$0,8
	ori $4,$0,9
	beq $6,$1,a6
	lui $5,49
	ori $4,$0,7
	
a6:	ori $1,$0,3
	beq $1,$6,a7
	nop
	ori $4,$0,7
	
a7:	ori $1,$0,4
	beq $6,$1,a8
	nop
	ori $4,$0,7
	
a8:	ori $1,$0,3
	ori $2,$0,0
	beq $1,$6,a9
	nop
	ori $4,$0,7
	
a9:	ori $1,$0,4
	ori $2,$0,0
	beq $6,$1,a10
	nop
	ori $4,$0,7
	
a10:	ori $1,$0,3
	ori $2,$0,0
	ori $3,$0,1
	beq $1,$6,a11
	nop
	ori $4,$0,7
	
a11:	ori $1,$0,4
	ori $2,$0,0
	ori $3,$0,1
	beq $6,$1,a12
	nop
	ori $4,$0,7
	
a12:	lw $1,array($0)
	beq $1,$6,a13
	nop
	ori $4,$0,7
	
a13:	lw $1,array+4($0)
	beq $6,$1,a14
	nop
	ori $4,$0,7
	
a14:	lw $1,array($0)
	ori $4,$0,8
	beq $1,$6,a15
	nop
	ori $4,$0,7
	
a15:	lw $1,array+4($0)
	ori $4,$0,9
	beq $6,$1,a16
	nop
	ori $4,$0,7
	
a16:	lw $1,array($0)
	ori $4,$0,10
	ori $4,$0,11
	beq $1,$6,a17
	nop
	ori $4,$0,7
	
a17:	lw $1,array+4($0)
	ori $4,$0,12
	ori $4,$0,13
	beq $6,$1,a18
	nop
	ori $4,$0,7
	
a18:
