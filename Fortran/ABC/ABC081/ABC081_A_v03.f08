! [contest]  ABC 081
! [task]     A
! [URL]      https://atcoder.jp/contests/abc081/tasks/abc081_a
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abs/submissions/6120438 : AC
! 
module ABC081

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_A
  private :: evaluate_list

  ! variables for this <module>
  integer(INT32), parameter, private :: len_list = 3_INT32

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_A

    ! arrays for this <subroutine>
    integer(INT32), dimension(1:len_list) :: list

    ! STEP.01
    ! read out the given integers
    read(unit=INPUT_UNIT, fmt='(3(I1))') list(:)

    ! STEP.02
    ! output the answer
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') evaluate_list(list(:))

    ! STEP.END
    return

  end subroutine task_A

  pure function evaluate_list (list) result(retval)

    ! arguments for this <function>
    integer(INT32), intent(in), dimension(:) :: list

    ! return value of this <function>
    integer(INT32) :: retval

    retval = sum(list(:), dim=1)
    return

  end function evaluate_list

end module ABC081


program main

  ! <module>s to import
  use, non_intrinsic :: ABC081

  ! require all variables to be explicitly declared
  implicit none

  call task_A

end program main
