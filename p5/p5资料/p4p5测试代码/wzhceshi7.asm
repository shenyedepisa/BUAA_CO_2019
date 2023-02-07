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
	
	addu $1,$2,$3
	ori $4,$1,1000
	
	addu $1,$2,$3
	ori $0,$0,7
	ori $4,$1,1000
	
	ori $1,$2,1000
	ori $4,$1,7
	
	lui $5,2000
	ori $0,$0,7
	ori $4,$5,7
	
	lw $5,array($0)
	ori $4,$5,1000
	
	lw $5,array+4($6)
	ori $0,$0,7
	ori $4,$5,2000
