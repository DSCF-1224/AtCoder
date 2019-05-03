! AtCoder Beginner Contest 005 A
! [URL]      https://atcoder.jp/contests/abc005/tasks/abc005_1
! [compiler] fortran (gfortran v4.8.4)
! [status]   AC : https://atcoder.jp/contests/abc005/submissions/4593320

program ABC005_A

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! variables for this <program>
  integer (kind=INT8) :: x, y

  ! STEP.01
  ! read the target data
  read (unit=INPUT_UNIT, fmt=*) x, y

  ! STEP.02
  ! output the bigger one
  write (unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') y/x

end program ABC005_A
