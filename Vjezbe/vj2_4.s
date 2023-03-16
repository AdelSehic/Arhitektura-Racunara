.section .text
.globl main
main:
    lui $t0, 0x7FFF
    ori $t0, $t0, 0xFFF0

    addiu $t0, $t0, 20

    addiu $v0, $0, 0
    jr $ra

    # srl - shift right logical
    # sll - shift left logical
    # sra - shitft right arithmetic