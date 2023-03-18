.section .data
.globl niz
    niz: .word 1,2,3,4,5
    kraj_niza: 

.section .text
.globl main
main:
    la $t0, niz # adresa niza
    la $t1, kraj_niza # adresa kraja niza

#    sub $t3, $t1, $t0 # razlika adresa, predstavlja velicinu niza * word
#    rsl $t3, $t3, 2 # velicina niza / 4

#    andi $t4, $t4, 0 # counter varijabla za niz

    loop:
        sw $t

    addiu $v0, $0, 0
    jr $ra