! [contest]    いろはちゃんコンテスト 2019 Day1
! [task]       A
! [URL]        https://atcoder.jp/contests/iroha2019-day1/tasks/iroha2019_day1_a
! [compiler]   fortran (gfortran v4.8.4)
! [submission] https://atcoder.jp/contests/iroha2019-day1/submissions/5236921 : AC

module iroha2019

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_day1_a

  ! constants for this <module>
  integer, parameter, private :: len_string_max = 100

  ! variables for this <module>
  character(len=len_string_max, kind=1), private :: given_string

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_day1_a

    ! STEP.01
    ! read out the given string
    read(unit=INPUT_UNIT, fmt='(A)') given_string

    ! STEP.02
    ! output the first character of the given string
    write(unit=OUTPUT_UNIT, fmt='(A1)', advance='yes') given_string(1:1)

    ! STEP.END
    return

  end subroutine task_day1_a

end module iroha2019

program main

  ! <module>s to import
  use, non_intrinsic :: iroha2019

  ! require all variables to be explicitly declared
  implicit none

  call task_day1_a

end program main
