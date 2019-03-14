! AtCoder Beginner Contest 120 A
! [URL]      https://atcoder.jp/contests/abc120/tasks/abc120_a
! [compiler] fortran (gfortran v4.8.4)
! 
program main

  ! <module> to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none
    
  ! variables for this <program>
  integer(kind=INT8) :: A, B, C
  
  ! STEP.01
  ! read out the data
  read *, A, B, C
  
  ! STEP.02
  ! output the result
  print '(I0)', min (B/A, C)

end program main
