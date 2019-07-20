! [contest]  ABC 134
! [task]     ?
! [URL]      https://atcoder.jp/contests/abc134/tasks/abc134_b
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc134/submissions/6455753 : AC

module ABC134

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_B
  private :: calculate_num_monitor

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_B

    ! variables for this <subroutine>
    integer(INT32) :: N
    integer(INT32) :: D

    ! STEP.01
    ! read out the given data
    read(unit=INPUT_UNIT, fmt=*) N, D

    ! STEP.02
    ! calculate & output the answer of this task
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') calculate_num_monitor (N, D)

    ! STEP.END
    return

  end subroutine task_B

  pure function calculate_num_monitor (num_tree_all, num_range) result(num_monitor)

    ! arguments for this <function>
    integer(INT32), intent(in) :: num_tree_all
    integer(INT32), intent(in) :: num_range

    ! variables for this <subroutine>
    integer(INT32) :: num_tree_watched

    ! return value of this <function>
    integer(INT32) :: num_monitor

    num_tree_watched = 2_INT32 * num_range + 1_INT32
    num_monitor      = num_tree_all / num_tree_watched
    
    if ( mod(num_tree_all, num_tree_watched) .ne. 0_INT32 ) then
      num_monitor = num_monitor + 1_INT32
    end if

    return

  end function calculate_num_monitor

end module ABC134


program main

  ! <module>s to import
  use, non_intrinsic :: ABC134

  ! require all variables to be explicitly declared
  implicit none

  call task_B

end program main
