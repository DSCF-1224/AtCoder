! [contest]  ABC 135
! [task]     A
! [URL]      https://atcoder.jp/contests/abc135/tasks/abc135_a
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc135/submissions/6573527 : AC

module ABC135

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_A
  private :: calculate_solution
  private :: is_even
  
  contains
  
  subroutine task_A
  
    ! variables for this <subroutine>
    integer(INT32) :: A, B
    integer(INT32) :: answer
    
    ! STEP.01
    ! read out the given data
    read(unit=INPUT_UNIT, fmt=*) A, B
    
    ! STEP.02
    ! calculate the answer of this task
    answer = calculate_solution (A, B)
    
    ! STEP.03
    ! output the answer of this task
    if ( answer .ge. 0_INT32 ) then
      write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') answer
    else
      write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') "IMPOSSIBLE"
    end if
    
    ! STEP.END
    return

  end subroutine task_A
  
  pure function calculate_solution (A, B) result(solution)
  
    ! arguments for this <function>
    integer(INT32), intent(in) :: A, B
  
    ! return value for this <function>
    integer(INT32) :: solution
    
    ! variables for this <function>
    integer(INT32) :: sum_AB
    
    sum_AB = A + B;
    
    if ( is_even(sum_AB) ) then
        solution = sum_AB / 2_INT32
    else
        solution = -1_INT32
    end if
    
    return

  end function calculate_solution
  
  pure function is_even (val) result(stat)
  
    ! arguments for this <function>
    integer(INT32), intent(in) :: val
    
    ! return value of this <function>
    logical :: stat
    
    stat = mod(val, 2_INT32) .eq. 0_INT32
    return

  end function is_even

end module ABC135

program main

  ! <module>s to import
  use, non_intrinsic :: ABC135
  
  call task_A

end program main

! End of File
