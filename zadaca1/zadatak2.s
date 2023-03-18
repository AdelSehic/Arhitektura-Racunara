.section .data
.globl number
number: .word 10
.globl result
result: .word 0

.section .text
.globl main
main:

    la $t0, number
    lw $t0, 0($t0)

    # check if even
    andi $t1, $t1, 1
    xori $t1, $t1, 1 

    # pomnozi sa 22
    sll $t2, $t0, 4
    sll $t3, $t0, 2
    add $t2, $t2, $t3
    sll $t3, $t0, 1
    add $t2, $t2, $t3

    # pomnozi sa 7
    sll $t3, $t0, 3
    sub $t3, $t3, $t0

    # modulo 8
    addi $t4, $t0, -8

    # modulo 32

    la $t2, result
    sw $t1, 0($t2)

    addiu $v0, $0, 0
    jr $ra