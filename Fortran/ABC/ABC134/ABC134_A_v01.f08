! [contest]  ABC 134
! [task]     ?
! [URL]      https://atcoder.jp/contests/abc134/tasks/abc134_a
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc134/submissions/6450987 : AC

module ABC134

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_A
  private :: calculate_area

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_A

    ! variables for this <subroutine>
    integer(INT32) :: radius

    ! STEP.01
    ! read out the given data
    read(unit=INPUT_UNIT, fmt=*) radius

    ! STEP.02
    ! calculate & output the answer of this task
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') calculate_area (radius)

    ! STEP.END
    return

  end subroutine task_A

  pure function calculate_area (radius) result(area)

    ! arguments for this <function>
    integer(INT32), intent(in) :: radius

    ! return value of this <function>
    integer(INT32) :: area

    area = 3_INT32 * radius * radius
    return

  end function calculate_area

end module ABC134


program main

  ! <module>s to import
  use, non_intrinsic :: ABC134

  ! require all variables to be explicitly declared
  implicit none

  call task_A

end program main
