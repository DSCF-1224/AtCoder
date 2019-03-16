! AtCoder Beginner Contest 004 A
! [URL]      https://atcoder.jp/contests/abc004/tasks/abc004_1
! [compiler] fortran (gfortran v4.8.4)
! [status]   AC

program main

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! variables for this <program>
  integer (kind=INT32) :: value

  ! STEP.01
  read (unit=INPUT_UNIT, fmt=*) value

  ! STEP.02
  write (unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') 2 * value

end program main
