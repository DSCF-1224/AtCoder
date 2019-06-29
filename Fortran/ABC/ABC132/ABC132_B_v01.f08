! [contest]  ABC 132
! [task]     B
! [URL]      https://atcoder.jp/contests/abc132/tasks/abc132_b
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc132/submissions/6170753 : AC

module ABC132

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_B
  private :: judge_sequence

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_B

    ! variables for this <subroutine>
    integer(INT32) :: len_sequence
    integer(INT32) :: answer

    ! arrays for this <subroutine>
    integer(INT32), dimension(:), allocatable :: val_sequence

    ! support variables for this <subroutine>
    integer(INT32) :: index

    ! STEP.01
    ! read out the given data
    read(unit=INPUT_UNIT, fmt=*) len_sequence
    allocate( val_sequence(1:len_sequence) )
    read(unit=INPUT_UNIT, fmt=*) val_sequence(1:len_sequence)

    ! STEP.02
    ! calculate the answer of this task
    answer = 0_INT32

    do index = 2, len_sequence - 1, 1
      if ( judge_sequence( val_sequence(index-1:index+1:1) ) ) answer = answer + 1
    end do

    ! STEP.03
    ! deallocate the allocatable arrays
    deallocate( val_sequence )

    ! STEP.04
    ! output the answer of this task
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') answer

    ! STEP.END
    return

  end subroutine task_B

  function judge_sequence (sequence) result(stat)

    ! arguments for this <function>
    integer(INT32), dimension(1:3), intent(in) :: sequence

    ! return value of this <function>
    logical :: stat

    if ( sequence(1) .gt. sequence(2) .and. sequence(2) .gt. sequence(3) ) then
      stat = .true.
    else if ( sequence(1) .lt. sequence(2) .and. sequence(2) .lt. sequence(3) ) then
      stat = .true.
    else
      stat = .false.
    end if

    ! STEP.END
    return

  end function judge_sequence

end module ABC132


program main

  ! <module>s to import
  use, non_intrinsic :: ABC132

  ! require all variables to be explicitly declared
  implicit none

  call task_B

end program main
