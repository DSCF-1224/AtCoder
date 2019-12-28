! [contest]  JSC 2019
! [task]     C
! [URL]      https://atcoder.jp/contests/jsc2019-qual/tasks/jsc2019_qual_c
! [compiler] fortran (gfortran v4.8.4)
! [status]   NOT Submitted

module JSC2019

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_C

  ! constants for this <moduee>
  integer(INT32), parameter, private :: num_square_max = 10_INT32 ** 5_INT32 * 2_INT32
  integer(INT64), parameter, private :: val_divisor    = 10_INT64 ** 9_INT64 + 7_INT64

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_C

    ! variables for this <subroutine>
    integer(INT32) :: num_square
    integer(INT32) :: num_operation

    ! arrays for this <subroutine> 
    character(len=num_square_max, kind=1) :: given_string

    ! support variables for this <subroutine>

    ! STEP.01
    ! read the given data
    ! 1. length of the given sequence
    ! 2. the number of copies of given sequence
    read(unit=INPUT_UNIT, fmt=*)     num_square
    read(unit=INPUT_UNIT, fmt='(A)') given_string

    ! STEP.05
    ! output the answer of this task
    write(unit=OUTPUT_UNIT, fmt='(A)',  advance='yes') trim(given_string)
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') len(given_string)
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') len_trim(given_string)

    ! STEP.END
    return

  end subroutine task_C

end module JSC2019


program main

  ! <module>s to import
  use, non_intrinsic :: JSC2019

  ! require all variables to be explicitly declared
  implicit none

  call task_C

end program main

! EOF
