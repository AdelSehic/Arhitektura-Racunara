.section .rodata
str: .asciiz "p = %f\n"

.section .text
.globl main
main:
  addiu $sp, $sp, -64
  sw $ra, 60($sp)
  # 10.2 = 1010.00110011*
  # exp = 127 + 3 = 130
  # man = 01000110011
  # 130 = 0...10000010
  # f: 01000001001000110011
  # 0x41233333
  lui $t0, 0x4123
  ori $t0, $t0, 0x3333
  sw $t0, 56($sp)
  addiu $a0, $sp, 56
  jal foo
  la $a0, str
  lwc1 $f4, 56($sp)
  cvt.d.s $f4, $f4
  mfc1 $a2, $f4
  mfc1 $a3, $f5
  jal printf

  lw $ra, 60($sp)
  addiu $sp, $sp, 64
  jr $ra



