.section .data
.globl number
number: .word 10
.globl result
result: .byte 0

.section .text
.globl main
main:
    la $t0, number
    lw $t0, 0($t0)

    andi $t0, $t0, 1

    la $t1, result
    sw $t0, 0($t1)