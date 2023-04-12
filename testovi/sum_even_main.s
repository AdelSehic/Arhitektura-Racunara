.section .data
.globl array
array: .hword 11,1,7,332,100,50

#.section .rodata
format: .asciiz "Even_numbers:%d\n"

.section .text
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
