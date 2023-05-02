.section .rodata
format: .asciiz "foo(%d, %d), %hd\n"

.section .text
.globl main
main:

    addiu $sp, $sp, -16
    sw  $ra, 12($sp)

    addiu $s0, $0, 2
    for1:
        slti $t9, $s0, 6
        beq $t9, $0, exit1

        addiu $s1, $0, 3
        for2:
            slti $t9, $s1, 7
            beq $t9, $0, exit2

            addu $a0, $a0, $0
            addu $a1, $s1, $0
            jal foo

            la   $a0, format
            addu $a1, $0, $s0
            addu $a2, $0, $s1
            addu $a3, $v0, $0
            jal printf

            addiu $s1, $s1, 1
            j for2
        exit2:
        
        addiu $a0, $a0, 1
        j for1
    exit1:

    lw $ra, 12($sp)
    addiu $sp, $sp, 16

    addiu $v0, $0, 0
    jr $ra
