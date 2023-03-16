.section .data
.globl a
a: .word 40 # ova labela je samo adresa!!!!!
.globl b
b: .word 20
c: .word 30

.section .text
.globl main
main:
    la $t5, a # load adress
    lw $t0, 0($t5) # load from adress
    la $t5, b
    lw $t1, 0($t5)
    add $t0, $t0, $t1
    la $t5, c
    lw $t1, 0($t5)
    sub $t0, $t0, $t1
    sw $t0, $t5
    addiu $v0, $0, 0
    jr $ra