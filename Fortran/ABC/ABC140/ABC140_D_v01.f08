! [contest]  ABC 140
! [task]     D
! [URL]      https://atcoder.jp/contests/abc140/tasks/abc140_d
! [compiler] fortran (gfortran v4.8.4)
! [status]   NOT Submitted

module ABC140

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_D

  ! constants for this <module>
  integer(INT32), parameter, private :: len_string_max = 10_INT32 ** 5_INT32

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_D

    ! variables for this <subroutine>
    character(len=len_string_max, kind=1) :: given_string
    integer(INT32)                        :: num_people
    integer(INT32)                        :: num_operation_max

    ! arrays for this <subroutine>
    logical, dimension(:), allocatable :: list_direction

    ! support variables for this <subroutine>
    integer :: itr

    ! STEP.01
    ! read out the given data
    ! (the number of people, maximum operations)
    read(unit=INPUT_UNIT, fmt=*) num_people, num_operation_max

    ! STEP.02
    ! read out the given data
    ! (given string)
    read(unit=INPUT_UNIT, fmt='(A)') given_string

    ! STEP.02
    ! allocate the arrays to store the given data
    allocate( list_direction(1:num_people) )

    ! STEP.03
    ! read out the given data
    ! (the values of the sequence B)
    read(unit=INPUT_UNIT, fmt=*) val_sequence_B(:)

    ! STEP.04
    ! calculate the answer of this task
    val_sum_sequence_A &!
    = val_sequence_B(len_sequence_A - 1) &!
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

  end subroutine task_D

end module ABC140


program main

  ! <module>s to import
  use, non_intrinsic :: ABC140

  ! require all variables to be explicitly declared
  implicit none

  call task_D

end program main
