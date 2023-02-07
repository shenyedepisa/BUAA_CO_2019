# function test 
# addu subu lui ori nop lw sw j jal jr beq
    ori     $7, $0, 16
	ori     $2, $1, 5
	ori     $3, $5, 1
	ori     $4, $8, 157
    ori     $0  $10, 9999
    ori     $5  $8, 0
    ori     $0, $11, 2333

    nop
    nop

    lui     $11 0xffff
    lui     $12 0x5678
    lui     $13 0
    lui     $0  57890

	nop
    nop

    addu    $31 $30 $7
    addu    $0  $7  $2
    addu    $30 $0  $3

    nop
    nop

    subu    $30 $27 $3
    subu    $0  $27 $8
    subu    $27 $0  $10

    nop
    nop

    sw      $2, -4($7)
	sw		$14, 0($0)
	sw		$15, 4($0)
	sw		$16, 8($0)
	
	nop
    nop

	lw		$17, -4($7)		# 
	lw		$18, 4($0)		# 
	lw		$19, 8($0)		# 
	lw		$20, 12($0)		# 

    nop
    nop
    nop
    nop


    j		beq_start
    nop
    nop

lb_back_1:

    jal		leaf			
    nop

    j		end	
    nop
    nop

beq_start:
    beq		$31, $17, lb1
    nop
    addu    $27 $27 $2
    nop
    beq     $5 $5 lb1
    nop
    subu    $27 $27 $2
    nop

lb1:
    addu    $23 $22 $3
    beq     $1 $2 lb_back_1
    nop
    subu    $23 $22 $3
    nop
    beq     $24 $24 lb_back_1
    nop
    
    
    nop
	nop
end:
    j		end				# jump to end
    nop
    

leaf:
    addu    $8 $8 $8
    subu    $17 $17 $7
    jr		$ra					# jump to $ra
    nop
    
