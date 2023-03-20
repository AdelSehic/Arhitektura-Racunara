.section .data
.globl str
str: .byte 'd', 'l', 'k', 'a', 'd', '\0'
.globl result
result: .byte # ako ovdje ispisem 1 znaci da je palindrom, 0 nije

.section .text
.globl main
main:
    addi $t0, $0, '\0'  # za uporedjivanje
    la $t8, str         # pocetna adresa niza

    la $t9, str         # zadnji karakter niza (bice)
    j label1
    find_end:           # da ispostujem null-terminiran niz
        addi $t9, $t9, 1
        label1:
        lb $t1, 1($t9)  # ucitaj sljedeci karakter
    bne $t0, $t1, find_end

    # nasao sam adresu zadnjeg karaktera niza, sad trebam uporediti

    addi $t3, $0, 0    # izlazna vrijednost/bool

    palindrom_check:
        lb $t4, 0($t8)
        lb $t5, 0($t9)
        bne $t4, $t5, sacuvaj_vrijednost # ako su razliciti, idi na kraj
        addi $t8, $t8, 1
        addi $t9, $t9, -1
    ble $t8, $t9, palindrom_check # loopaj sve dok je prva < druga

    addi $t3, $0, 1    # ako je doso dovde, rezultat je 1

    sacuvaj_vrijednost:
    la $t0, result
    sw $t3, 0($t0)

    addiu $v0, $0, 0
    jr $ra