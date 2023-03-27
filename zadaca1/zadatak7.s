.section .data
.globl n1
n1: .word 0,2,4,6,8
n2: .word 1,3,5,7,9

.section .text
.globl swap
swap:
    addu $t8, $a0, $a2
    addu $t9, $a1, $a2
    addu $t0, $a0, $0
    addu $t1, $a1, $0

    loop:
        lw $t2, 0($t0)
        lw $t3, 0($t1)
        sw $t2, 0($t1)
        sw $t3, 0($t0)
        addiu $t0, $t0, 4
        addiu $t1, $t1, 4
    bne $t0, $t8, loop
    jr $ra

.globl main
main:
    la $a0, n1
    la $a1, n2
    addiu $a2, $0, 20
    addiu $sp, $sp, -4
    sw $ra, 0($sp)
    jal swap
    lw $ra, 0($sp)
    addiu $sp, $sp, 4

    addiu $v0, $0, 0
    jr $ra
