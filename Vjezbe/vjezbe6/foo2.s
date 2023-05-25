.section .text
.global foo
foo:
  mtc1    $a1,  $f6
  cvt.d.w $f4,  $f6
  c.lt.s  $f12, $f4
  bc1f    else
  cvt.d.s $f12, $f12
  mtc1    $a1,  $f6
  cvt.d.w $f6,  $f6
  add.d   $f0,  $f6,  $f12
  jr      $ra

else:
  


  sub.s   $f0,  $f4,  $f12
  cvt.d.s $f0,  $f0
  jr      $ra
  
