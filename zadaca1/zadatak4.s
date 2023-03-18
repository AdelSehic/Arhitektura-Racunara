.section .data
.globl niz
    niz: .word 1,2,3,4,5
    kraj_niza: 
.globl result
    result: .word

.section .text
.globl main
main:
    la $t0, niz # adresa niza
    la $t1, kraj_niza # adresa kraja niza
    sub $t1, $t1, 4

#    sub $t3, $t1, $t0 # razlika adresa, predstavlja velicinu niza * word
#    rsl $t3, $t3, 2 # velicina niza / 4

#    andi $t4, $t4, 0 # counter varijabla za niz


    # trebamo provjeriti da li je niz sortiran
    loop:
        lw $t2, 0($t0)
        lw $t3, 4($t0)
        ble $t3, $t2, nije_sortiran
        addi $t0, $t0, 4
    bne $t0, $t1, loop

    j returnnula

    nije_sortiran:
        andi $t9, $t9, 0
        lui $t0, 0xDEAD
        addi $t9, $0, 0x0000FA11

    returnnula:
        addiu $v0, $0, 0
        jr $ra