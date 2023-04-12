.section .data
.globl array
array: .hword 11,1,7,332,100,50

#.section .rodata
format: .asciiz "Even_numbers:%d\n"

.section .text
.globl sum_even
sum_even:
  andi $v0, $0, 0      # postavi povratni registar na nulu
  addiu $t9, $0, 0     # counter for for loop
loop:
  slt $t8, $t9, $a1    # je li counter manji od broja elemenata
  bne $t8, $0, napolje # ako je rezultat poredjenja 0, izadji
  lh $t1, 0($a0)       # ucitaj 16bita iz $a0
  andi $t2, $t1, 1
  beq $t2, $0, skip
  addu $v0, $v0, $t1
skip:
  addiu $a0, $a0, 2
  addiu $t9, $t9, 1
  j loop
napolje:
  jr $ra
  
.globl main
main:
  addiu $sp, $sp, -64
  sw $ra, 60($sp)
  la $a0, array
  addiu $a1, $0, 6
  jal sum_even
  la $a0, format
  addu $a1, $0, $v0
  jal printf
  lw $ra, 60($sp)
  addiu $sp, $sp, 64

  addiu $v0, $0, 0
  jr $ra
