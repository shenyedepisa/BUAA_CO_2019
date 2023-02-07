loop: addu $a0, $0, $t0 # 0x00082021
	ori $v0, $0, 4 # 0x34020004
	syscall # 0x0000000C
	addi $t0, $t0, -1 # 0x2108FFFF
	bnez $t0, loop # 0x1500FFFB
	andi $s0, $s7, 0xffc0 # 0x32F0FFC0
	or $a0, $t7, $s0 # 0x01F02025
	sb $a0, 4($s6) # 0xA2C40004
	srl $s7, $s7, 4 