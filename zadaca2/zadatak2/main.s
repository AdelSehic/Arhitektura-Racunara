.section .data
set: .byte 'a', 'b', 'd', 'e'


.section .text
.globl main
main:

    addiu $sp, $sp, -32
    sw $ra, 28($sp)


    la $a0, set
    addiu $a1, $0, 2
    addiu $a2, $0, 3
    jal combinations

    lw $ra, 28($sp)
    addiu $sp, $sp, 32

    addiu $v0, $v0, 0
    jr $ra