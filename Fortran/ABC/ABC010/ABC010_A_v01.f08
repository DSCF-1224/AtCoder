! AtCoder Beginner Contest 010 A
! [URL]        https://atcoder.jp/contests/abc010/tasks/abc010_1
! [compiler]   fortran (gfortran v4.8.4)
! [submission] https://atcoder.jp/contests/abc010/submissions/4615490 : AC

program main

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! variables for this <program>
  character(len=10, kind=1) :: buf_HandleName

  ! STEP.01
  ! read out the target handle name
  read (unit=INPUT_UNIT, fmt='(A)') buf_HandleName

  ! STEP.02
  ! output the result
  write (unit=OUTPUT_UNIT, fmt='(A)', advance='yes') trim (buf_HandleName) // 'pp'

end program main
