! [contest]    AtCoder Beginner Contest 010
! [task]       B
! [URL]        https://atcoder.jp/contests/abc010/tasks/abc010_2
! [compiler]   fortran (gfortran v4.8.4)
! [submission] NOT submitted

module ABC010

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! constants for this <module>
  integer (kind=INT32), private, parameter :: num_flowers_max = 10_INT32

  ! variables for this <module>
  integer (kind=INT8), public :: num_flowers
  integer (kind=INT8), public :: num_petals(1:num_flowers_max)

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine ABC010_B

    ! variables for this <subroutine>
    integer (kind=INT32) :: itr_elem

    ! STEP.01
    ! read out the number of flowers
    read (unit=INPUT_UNIT, fmt=*) num_flowers

    ! STEP.02
    ! read out the numbers of the petals
    read (unit=INPUT_UNIT, fmt=*) num_petals(1:num_flowers)

    print *, num_petals(:)

    ! STEP.END
    return

  end subroutine ABC010_B

end module ABC010

program main

  ! <module>s to import
  use, non_intrinsic :: ABC010

  call ABC010_B

end program main
