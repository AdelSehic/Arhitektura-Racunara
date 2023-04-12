.section .data
.globl niz
niz: .byte 'a'

.section .text
.globl main
main:
    la $t0, niz
    lb $a0, 0($t0)

    syscall 4

    addiu $v0, $0, 0
    jr $ra