# E -> D: pc8@E
# E -> D: Ext@E

# M -> D: pc8@M
# M -> D: alu_c@M
# M -> E: alu_c@M

# W -> D: dm_word@W     // internal forwarding
# W -> E: dm_word@W
# W -> M: dm_word@W
addu    $2, $0, 0xabcdef12
addu    $3, $0, 0xfd7894
addu    $4, $0, 0x95e2
addu    $5, $0, 4
addu    $6, $0, 16
addu    $7, $0, -12
addu    $8, $0, $0
addu    $9, $0, -9999
#######################################
# E -> D: pc8@E
    jal		ED_1				# jump to ED_1 and save position to $ra
    addu    $3, $ra, $5
    j		next1				# jump to next1
    nop
ED_1:
    jr		$ra					# jump to $ra
    nop
next1:
    nop
    nop
    nop
    nop
#######################################
# E -> D: Ext@E
    lui     $10, 0xfeee
    subu    $11, $10, $4
    nop
    nop
    nop
    nop

#######################################
# M -> D: pc8@M
    jal     MD_1
    nop
    j		next2				# jump to next2
    nop
MD_1:
    ori     $12, $ra, 0xf8c5
    jr      $ra
    nop
next2:
    nop
    nop
    nop
    nop
#######################################
# M -> D: alu_c@M
    addu    $13, $14, $3
    subu    $14, $15, $4
    addu    $13, $14, $5
    nop
    nop
    nop
    nop
#######################################
# M -> E: alu_c@M
    addu    $16, $1, $2
    subu    $4, $16, $3
    sw		$4, -4($5)		# 
    sw		$3,  4($5)		# 
    nop
    nop
    nop
    nop
    nop
#######################################
# W -> D: dm_word@W     // internal forwarding
    lw		$17, -4($5)		# 
    lui     $18, 5678
    beq     $7, $8, Oblivion
    addu    $18, $17, $3
    nop
    nop
    nop
    nop

#######################################
# W -> E: dm_word@W
    lw		$19, 4($5)		# 
    lui     $11, 5678
    addu    $12, $19, $19
    nop
    nop
    nop
    nop
#######################################
# W -> M: dm_word@W
    lw		$20, 4($5)
    sw      $20, 0($5)
    nop
    nop
    nop
    nop
    
Oblivion:
    j		Oblivion				# jump to Oblivion
    nop
