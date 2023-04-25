.section .text
.globl partition
partition:
  slti $t0, $a1, 2
  beq $t0, $0, impl
  jr $ra
impl:
  addiu $sp, $sp, -64
  sw $ra, 60($sp)
  sll $a1, $a1, 2
  addu $a1, $a0, $a1
  addiu $a1, $a1, -4
  jal part_impl
  lw $ra, 60($sp)
  addiu $sp, $sp, 64
  jr $ra

.globl part_impl
part_impl:
  bne $a0, $a1, impl1
  jr $ra
impl1:
  addiu $sp, $sp, -64
  sw $ra, 60($sp)
  sw $a0, 56($sp)
  sw $a1, 52($sp)
  sw $a2, 48($sp)
  lw $a0, 0($a0)
  jalr $a2
  lw $ra, 60($sp)
  lw $a0, 56($sp)
  lw $a1, 52($sp)
  lw $a2, 48($sp)
load:
  beq $v0, $0, else
  lw $t0, ($a0)
  lw $t1, ($a1)
  sw $t0, ($a1)
  sw $t1, ($a0)
  addiu $a1, $a1, -4
  j rekurzija
else:
  addiu $a0, $a0, 4
rekurzija:
  jal part_impl
  lw $ra, 60($sp)
  addiu $sp, $sp, 64
  jr $ra



