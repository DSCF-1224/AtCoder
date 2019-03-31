! [contest]    CADDi 2018
! [task]       C
! [URL]        https://atcoder.jp/contests/caddi2018/tasks/caddi2018_a
! [compiler]   fortran (gfortran v4.8.4)
! [submission] NOT submitted

program CADDi2018_C

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! variables for this <program>
  integer(kind=INT64) :: num_integers
  integer(kind=INT64) :: val_product

  ! support variables for this <program>
  integer :: itr

  ! STEP.01
  ! read out the number of usable plates & wanted width and height of plates
  read(unit=INPUT_UNIT, fmt=*) num_integers, val_product

  print '(I0,1X,I0)', num_integers, val_product

end program CADDi2018_C
