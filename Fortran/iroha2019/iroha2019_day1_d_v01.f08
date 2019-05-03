! [contest]    いろはちゃんコンテスト 2019 Day1
! [task]       D
! [URL]        https://atcoder.jp/contests/iroha2019-day1/tasks/iroha2019_day1_d
! [compiler]   fortran (gfortran v4.8.4)
! [submission] https://atcoder.jp/contests/iroha2019-day1/submissions/5238501 : AC

module iroha2019

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_day1_d

  ! constants for this <module>
  integer, parameter, private :: num_field_wrestler_max = 100

  ! variables for this <module>
  integer, private :: num_field_wrestler
  integer, private :: power_Takahashi
  integer, private :: power_Aoki
  integer, private :: power_field_wrestler(1:num_field_wrestler_max)

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_day1_d

    ! support variables for this <subroutine>
    integer :: iter

    ! STEP.01
    ! read out the number of field wrestlers
    ! read out the power  of Takahashi
    ! read out the power  of Aoki
    read(unit=INPUT_UNIT, fmt=*) num_field_wrestler, power_Takahashi, power_Aoki

    ! STEP.02
    ! read out the power of field wrestlers
    read(unit=INPUT_UNIT, fmt=*) power_field_wrestler(1:num_field_wrestler)

    ! STEP.03
    ! calculate the total power of Takahashi side
    ! calculate the total power of Aoki      side
    do iter = 1, num_field_wrestler, 1

      if (mod(iter, 2) .eq. 0) then
        power_Aoki = power_Aoki + maxval(power_field_wrestler(:), dim=1)
      else
        power_Takahashi = power_Takahashi + maxval(power_field_wrestler(:), dim=1)
      end if

      power_field_wrestler(maxloc(power_field_wrestler(:), dim=1)) = 0

    end do

    ! STEP.04
    ! output the winner/draw
    if (power_Takahashi .gt. power_Aoki) then
      write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') 'Takahashi'
    else if (power_Takahashi .lt. power_Aoki) then
      write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') 'Aoki'
    else
      write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') 'Draw'
    end if

    ! STEP.END
    return

  end subroutine task_day1_d

end module iroha2019

program main

  ! <module>s to import
  use, non_intrinsic :: iroha2019

  ! require all variables to be explicitly declared
  implicit none

  call task_day1_d

end program main
