! [contest]  JSC 2019
! [task]     A
! [URL]      https://atcoder.jp/contests/jsc2019-qual/tasks/jsc2019_qual_a
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/jsc2019-qual/submissions/7143594 : AC

module JSC2019

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_A

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_A

    ! variables for this <subroutine>
    integer(INT32) :: digit01
    integer(INT32) :: digit10
    integer(INT32) :: num_days_per_month
    integer(INT32) :: num_days_product
    integer(INT32) :: num_months_per_year

    ! support variables for this <subroutine>
    integer(INT32) :: itr_day
    integer(INT32) :: itr_month

    ! STEP.01
    ! read the given data
    read(unit=INPUT_UNIT, fmt=*) num_months_per_year, num_days_per_month

    ! STEP.02
    ! initialize the variables for this <subroutine>
    num_days_product = 0_INT32

    ! STEP.03
    ! count up the number of "product days"
    do itr_day = 10_INT32, num_days_per_month,  1_INT32

      digit01 = mod(itr_day, 10_INT32)
      digit10 = (itr_day - digit01) / 10_INT32

      if (digit01 .ge. 2_INT32 .and. digit10 .ge. 2_INT32 .and. digit01 * digit10 .le. num_months_per_year) then
        num_days_product = num_days_product + 1_INT32
      end if

    end do

    ! STEP.04
    ! output the answer of this task
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') num_days_product

    ! STEP.END
    return

  end subroutine task_A

end module JSC2019


program main

  ! <module>s to import
  use, non_intrinsic :: JSC2019

  ! require all variables to be explicitly declared
  implicit none

  call task_A

end program main
