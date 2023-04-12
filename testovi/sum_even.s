.section .text
.globl sum_even
sum_even:
  andi $v0, $0, 0       # postavi povratni registar na nulu za sumiranje
  addiu $t9, $0, 0      # counter for for loop
loop:
  slt $t8, $t9, $a1     # je li counter manji od broja elemenata
  beq $t8, $0, napolje  # ako je rezultat poredjenja 0, izadji
  lh $t1, 0($a0)        # ucitaj 16bita iz $a0
  andi $t2, $t1, 1      # provjeri da li je LSB nula
  bne $t2, $0, skip     # ako nije, skipaj dodavanje
  addu $v0, $v0, $t1    # dodaj arr[i] na sumu
skip:
  addiu $a0, $a0, 2     # inkrementiraj adresu citanja
  addiu $t9, $t9, 1     # inkrementuj brojac
  j loop                # vrati se u petlju
napolje:
  jr $ra                
