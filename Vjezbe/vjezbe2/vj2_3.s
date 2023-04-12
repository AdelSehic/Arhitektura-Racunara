.section .data
.globl a
a: .byte 25
.globl b
b: .byte -2
.globl d
d: .hword 40000
.globl c
c: .byte -10
.globl e
e: .hword 40000
.globl x
x: .word 3400
.globl y
y: .word 2800

.section .bss
.globl f
f: .word
.globl i
i: .word
.globl g
g: .hword
.globl h
h: .hword
.globl j
j: .word
.globl z
z: .word

.section .text
.globl main
main:
la $t5, a
lbu $t5, 0($t5) # t5 je a
addi $t0, $t5, 190 # t0 je f = a + 190

la $t2, b
lb $t2, 0($t2)
addi $t1, $t2, -12 # t1 je g = b - 12

la $t3, c
lbu $t3, 0($t3)
addi $t2, $t3, 15

la $t3, d
lhu $t3, 0($t3)
ori $t9, $0, 45000
sub $t3, $t3, $t9

la $t4, d
lh $t4, 0($t4)
ori $t9, $0, 45000
sub $t4, $t4, $t9

la $t8, x
la $t9, y
lw $t8, 0($t8)
lw $t9, 0($t9)
add $t5, $t8, $t9

addiu $v0, $0, 0
jr $ra