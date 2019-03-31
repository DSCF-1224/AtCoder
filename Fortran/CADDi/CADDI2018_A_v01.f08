! [contest]    CADDi 2018 for Beginners
! [task]       A
! [URL]        https://atcoder.jp/contests/caddi2018b/tasks/caddi2018b_a
! [compiler]   fortran (gfortran v4.8.4)
! [submission] https://atcoder.jp/contests/caddi2018b/submissions/4668769 : AC

program CADDi2018_A

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! constants for this <program>
  integer, parameter :: num_digits = 4
  
  ! variables for this <program>
  character(len=4, kind=1) :: digit_char
  integer                  :: num_two

  ! support variables for this <program>
  integer :: itr

  ! STEP.01
  ! read out the target number as a string
  read(unit=INPUT_UNIT, fmt='(A4)') digit_char(1:num_digits)

  ! STEP.02
  ! count up the number of `2`
  num_two = 0

  do itr = 1, num_digits, 1
    if (digit_char(itr:itr) .eq. '2') num_two = num_two + 1
  end do

  ! STEP.03
  ! output the result
  write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') num_two

end program CADDi2018_A
