.section .data
.globl d
d: .byte

.section .rodata
format1: .asciiz "%c"
format2: .asciiz "\n"
hi: .asciiz "\nHello world!\n"

.section .text
.globl combinations
combinations:
    subu $sp, $sp, $a2
    la $t0, d
    sw $sp, 0($t0)
    addiu $sp, $sp, -64
    sw $a0, 60($sp)
    sw $a1, 56($sp)
    sw $a2, 52($sp)
    sw $ra, 48($sp)

    addu $a2, $0, $a1
    lw $a1, 52($sp)
    lw $a3, 52($sp)

    jal combinations_impl

    lw $ra, 48($sp)
    lw $a2, 52($sp)
    addu $sp, $sp, $a2
    addiu $sp, $sp, 64
    jr $ra

combinations_impl:

    addiu $sp, $sp, -32
    sw $ra, 28($sp)
    sw $a0, 24($sp)
    sw $a1, 20($sp)
    sw $a2, 16($sp)
    sw $a3, 12($sp)

    bne $a3, $0, skip

    addiu $a0, $a3, 0
    jal print_comb
    j return

    skip: 

    and $t0, $t0, $0
    for:
        sw $t0, 8($sp)
        slt $t9, $t0, $a2
        bne $t0, $0, return
        subu $t1, $a1, $a3
        la $t2, d
        addu $t1, $t2, $t1
        addu $t2, $a0, $t0
        lb $t2, 0($t2)
        sb $t2, 0($t1)
        addiu $a3, $a3, -1
        lw $a3, 12($sp)
        lw $t0, 8($sp)
        addiu $t0, $t0, 1
        j for

return:
    lw $ra, 28($sp)
    addiu $sp, $sp, 32
    jr $ra

print_comb:

    addiu $sp, $sp, -64
    sw $ra, 60($sp)

    and $t0, $t0, $0
    for2:
        sw $t0, 56($sp)
        slt $t9, $t0, $a0
        bne $t9, $0, out
        la $t1, d
        addu $t1, $t1, $t0
        lb $a1, 0($t1)
        la $a0, hi
        jal printf
        lw $t0, 56($sp)
        addiu $t0, $t0, 1
        j for2
    out:
    la $a0, hi
    jal printf

    lw $ra, 60($sp)
    addiu $sp, $sp, 64
    jr $ra