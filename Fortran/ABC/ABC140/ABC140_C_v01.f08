! [contest]  ABC 140
! [task]     C
! [URL]      https://atcoder.jp/contests/abc140/tasks/abc140_c
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc140/submissions/7383065 : AC

module ABC140

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
    integer(INT64) :: len_sequence_A
    integer(INT64) :: val_sum_sequence_A

    ! arrays for this <subroutine>
    integer(INT64), dimension(:), allocatable :: val_sequence_B

    ! support variables for this <subroutine>
    integer :: itr

    ! STEP.01
    ! read out the given data
    ! (the length of the sequence B)
    read(unit=INPUT_UNIT, fmt=*) len_sequence_A

    ! STEP.02
    ! allocate the arrays to store the given data
    allocate( val_sequence_B(1:len_sequence_A - 1) )

    ! STEP.03
    ! read out the given data
    ! (the values of the sequence B)
    read(unit=INPUT_UNIT, fmt=*) val_sequence_B(:)

    ! STEP.04
    ! calculate the answer of this task
    val_sum_sequence_A &!
    = val_sequence_B(len_sequence_A - 1)
    + val_sequence_B(1)

    do itr = len_sequence_A - 1, 2, -1
      val_sum_sequence_A = val_sum_sequence_A + min(val_sequence_B(itr), val_sequence_B(itr - 1))
    end do

    ! STEP.05
    ! output the answer of this task
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') val_sum_sequence_A

    ! STEP.06
    ! deallocate the arrays to store the given data
    deallocate( val_sequence_B )

    ! STEP.END
    return

  end subroutine task_C

end module ABC140


program main

  ! <module>s to import
  use, non_intrinsic :: ABC140

  ! require all variables to be explicitly declared
  implicit none

  call task_C

end program main
