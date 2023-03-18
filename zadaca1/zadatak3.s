.section .data
.globl number
number: .word 2147483647

.section .text
.globl main
main:
    la $t0, number
    lw $t0, 0($t0)

    lui $t1, 0b1011101111111111
    ori $t1, $t1, 0b1011111111111110

    and $t0, $t1, $t0

    addiu $v0, $0, 0
    jr $ra