# addu subu lui ori nop lw sw jr j jal beq
addu    $2, $0, 0xabcdef12
addu    $3, $0, 0xfd7894
addu    $4, $0, 0x95e2
addu    $5, $0, 4
addu    $6, $0, 16
addu    $7, $0, -12
addu    $8, $0, $0
addu    $9, $0, -9999
addu    $10, $0, 9999
addu    $11, $0, 45
addu    $12, $0, 2777777
nop
nop
######################################
# Tnew = 1 0 0(cal_R, imm, mf) conflicts 0(branch, jump_rs)
    ori     $7, $7, 16
    beq     $7, $6, Oblivion    # stall 0 : 1
    nop
    beq     $7, $7, next1       # forward (internal)
    nop
next1:

    lw      $7, ($6)
    beq     $7, $6, Oblivion    # stall 0 : 2
    nop
    beq     $7, $7, next3       # forward (internal)
    nop
next3:  

    lui     $8, 0xf8e5
    beq     $8, $6, Oblivion    # forward 0 : 0
    nop

    jal     leaf
    nop

    subu    $9, $9, $9
    nop
    beq     $9, $9, next2       # forward 0 : x 0
    nop
next2:
    nop
    nop
    nop

    lw      $9, ($5)
    nop
    beq     $9, $9, next4       # stall 0 : x 1
    nop
next4:
    nop
    nop
    nop

    lw      $9, ($5)
    lui     $9, 0x5897
    beq     $9, $9, next5       # forwarding 0 : 0 1
    nop
next5:
    nop
    nop
    nop

    addu    $9, $5, $6
    subu    $9, $9, $9
    beq     $9, $9, next6       # stall 0 : 1 0
    nop
next6:
    nop
    nop
    nop

    lw      $9, ($5)
    subu    $9, $9, $9
    beq     $9, $9, next99       # stall 0 : 1 1
    nop
next99:
    nop
    nop
    nop


    lw      $9, ($5)
    lw      $9, 4($5)
    beq     $9, $9, next999       # stall 0 : 2 1
    nop
next999:
    nop
    nop
    nop

    addu    $9, $9, $0
    lw      $9, 4($5)
    beq     $9, $9, next88       # stall 0 : 2 0
    nop
next88:
    nop
    nop
    nop
######################################
# 2 1 0(load, store) conflicts
    addu    $10, $0, $10
    lui     $10, 0
    lw      $30, 12($10)    # forward 1 : 0 0
    nop
    nop
    nop

    lw      $10, -4($6)
    lui     $10, 0
    lw      $30, 4($10)    # forward 1 : 0 1
    nop
    nop
    nop

    addu    $10, $0, $10
    addu    $10, $5, $6
    sw      $30, ($10)      # foward 1 : 1 0
    nop
    nop
    nop

    lw      $10, -4($6)
    ori     $10, $0, 120
    sw      $30, ($10)      # foward 1 : 1 1
    nop
    nop
    nop


    lw      $10, 4($10)
    addu    $8, $13, $12
    sw      $10, ($10)       # forward 1 : x 1
    nop
    nop
    nop

    addu    $12, $10, $8
    nop
    ori     $10, $12, 0x153  # foward 1 : x 0
    nop
    nop
    nop

    subu    $10, $7, $5
    addu    $10, $7, $5
    lui     $10, 0
    sw      $30, ($10)      # forward 1 : 0 0 0
    nop
    nop
    nop

    subu    $10, $8, $10
    subu    $10, $9, $8
    addu    $10, $5, $6
    lw      $30, 4($10)      # foward 1 : 1 0 0
    nop
    nop
    nop

    subu    $10, $7, $5
    lw      $10, ($6)
    lui     $10, 0
    sw      $30, 8($10)      # forward 1 : 0 1 0
    nop
    nop
    nop

    subu    $10, $7, $5
    lw      $10, ($6)
    addu    $10, $5, $6
    lw      $30, -12($10)      # forward 1 : 1 1 0
    nop
    nop
    nop

	lw      $11, ($6)
    addu    $10, $11, $4    # stall 1 : 2
    nop
    nop
    nop

    lw      $6, 4($6)
    sw      $6, ($6)       # stall 1 : 2
    nop
    nop
    nop


#################################################
    lw      $13, 4($6)
    sw      $13, ($6)       # forward 2 : 2
    nop
    nop
    nop

    addu    $12, $13, $11   
    sw      $13, ($6)       # forward 2 : 1
    nop
    nop
    nop

    lui     $13, 0x8888   
    sw      $13, ($6)       # forward 2 : 0
    nop
    nop
    nop


################## hard ###################
    addu    $5, $0, 0xfe782ba9
    addu    $6, $5, $0

    lui     $6, 0x02
    beq     $6, $5, hard_lui       # forward 0 : 1/0 1
    nop
    addu    $6, $5, $0
hard_lui:
    nop
    nop
    nop

    ori     $6, $0, 4
    beq     $6, $5, hard_ori       # forward 0 : 1/0 
    nop
    addu    $6, $5, $0
hard_ori:
    nop
    nop
    nop

    addi    $6, $0, 45
    beq     $6, $5, hard_addi       # forward 0 : 1/0 1
    nop
    addu    $6, $5, $0
hard_addi:
    nop
    nop
    nop

    addiu   $6, $0, 6772
    beq     $6, $5, hard_addiu       # forward 0 : 1/0 1
    nop
    addu    $6, $5, $0
hard_addiu:
    nop
    nop
    nop

    andi    $6, $0, 7665
    beq     $6, $5, hard_andi       # forward 0 : 1/0 1
    nop
    addu    $6, $5, $0
hard_andi:
    nop
    nop
    nop

    xori    $6, $0, 0xfe57
    beq     $6, $5, hard_xori       # forward 0 : 1/0 1
    nop
    addu    $6, $5, $0
hard_xori:
    nop
    nop
    nop

    slti    $6, $0, 9875
    beq     $6, $5, hard_slti       # forward 0 : 1/0 1
    nop
    addu    $6, $5, $0
hard_slti:
    nop
    nop
    nop

    sltiu    $6, $0, 0xf
    beq     $6, $5, hard_sltiu       # forward 0 : 1/0 1
    nop
    addu    $6, $5, $0
hard_sltiu:
    nop
    nop
    nop

########### cal_r #################
########### addu ############
    addu    $6, $0, $4
    beq     $6, $5, hard1_addu       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard1_addu:
    nop
    nop
    nop

    addu    $6, $0, $4
    beq     $5, $6, hard2_addu       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard2_addu:
    nop
    nop
    nop

    addu    $6, $4, $0 
    beq     $6, $5, hard3_addu       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard3_addu:
    nop
    nop
    nop

    addu    $6, $4, $0
    beq     $5, $6, hard4_addu       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard4_addu:
    nop
    nop
    nop

########### subu ############
    subu    $6, $0, $4
    beq     $6, $5, hard1_subu       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard1_subu:
    nop
    nop
    nop

    subu    $6, $0, $4
    beq     $5, $6, hard2_subu       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard2_subu:
    nop
    nop
    nop

    subu    $6, $4, $0 
    beq     $6, $5, hard3_subu       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard3_subu:
    nop
    nop
    nop

    subu    $6, $4, $0
    beq     $5, $6, hard4_subu       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard4_subu:
    nop
    nop
    nop

########### slt ############
    slt    $6, $0, $4
    beq     $6, $5, hard1_slt       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard1_slt:
    nop
    nop
    nop

    slt    $6, $0, $4
    beq     $5, $6, hard2_slt       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard2_slt:
    nop
    nop
    nop

    slt     $6, $4, $0 
    beq     $6, $5, hard3_slt       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard3_slt:
    nop
    nop
    nop

    slt    $6, $4, $0
    beq     $5, $6, hard4_slt       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard4_slt:
    nop
    nop
    nop

########### sltu ############
    sltu    $6, $0, $4
    beq     $6, $5, hard1_sltu       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard1_sltu:
    nop
    nop
    nop

    sltu    $6, $0, $4
    beq     $5, $6, hard2_sltu       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard2_sltu:
    nop
    nop
    nop

    sltu    $6, $4, $0 
    beq     $6, $5, hard3_sltu       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard3_sltu:
    nop
    nop
    nop

    sltu    $6, $4, $0
    beq     $5, $6, hard4_sltu       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard4_sltu:
    nop
    nop
    nop

########### sll ############
    sll     $6, $0, 23
    beq     $6, $5, hard1_sll       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard1_sll:
    nop
    nop
    nop

    sll     $6, $0, 10
    beq     $5, $6, hard2_sll       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard2_sll:
    nop
    nop
    nop

    sll     $6, $4, 0 
    beq     $6, $5, hard3_sll       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard3_sll:
    nop
    nop
    nop

    sll     $6, $4, 0
    beq     $5, $6, hard4_sll       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard4_sll:
    nop
    nop
    nop

########### srl ############
    srl     $6, $0, 15
    beq     $6, $5, hard1_srl       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard1_srl:
    nop
    nop
    nop

    srl    $6, $0, 27
    beq     $5, $6, hard2_srl       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard2_srl:
    nop
    nop
    nop

    srl    $6, $4, 0
    beq     $6, $5, hard3_srl       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard3_srl:
    nop
    nop
    nop

    srl    $6, $4, 0
    beq     $5, $6, hard4_srl       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard4_srl:
    nop
    nop
    nop

########### sra ############
    sra    $6, $0, 11
    beq     $6, $5, hard1_sra       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard1_sra:
    nop
    nop
    nop

    sra    $6, $0, 2
    beq     $5, $6, hard2_sra       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard2_sra:
    nop
    nop
    nop

    sra    $6, $4, 0
    beq     $6, $5, hard3_sra       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard3_sra:
    nop
    nop
    nop

    sra    $6, $4, 0
    beq     $5, $6, hard4_sra       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard4_sra:
    nop
    nop
    nop

########### sllv ############
    sllv    $6, $0, $4
    beq     $6, $5, hard1_sllv       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard1_sllv:
    nop
    nop
    nop

    sllv    $6, $0, $4
    beq     $5, $6, hard2_sllv       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard2_sllv:
    nop
    nop
    nop

    sllv    $6, $4, $0 
    beq     $6, $5, hard3_sllv       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard3_sllv:
    nop
    nop
    nop

    sllv    $6, $4, $0
    beq     $5, $6, hard4_sllv       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard4_sllv:
    nop
    nop
    nop


########### srlv ############
    srlv    $6, $0, $4
    beq     $6, $5, hard1_srlv       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard1_srlv:
    nop
    nop
    nop

    srlv    $6, $0, $4
    beq     $5, $6, hard2_srlv       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard2_srlv:
    nop
    nop
    nop

    srlv    $6, $4, $0 
    beq     $6, $5, hard3_srlv       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard3_srlv:
    nop
    nop
    nop

    srlv    $6, $4, $0
    beq     $5, $6, hard4_srlv       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard4_srlv:
    nop
    nop
    nop

########### srav ############
    srav    $6, $0, $4
    beq     $6, $5, hard1_srav       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard1_srav:
    nop
    nop
    nop

    srav    $6, $0, $4
    beq     $5, $6, hard2_srav       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard2_srav:
    nop
    nop
    nop

    srav    $6, $4, $0 
    beq     $6, $5, hard3_srav       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard3_srav:
    nop
    nop
    nop

    srav    $6, $4, $0
    beq     $5, $6, hard4_srav       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard4_srav:
    nop
    nop
    nop

########### and ############
    and    $6, $0, $4
    beq     $6, $5, hard1_and       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard1_and:
    nop
    nop
    nop

    and    $6, $0, $4
    beq     $5, $6, hard2_and       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard2_and:
    nop
    nop
    nop

    and    $6, $4, $0 
    beq     $6, $5, hard3_and       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard3_and:
    nop
    nop
    nop

    and    $6, $4, $0
    beq     $5, $6, hard4_and       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard4_and:
    nop
    nop
    nop

########### or ############
    or    $6, $0, $4
    beq     $6, $5, hard1_or       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard1_or:
    nop
    nop
    nop

    or    $6, $0, $4
    beq     $5, $6, hard2_or       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard2_or:
    nop
    nop
    nop

    or    $6, $4, $0 
    beq     $6, $5, hard3_or       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard3_or:
    nop
    nop
    nop

    or    $6, $4, $0
    beq     $5, $6, hard4_or       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard4_or:
    nop
    nop
    nop

########### xor ############
    xor    $6, $0, $4
    beq     $6, $5, hard1_xor       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard1_xor:
    nop
    nop
    nop

    xor    $6, $0, $4
    beq     $5, $6, hard2_xor       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard2_xor:
    nop
    nop
    nop

    xor    $6, $4, $0 
    beq     $6, $5, hard3_xor       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard3_xor:
    nop
    nop
    nop

    xor    $6, $4, $0
    beq     $5, $6, hard4_xor       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard4_xor:
    nop
    nop
    nop

########### nor ############
    nor    $6, $0, $4
    beq     $6, $5, hard1_nor       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard1_nor:
    nop
    nop
    nop

    nor    $6, $0, $4
    beq     $5, $6, hard2_nor       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard2_nor:
    nop
    nop
    nop

    nor    $6, $4, $0 
    beq     $6, $5, hard3_nor       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard3_nor:
    nop
    nop
    nop

    nor    $6, $4, $0
    beq     $5, $6, hard4_nor       # forward 0 : 1/0
    nop
    addu    $6, $5, $0
hard4_nor:
    nop
    nop
    nop

    j end
	nop

leaf:
    addu    $31, $0, $31    # stall/forward
    jr      $31             # stall 0 : 1/0
    nop

Oblivion:
    j		Oblivion				# jump to Oblivion
    nop
    
end:
    addu    $8, $8, $8
