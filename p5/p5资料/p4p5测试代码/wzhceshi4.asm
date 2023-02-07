.data
	array:.space 40
.text
	ori $1,$0,0
	ori $2,$1,4
	ori $3,$1,8
	ori $4,$1,12
	
	sw $1,array($0)
	lw $5,array($1)
	
	sw $2,array+4($0)
	lw $5,array($2)
	
	sw $3,array+4($2)
	addu $2,$2,$2
	lw $5,array($2)
	
	sw $4,array+12($1)
	addu $3,$1,$2
	ori $2,$1,4
	lw $5,array+4($3)
