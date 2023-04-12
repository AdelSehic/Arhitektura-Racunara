.section .data
.globl array
array: .hword 11,1,7,332,100,50

#.section .rodata
format: .asciiz "Even_numbers:%d\n"

.section .text
.globl main
main:
  addiu $sp, $sp, -64 # zauzmi stacka
  sw $ra, 60($sp)     # sacuvaj ra na stacku
  la $a0, array       # ucitaj adresu niza na prvi argument
  addiu $a1, $0, 6    # ucitaj velicinu na drugi argument
  jal sum_even        # skoci u funkciju
  la $a0, format      # ucitaj format string u prvi argument
  addu $a1, $0, $v0   # ucitaj povratnu vrijednost prve funkcije u drugi arg
  jal printf          # skoci u printf
  lw $ra, 60($sp)     # obnovi ra registar na orginalnu vrijednost
  addiu $sp, $sp, 64  # obnovi stack pointer na orginalnu vrijednost

  addiu $v0, $0, 0
  jr $ra
