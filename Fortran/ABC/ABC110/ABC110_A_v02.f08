! [contest]  ABC 110
! [task]     A
! [URL]      https://atcoder.jp/contests/abc110/tasks/abc110_a
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc110/submissions/6398931 : AC

module ABC110

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_A
  private :: calculate_maximum_allowance

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_A

    ! variables for this <subroutine>
    integer(INT8) :: A, B, C

    ! STEP.01
    ! read out the given data
    read(unit=INPUT_UNIT, fmt=*) A, B, C

    ! STEP.02
    ! calculate & output the answer of the task
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') calculate_maximum_allowance (A, B, C)

    ! STEP.END
    return

  end subroutine task_A

  pure function calculate_maximum_allowance (A, B, C) result(allowance)

    ! arguments for this <function>
    integer(INT8), intent(in) :: A, B, C

    ! return value of this <function>
    integer(INT8) :: allowance

    allowance = max(A, B, C) * 9_INT8 + sum([A, B, C])

    return

  end function calculate_maximum_allowance

end module ABC110


program main

  ! <module>s to import
  use, non_intrinsic :: ABC110

  ! require all variables to be explicitly declared
  implicit none

  call task_A

end program main
