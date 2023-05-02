.section .text
.globl foo
foo:
    slti $t1, $a0, 2        # if a < 2
    addiu $v0, $0, 0
    bne $t1, $0, return
    
    slti $t1, $a1, 3   # elseif b < 3
    addiu $v0, $0, 1
    bne $t1, $0, return

    # u prethodna dva koraka se funkcija ponasala iskljucivo kao calee
    # znaci da nam alociranje memorije nije potrebno
    # dalje to nije slucaj 
    
    addiu $sp, $sp, -16 # priprema stack framea
    sw $ra, 12($sp)     # neophodno je jer funkcija postaje caller
    sh $a0, 10($sp)
    sh $a1, 8($sp)

    slt $t1, $a0, $a1
    beq $t1, $0, else   # ako je a<b odradi....
        addiu $a0, $a0, -1
        addiu $a1, $a1, -3
        jal foo
        lh $a0, 10($sp)
        addu $v0, $v0, $a0
        j restore       # ...pa idi na kraj
    else:
        addiu $a0, $a0, -2
        addiu $a1, $a1, -1
        jal foo
        lh $a0, 10($sp)
        lh $a1, 8($sp)
        subu $t0, $a0, $a1
        addu $v0, $v0, $t0

    restore:
        lw $ra, 12($sp)
        lh $a0, 10($sp)
        lh $a1, 8($sp)
        addiu $sp, $sp, 16

    return:
        jr $ra