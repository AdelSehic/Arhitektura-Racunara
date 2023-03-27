.section .data
.globl destination
destination: .hword


.section .text

# .globl exchange
exchange:
    sh $a1, 0($a0)
    jr $ra

.globl main
main:
    addiu $sp, $sp, -4
    sw $ra, 0($sp)
    la $a0, destination
    addiu $a1, $0, 327
    jal exchange
    addu $t0, $0, $v0
    lw $ra, 0($sp)
    addiu $sp, $sp, 4

    addiu $v0, $0, 0
    jr $ra