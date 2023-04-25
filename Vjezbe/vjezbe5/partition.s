.section .text
.globl partition
partition:
  slti  $t0, $a1, 2
  beq   $t0, $0, fCall
  jr    $ra
fCall:
  addiu $sp, $sp, -64
  sw $a0, 60($sp)
  sw $a1, 56($sp)
  sw $a2, 52($sp)
  sw $ra, 48($sp)
  addu  $a1, $a0, $a1
  addiu $a1, $a1, -1
  jal part_impl

part_impl:
  lw $t0, 0($a0)
  lw $t1, 0($a1)
  beq $t1, $t0, return
  jalr $a2    # jal isEven
  beq $v0, $0, else1
  lw $t0, ($a0)
  lw $t1, ($a1)
  sw $t0, ($a1)
  sw $t1, ($a0)
  addiu $a1, $a1, -4
else1:
  addiu $a0, $a0, 4
  jal part_impl
  

return:
  jr $ra
