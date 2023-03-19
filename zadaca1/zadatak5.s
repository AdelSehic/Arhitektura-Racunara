.section .data
.globl str
str: .byte 'a', 'd', 'e', 'l', '\0'

.section .text
.globl main
main:
    addi $t0, $0, '\0'
    la $t9, str

    

    addiu $v0, $0, 0
    jr $ra