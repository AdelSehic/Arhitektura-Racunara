.section .data
d: .double 10.25

.section .text
.global foo
foo:
  mtc1      $a0,  $f4  
  cvt.d.w   $f4,  $f4
  
  mtc1      $a2,  $f6
  mtc1      $a3,  $f7

  c.lt.d    $f6,  $f4
  bc1f      elseif
  add.d     $f0,  $f4,  $f6
  
  la        $t0,  d
  lwc1      $f8,  ($t0)
  lwc1      $f9,  4($t0)

  sub.d     $f0,  $f0,  $f8
  
  jr $ra

elseif:
  c.eq.d    $f6,  $f4
  cd1f  return

  add.d   $f0,  $f6,  $f6

  jr $ra

return:
  add.d   $f0,  $f6,  $f4
  
  la        $t0,  d
  lwc1      $f8,  ($t0)
  lwc1      $f9,  4($t0)

 
  la      $t0,  d
  lwc1    $f8,  ($t0)
  lwc1    $f9,  4($t0)

  add.d   $f0,  $f0,  $f8

  jr $ra 




