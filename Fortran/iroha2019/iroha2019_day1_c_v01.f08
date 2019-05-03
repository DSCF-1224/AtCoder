! [contest]    いろはちゃんコンテスト 2019 Day1
! [task]       C
! [URL]        https://atcoder.jp/contests/iroha2019-day1/tasks/iroha2019_day1_c
! [compiler]   fortran (gfortran v4.8.4)
! [submission] https://atcoder.jp/contests/iroha2019-day1/submissions/5238170 : AC

module iroha2019

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_day1_c

  ! constants for this <module>
  integer, private :: days_Halcyon      =  8
  integer, private :: date_end_November = 30

  ! variables for this <module>
  integer, private :: date_winter_solstice

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_day1_c

    ! support variables for this <subroutine>
    integer :: date, iter

    ! STEP.01
    ! read out the date of the winter solstice
    read(unit=INPUT_UNIT, fmt=*) date_winter_solstice

    ! STEP.02
    ! output the Halcyon days
    do iter = date_winter_solstice - days_Halcyon + 1, date_winter_solstice, 1

      ! fix the date if the date is on the November
      if (iter .ge. 1) then
        date = iter
      else
        date = date_end_November - iter
      end if

      write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') date

    end do

    ! STEP.END
    return

  end subroutine task_day1_c

end module iroha2019

program main

  ! <module>s to import
  use, non_intrinsic :: iroha2019

  ! require all variables to be explicitly declared
  implicit none

  call task_day1_c

end program main
