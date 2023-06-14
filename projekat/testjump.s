addiu $t0,$0,28
jr $t0
addiu $t1,$0,1
addiu $t2,$0,4
addu $t3, $t1, $t2
prvi:
bne $t0,$0,drugi
addiu $t0,$t0,2
drugi:
ori $t2,$t0,2
addiu $t1,$0,1
addiu $t2,$0,4
beq $0,$0,treci
addiu $t1,$0,1
addiu $t2,$0,4
treci:
jal prvi
