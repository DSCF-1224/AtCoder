! [contest]  ABC 134
! [task]     C
! [URL]      https://atcoder.jp/contests/abc134/tasks/abc134_c
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc134/submissions/6461109 : TLE

module ABC134

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_C
  private :: write_answer_unit

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_C

    ! variables for this <subroutine>
    integer(INT32) :: len_sequence
    integer(INT32) :: maxval_left
    integer(INT32) :: maxval_right

    ! arrays for this <subroutine>
    integer(INT32), dimension(:), allocatable :: val_sequence

    ! support variables for this <subroutine>
    integer(INT32) :: itr

    ! STEP.01
    ! read out the given data
    ! (the length of the given sequence)
    read(unit=INPUT_UNIT, fmt=*) len_sequence

    ! STEP.01
    ! read out the given data
    ! (the values of the given sequence)

    allocate( val_sequence(1:len_sequence) )

    do itr = 1_INT32, len_sequence, 1_INT32
      read(unit=INPUT_UNIT, fmt=*) val_sequence(itr)
    end do

    ! STEP.03
    ! calculate & output the answer of this task
    call write_answer_unit( maxval( val_sequence(2:), dim=1 ) )

    do itr = 2_INT32, len_sequence, 1_INT32
      maxval_left  = max(maxval_left, val_sequence(itr-1))
      maxval_right = maxval( val_sequence(itr+1:), dim=1 )
      call write_answer_unit( max(maxval_left, maxval_right) )
    end do

    ! STEP.03
    ! deallocate the array to store the given data
    deallocate( val_sequence )

    ! STEP.END
    return

  end subroutine task_C

  subroutine write_answer_unit (answer)

    ! arguments for this <subroutine>
    integer(INT32), intent(in) :: answer

    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') answer
    return

  end subroutine write_answer_unit

end module ABC134


program main

  ! <module>s to import
  use, non_intrinsic :: ABC134

  ! require all variables to be explicitly declared
  implicit none

  call task_C

end program main
