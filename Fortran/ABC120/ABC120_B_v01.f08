! AtCoder Beginner Contest 120 B
! [URL]      https://atcoder.jp/contests/abc120/tasks/abc120_b
! [compiler] fortran (gfortran v4.8.4)
! 
program main

  ! <module> to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none
    
  ! variables for this <program>
  integer(kind=INT8) :: A, B, K
  integer(kind=INT8) :: itr_fctr, fctr_max, counter
  
  ! STEP.01
  ! read out the data
  read *, A, B, K
  
  ! STEP.02
  ! search the target divisor
  fctr_max = min (A, B)
  counter  = 0_INT8
  
  do itr_fctr = fctr_max, 1_INT8, -1_INT8

    if ( mod (A, itr_fctr) .eq. 0_INT8 .and. mod (B, itr_fctr) .eq. 0_INT8 ) counter = counter + 1_INT8

    if (counter .eq. K) then
      print '(I0)', itr_fctr
      exit
    end if

  end do

end program main
