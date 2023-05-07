.section .text
.globl bar
bar:
        c.lt.s $f12, $f14
        bc1f elseif

        ceil.w.s $f12, $f12
        round.w.s $f14, $f14
        lwc1 $f4, ($sp)
        lwc1 $f5, 4($sp)
        trunc.w.d $f4, $f0      # cvt je takodjer okej

        mfc1 $t0, $f12
        mfc1 $t1, $f14
        mfc1 $t2, $f4

        sll $t0, $t0, 1
        subu $t0, $t0, $t1
        addu $t0, $t2, $t0

        mtc1 $t0, $f0
        cvt.s.w $f0, $f0

        jr $ra

    elseif:

        c.eq.s $f12, $f14
        bc1f else

        ceil.w.s $f12, $f12
        floor.w.s $f14, $f14
        lwc1 $f4, ($sp)
        lwc1 $f5, 4($sp)
        trunc.w.d $f4, $f0      # cvt je takodjer okej

        mfc1 $t0, $f12
        mfc1 $t1, $f14
        mfc1 $t2, $f4

        subu $t0, $t0, $t1
        addu $t0, $t2, $t0

        mtc1 $t0, $f0
        cvt.s.w $f0, $f0

        jr $ra

    else:

        l.d $f4, ($sp)
        cvt.s.d $f0, $f0

        jr $ra