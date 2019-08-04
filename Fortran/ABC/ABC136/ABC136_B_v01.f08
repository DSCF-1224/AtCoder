! [contest]  ABC 136
! [task]     A
! [URL]      https://atcoder.jp/contests/abc136/tasks/abc136_b
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc136/submissions/6697136 : AC

module ABC136

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_B
  private :: calculate_solution
  
  contains
  
  subroutine task_B (val_range)

    ! arguments for this <subroutine>
    integer(INT32), intent(in) :: val_range

    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') calculate_solution(val_range)
    
    ! STEP.END
    return

  end subroutine task_B

  recursive function calculate_solution (val_range) result(num_integers_satisfied)

    ! arguments for this <function>
    integer(INT32), intent(in) :: val_range

    ! return value of this <function>
    integer(INT32) :: num_integers_satisfied

    select case (val_range)
      case(1_INT32:9_INT32)
        num_integers_satisfied = val_range
      case(10_INT32:99_INT32)
        num_integers_satisfied = 9_INT32
      case(100_INT32:999_INT32)
        num_integers_satisfied = calculate_solution(99_INT32) + val_range - 99_INT32
      case(1000_INT32:9999_INT32)
        num_integers_satisfied = calculate_solution(999_INT32)
      case(10000_INT32:99999_INT32)
        num_integers_satisfied = calculate_solution(9999_INT32) + val_range - 9999_INT32
      case(100000_INT32)
        num_integers_satisfied = calculate_solution(99999_INT32)
    end select

  end function calculate_solution

end module ABC136

program main

  ! <module>s to import
  use,     intrinsic :: iso_fortran_env
  use, non_intrinsic :: ABC136

  ! variables for this <program>
  integer(INT32) :: N

  read(unit=INPUT_UNIT, fmt=*) N
  
  call task_B (N)

end program main

! End of File
