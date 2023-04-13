.section .text
.globl to_binary
to_binary:
  addi $t1, $0, 31    # loop counter
  and $v0, $0, $v0    # iterations counter
loop:
  beq $a1, $0, end    # kada drugi element dosegnu nulu, kraj
  andi $t2, $a0, 1    # temp = b&1 - izvuci zadnji bit
  sll $t4, $t1, 2     # 1*2*2 - 4 bits, 1 byte - char
  add $t3, $a0, $t4   # $t3 == a[i]
  addi $t2, $t2, '0'  # $t2 == temp+'0'
  sb $t2, 0($t3)      # a[i]=temp+'0'
  srl $a1, $a1, 1     # b >>= 1
  addiu $v0, $v0, 1   # ++iterations
  addiu $t1, $t1, -1  # --i
  j loop
end:
  jr $ra
