! [contest]  ABC 130
! [task]     A
! [URL]      https://atcoder.jp/contests/abc130/tasks/abc130_a
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc130/submissions/5989576 : AC

module ABC130

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_A
  private :: calculate_answer

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_A

    ! variables for this <subroutine>
    integer(INT8) :: X, A

    ! STEP.01
    ! read out the given integer
    read(unit=INPUT_UNIT, fmt=*) X, A

    ! STEP.02
    ! output the result
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') calculate_answer (X, A)

    ! STEP.END
    return

  end subroutine task_A

  pure function calculate_answer (data_X, data_A) result(answer)

    ! arguments for this <function>
    integer(INT8), intent(in) :: data_X, data_A

    ! return value of this <function>
    integer(INT8) :: answer

    if (data_X .lt. data_A) then
      answer = 0_INT8
    else
      answer = 10_INT8
    end if

    return

  end function calculate_answer

end module ABC130


program main

  ! <module>s to import
  use, non_intrinsic :: ABC130

  ! require all variables to be explicitly declared
  implicit none

  call task_A

end program main
