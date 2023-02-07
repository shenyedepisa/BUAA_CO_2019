cal_I_cal_I:
ori $t0,$0,4
ori $t1,$t0,6
ori $t2,$t0,5
ori $t3,$t0,8
R_RS:
addu $s1,$t0,$t1
addu $s2,$s1,$t0
subu $s2,$s1,$s2
addu $s3,$s1,$t0
nop
nop
nop
R_RT:
addu $s1,$t0,$t1
addu $s2,$t0,$s1
subu $s2,$s2,$s1
addu $s3,$t0,$s1
R_cal_I:
addu $s1,$t0,$t1
ori $s2,$s1,5
ori $s3,$s1,6
ori $s4,$s1,3
cal_I_RT:
ori $s1,$0,10
addu $s2,$t0,$s1
subu $s2,$s2,$s1
addu $s3,$t0,$s1
cal_I_RS:
ori $s1,$0,20
addu $s2,$s1,$t0
subu $s2,$s1,$s2
addu $s3,$s1,$t0
