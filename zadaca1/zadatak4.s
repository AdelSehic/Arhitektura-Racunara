.section .data
.globl niz
    niz: .word 1,2,3,4,5,6
    kraj_niza: 
.globl result
    result: .word 0

.section .text
.globl main
main:
    la $t0, niz         # adresa niza
    la $t1, kraj_niza   # adresa kraja niza
    
    # trebamo provjeriti da li je niz sortiran
    sub $t1, $t1, 4     # zbog nacina na koji radi petlja ovo je neophodno
    loop:
        lw $t2, 0($t0)
        lw $t3, 4($t0)
        ble $t3, $t2, nije_sortiran
        addi $t0, $t0, 4
    bne $t0, $t1, loop

    la $t0, niz         # adresa niza
    la $t1, kraj_niza   # adresa kraja niza

    sub $t8, $t1, $t0   # razlika adresa, broj bita u nizu
    srl $t9, $t8, 3     # "index" srednjeg elementa
    andi $t4, $t8, 1    # provjeri je li broj neparan

    bne $t4, $0, neparni
        add $t7, $t0, $t8
        lw $t9, 0($t7)
        lw $t7, -4($t7)
        add $t7, $t7, $t9
        srl $t7, $t7, 1
        la $t4, result
        sw $t7, 0($t4)
        j returnnula
    neparni:
        add $t7, $t8, $t0   # dodaj broj bytea na adresu
        lw $t7, 0($t7)      # ucitaj podatke iz te adrese u nizu
        la $t5, result      # ucitaj adresu rezultata
        sw $t7, 0($t5)      # zapisi iz niza u memoriju
        j returnnula

    nije_sortiran:
        andi $t9, $t9, 0
        lui $t9, 0xDEAD
        ori $t9, $t9, 0x0000FA11
        la $t8, result
        sw $t9, 0($t8)

    returnnula:
        addiu $v0, $0, 0
        jr $ra