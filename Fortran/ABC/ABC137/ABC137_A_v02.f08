! [contest]  ABC 137
! [task]     A
! [URL]      https://atcoder.jp/contests/abc137/tasks/abc137_a
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc137/submissions/6839721 : AC

module ABC137

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_A

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_A (A, B)

    ! arguments for this <subroutine>
    integer(INT16), intent(in) :: A, B

    ! STEP.01
    ! calculate & output the answer of this task
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') maxval( [A + B, A - B, A * B] )

    ! STEP.END
    return

  end subroutine task_A

end module ABC137


program main

  ! <module>s to import
  use, non_intrinsic :: ABC137

  ! require all variables to be explicitly declared
  implicit none

  ! variables for this <program>
  integer(INT16) :: A, B

  ! STEP.01
  ! read out the given data
  read(unit=INPUT_UNIT, fmt=*) A, B

  ! STEP.02
  ! calculate & output the answer of this task
  call task_A (A, B)

end program main
