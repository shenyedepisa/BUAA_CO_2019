.data
	array:.space 40
.text
	
	ori $1,$0,4
	ori $2,$0,3

	addu $4,$1,$2
	sw $4,array($0)
	
	subu $4,$1,$2
	ori $3,$0,2
	sw $4,array+4($0)
	
	ori $4,$1,1000
	sw $4,array+8($0)
	
	lui $4,2000
	ori $3,$0,2
	sw $4,array+12($0)
	
	lw $4,array($0)
	sw $4,array+16($0)
	
	lw $4,array+4($0)
	lui $5,1000
	sw $4,array+20($0)
