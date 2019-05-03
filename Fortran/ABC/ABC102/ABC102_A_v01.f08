! [contest]  ABC 102
! [task]     A
! [URL]      https://atcoder.jp/contests/abc102/tasks/abc102_a
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc102/submissions/5247580 : AC

module ABC102

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_A

  ! variables for this <module>
  integer(INT32) :: integer_target

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_A

    ! variables for this <subroutine>
    integer :: iter

    ! STEP.01
    ! read out the target integer
    read(unit=INPUT_UNIT, fmt=*) integer_target

    ! STEP.02
    ! calculate the least multiple of `2` and `integer_target`
    if (mod(integer_target, 2_INT32) .ne. 0_INT32) integer_target = integer_target + integer_target

    ! STEP.03
    ! output the least multiple of `2` and `integer_target`
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') integer_target

    ! STEP.END
    return

  end subroutine task_A

end module ABC102


program main

  ! <module>s to import
  use, non_intrinsic :: ABC102

  ! require all variables to be explicitly declared
  implicit none

  call task_A

end program main
