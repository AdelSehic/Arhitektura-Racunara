.section .rodata
format: .asciiz "foo(%d, %d), %hd\n"

.section .text
.globl main
main:

    addiu $sp, $sp, -16
    sw  $ra, 12($sp)

    addiu $t0, $0, 2
    for1:
        sw $t0, 8($sp)
        slti $t9, $t0, 6
        beq $t9, $0, exit1

        addiu $t1, $0, 3
        for2:
            sw $t1, 4($sp)
            slti $t9, $t1, 7
            beq $t9, $0, exit2

            addu $a0, $t0, $0
            addu $a1, $t1, $0
            jal foo

            la   $a0, format
            lw $a1, 8($sp)
            lw $a2, 4($sp)
            addu $a3, $v0, $0
            jal printf

            lw $t0, 8($sp)
            lw $t1, 4($sp)
            addiu $t1, $t1, 1
            j for2
        exit2:
        lw $t0, 8($sp)
        addiu $t0, $t0, 1
        j for1
    exit1:

    lw $ra, 12($sp)
    addiu $sp, $sp, 16

    addiu $v0, $0, 0
    jr $ra
