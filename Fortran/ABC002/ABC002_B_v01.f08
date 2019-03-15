! AtCoder Beginner Contest 001 A
! [URL]      https://atcoder.jp/contests/abc002/tasks/abc002_1
! [compiler] fortran (gfortran v4.8.4)
! 
program ABC001_B

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! variables for this <program>
  character(len=30, kind=1) :: buf_data
  integer(kind=INT8)        :: len_data

  ! support variables for this <program>
  integer( kind=INT16 ) :: itr

  ! STEP.01
  ! read the target data
  read *, buf_data

  ! STEP.02
  ! get the length of the data string
  len_data = len_trim (buf_data)

  ! output the bigger one
  do itr = 1, len_data, 1

    if      ( iachar ( buf_data(itr:itr) ) .eq. iachar ('a') ) then; continue
    else if ( iachar ( buf_data(itr:itr) ) .eq. iachar ('i') ) then; continue
    else if ( iachar ( buf_data(itr:itr) ) .eq. iachar ('u') ) then; continue
    else if ( iachar ( buf_data(itr:itr) ) .eq. iachar ('e') ) then; continue
    else if ( iachar ( buf_data(itr:itr) ) .eq. iachar ('o') ) then; continue
    else
      write(unit=OUTPUT_UNIT, fmt='(A1)', advance='no') buf_data(itr:itr)
    end if

  end do

  write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') ''

end program ABC001_B
