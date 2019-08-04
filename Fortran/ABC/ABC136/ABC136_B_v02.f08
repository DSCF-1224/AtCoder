! [contest]  ABC 136
! [task]     A
! [URL]      https://atcoder.jp/contests/abc136/tasks/abc136_b
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc136/submissions/6713779 : AC

module ABC136

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_B
  private :: calculate_solution

  ! contained <subroutine>s and <function>s are below
  contains
  
  subroutine task_B (val_range)

    ! arguments for this <subroutine>
    integer(INT32), intent(in) :: val_range

    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') calculate_solution(val_range)
    
    ! STEP.END
    return

  end subroutine task_B

  recursive function calculate_solution (val_range) result(num_integers_uneven)

    ! arguments for this <function>
    integer(INT32), intent(in) :: val_range

    ! return value of this <function>
    integer(INT32) :: num_integers_uneven

    if (val_range .lt. 10_INT32) then
      num_integers_uneven = val_range
    else if (val_range .lt. 100_INT32) then
      num_integers_uneven = 9_INT32
    else if (val_range .lt. 1000_INT32) then
      num_integers_uneven = calculate_solution(99_INT32) + val_range - 99_INT32
    else if (val_range .lt. 10000_INT32) then
      num_integers_uneven = calculate_solution(999_INT32)
    else if (val_range .lt. 100000_INT32) then
      num_integers_uneven = calculate_solution(9999_INT32) + val_range - 9999_INT32
    else
      num_integers_uneven = calculate_solution(99999_INT32)
    end if

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
