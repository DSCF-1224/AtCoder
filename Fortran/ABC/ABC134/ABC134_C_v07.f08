! [contest]  ABC 134
! [task]     C
! [URL]      https://atcoder.jp/contests/abc134/tasks/abc134_c
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc134/submissions/6518540 : AC

module ABC134

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_C

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_C (len_sequence, val_sequence)

    ! arguments for this <subroutine>
    integer(INT32), intent(in) :: len_sequence
    integer(INT32), intent(in) :: val_sequence(:)

    ! arrays for this <subroutine>
    integer(INT32), allocatable :: maxval_left (:)
    integer(INT32), allocatable :: maxval_right(:)

    ! support variables for this <subroutine>
    integer(INT32) :: itr

    ! STEP.01
    ! allocate the array to store the maximum values
    allocate( maxval_left (0_INT32:len_sequence - 1_INT32) )
    allocate( maxval_right(2_INT32:len_sequence + 1_INT32) )

    ! STEP.02
    ! initialize the array to store the maximum values
    maxval_left (0_INT32               ) = 0_INT32
    maxval_right(len_sequence + 1_INT32) = 0_INT32

    ! STEP.03
    ! search the maximum values of the given sequence

    do itr = 1_INT32, len_sequence - 1_INT32, 1_INT32
      maxval_left(itr) = max( maxval_left(itr - 1_INT32), val_sequence(itr) )
    end do

    do itr = len_sequence, 2_INT32, -1_INT32
      maxval_right(itr) = max( maxval_right(itr + 1_INT32), val_sequence(itr) )
    end do

    ! STEP.04
    ! output the answer of this task
    do itr = 1_INT32, len_sequence, 1_INT32
      write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') max( maxval_left(itr - 1_INT32), maxval_right(itr + 1_INT32) )
    end do

    ! STEP.05
    ! deallocate the array to store the maximum values
    deallocate( maxval_left  )
    deallocate( maxval_right )

    ! STEP.END
    return

  end subroutine task_C

end module ABC134


program main

  ! <module>s to import
  use, non_intrinsic :: ABC134

  ! require all variables to be explicitly declared
  implicit none

  ! variables for this <program>
  integer(INT32) :: N

  ! arrays for this <program>
  integer(INT32), allocatable :: A(:)

  ! support variables for this <program>
  integer(INT32) :: itr

  ! STEP.01
  ! read out the length of the given sequence
  read(unit=INPUT_UNIT, fmt=*) N

  ! STEP.02
  ! allocate the array to store the given sequence
  allocate( A(1_INT32:N) )

  ! STEP.03
  ! read out the values of the given sequence
  do itr = 1_INT32, N, 1_INT32
    read(unit=INPUT_UNIT, fmt=*) A(itr)
  end do

  ! STEP.04
  ! calculate & output the answer of this task
  call task_C (N, A(:))

  ! STEP.05
  ! deallocate the array to store the given sequence
  deallocate( A )

end program main
