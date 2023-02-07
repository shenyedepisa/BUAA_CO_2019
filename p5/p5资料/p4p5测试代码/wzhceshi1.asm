.data
	array:.space 40
.text
	
	ori $1,$0,4
	sw $1,array($0)
	ori $2,$0,3
	sw $2,array+4($0)
	ori $3,$0,2
	sw $3,array+8($0)
	
	addu $1,$2,$3
	subu $4,$1,$2
	
	subu $1,$2,$3
	addu $4,$2,$1
	
	addu $1,$2,$3
	ori $4,$0,1
	subu $4,$1,$2
	
	subu $1,$2,$3
	ori $4,$0,1
	addu $4,$2,$1
	
	ori $1,$2,1000
	addu $4,$1,$2
	
	lui $1,1000
	addu $4,$2,$1
	
	ori $1,$2,1000
	ori $4,$0,1
	addu $4,$1,$2
	
	lui $1,1000
	ori $4,$0,1
	addu $4,$2,$1
	
	lw $5,array($0)
	addu $4,$0,$5
	
	lw $5,array+4($0)
	addu $4,$5,$0
	
	lw $5,array($0)
	ori $4,$1,7
	addu $4,$0,$5
	
	lw $5,array+8($0)
	ori $4,$1,7
	addu $4,$5,$0
