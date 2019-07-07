! [contest]  ABC 133
! [task]     A
! [URL]      https://atcoder.jp/contests/abc133/tasks/abc133_a
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc133/submissions/6269718 : AC

module ABC133

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
    integer(INT32) :: num_traveler
    integer(INT32) :: cost_train
    integer(INT32) :: cost_taxi

    ! STEP.01
    ! read out the given data
    read(unit=INPUT_UNIT, fmt=*) num_traveler, cost_train, cost_taxi

    ! STEP.02
    ! output the answer of this task
    write(unit=OUTPUT_UNIT, fmt='(I0)') min(num_traveler * cost_train, cost_taxi)

    ! STEP.END
    return

  end subroutine task_A

end module ABC133

program main

  ! <module>s to import
  use, non_intrinsic :: ABC133

  ! require all variables to be explicitly declared
  implicit none

  call task_A

end program main
