! [contest]  ABC 134
! [task]     C
! [URL]      https://atcoder.jp/contests/abc134/tasks/abc134_c
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc134/submissions/6487672 : AC

module ABC134

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_C

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_C

    ! variables for this <subroutine>
    integer(INT32) :: len_sequence
    integer(INT32) :: maxval_1st
    integer(INT32) :: maxval_2nd
    integer(INT32) :: maxval_answer

    ! arrays for this <subroutine>
    integer(INT32), dimension(:), allocatable :: val_sequence

    ! support variables for this <subroutine>
    integer(INT32) :: itr

    ! STEP.01
    ! read out the given data
    ! (the length of the given sequence)
    read(unit=INPUT_UNIT, fmt=*) len_sequence

    ! STEP.02
    ! allocate the array to store the given sequence
    allocate( val_sequence(1:len_sequence) )

    ! STEP.03
    ! read out the given data
    ! (the values of the given sequence)
    do itr = 1_INT32, len_sequence, 1_INT32
      read(unit=INPUT_UNIT, fmt=*) val_sequence(itr)
    end do

    ! STEP.03
    ! find the maximum values of the given sequence

    maxval_1st = 0_INT32
    maxval_2nd = 0_INT32

    do itr = 1_INT32, len_sequence, 1_INT32

      if (maxval_1st .lt. val_sequence(itr)) then
        maxval_2nd = maxval_1st
        maxval_1st = val_sequence(itr)
      else if (maxval_2nd .lt. val_sequence(itr)) then
        maxval_2nd = val_sequence(itr)
      end if

    end do

    ! STEP.04
    ! output the answer of this task
    do itr = 1_INT32, len_sequence, 1_INT32

      if ( val_sequence(itr) .eq. maxval_1st ) then
        maxval_answer = maxval_2nd
      else
        maxval_answer = maxval_1st
      end if

      write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') maxval_answer

    end do

    ! STEP.03
    ! deallocate the array to store the given data
    deallocate( val_sequence )

    ! STEP.END
    return

  end subroutine task_C

end module ABC134


program main

  ! <module>s to import
  use, non_intrinsic :: ABC134

  ! require all variables to be explicitly declared
  implicit none

  call task_C

end program main
