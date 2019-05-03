! [contest]    いろはちゃんコンテスト 2019 Day1
! [task]       B
! [URL]        https://atcoder.jp/contests/iroha2019-day1/tasks/iroha2019_day1_b
! [compiler]   fortran (gfortran v4.8.4)
! [submission] https://atcoder.jp/contests/iroha2019-day1/submissions/5237036 : AC

module iroha2019

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_day1_b

  ! constants for this <module>
  integer, parameter, private :: len_string_max = 1000

  ! variables for this <module>
  character(len=len_string_max, kind=1), private :: given_string
  integer,                               private :: num_shifts

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_day1_b

    ! STEP.01
    ! read out the given string
    read(unit=INPUT_UNIT, fmt='(A)') given_string

    ! STEP.02
    ! read out the number of times to shift
    read(unit=INPUT_UNIT, fmt=*) num_shifts

    ! STEP.03
    ! minimize the number of the shift operations
    num_shifts = mod(num_shifts, len_trim(given_string(:)))

    ! STEP.04
    ! output the shifted string
    write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') trim(given_string(num_shifts+1:)) // given_string(1:num_shifts)

    ! STEP.END
    return

  end subroutine task_day1_b

end module iroha2019

program main

  ! <module>s to import
  use, non_intrinsic :: iroha2019

  ! require all variables to be explicitly declared
  implicit none

  call task_day1_b

end program main
