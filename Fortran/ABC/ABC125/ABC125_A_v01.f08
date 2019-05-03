! [contest]  ABC 125
! [task]     A
! [URL]      https://atcoder.jp/contests/abc125/tasks/abc125_a
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc125/submissions/5241651 : AC

module ABC125

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_A

  ! variables for this <module>
  integer, private :: step_production
  integer, private :: num_production
  integer, private :: time_end

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_A

    ! STEP.01
    ! read out the given data
    read(unit=INPUT_UNIT, fmt=*) step_production, num_production, time_end

    ! STEP.02
    ! calculate & output the summation
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') time_end / step_production * num_production

    ! STEP.END
    return

  end subroutine task_A

end module ABC125


program main

  ! <module>s to import
  use, non_intrinsic :: ABC125

  ! require all variables to be explicitly declared
  implicit none

  call task_A

end program main
