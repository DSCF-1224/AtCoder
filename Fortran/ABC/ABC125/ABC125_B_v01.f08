! [contest]  ABC 125
! [task]     B
! [URL]      https://atcoder.jp/contests/abc125/tasks/abc125_b
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc125/submissions/5242540 : AC

module ABC125

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_B

  ! constants for this <program>
  integer, parameter, private :: num_jewels_max = 20

  ! variables for this <module>
  integer, private :: num_jewels
  integer, private :: benefit

  ! arrays for this <module>
  integer, dimension(1:num_jewels_max), private :: value, cost

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_B

    ! variables for this <subroutine>
    integer :: benefit_each

    ! support variables for this <subroutine>
    integer :: iter

    ! STEP.01
    ! read out the number of     the jewels
    ! read out the value  of     the jewels
    ! read out the cost   to get the jewels
    read(unit=INPUT_UNIT, fmt=*) num_jewels
    read(unit=INPUT_UNIT, fmt=*) value(1:num_jewels)
    read(unit=INPUT_UNIT, fmt=*) cost (1:num_jewels)

    ! STEP.02
    ! calculate the maximum benefit
    benefit_each = 0

    do iter = 1, num_jewels, 1
      benefit_each = value(iter) - cost(iter)
      if (benefit_each .gt. 0) benefit = benefit + benefit_each
    end do

    ! STEP.02
    ! output the benefit
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') benefit

    ! STEP.END
    return

  end subroutine task_B

end module ABC125


program main

  ! <module>s to import
  use, non_intrinsic :: ABC125

  ! require all variables to be explicitly declared
  implicit none

  call task_B

end program main
