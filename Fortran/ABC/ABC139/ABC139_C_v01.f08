! [contest]  ABC 139
! [task]     C
! [URL]      https://atcoder.jp/contests/abc139/tasks/abc139_c
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc139/submissions/7271887 : AC

module ABC139

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
    integer(INT32) :: num_square
    integer(INT32) :: num_movement_max
    integer(INT32) :: num_movement_trial

    ! arrays for this <subroutine>
    integer(INT32), dimension(:), allocatable :: val_height

    ! support variables for this <subroutine>
    integer(INT32) :: itr

    ! STEP.01
    ! read out the given data (the number of squares)
    read(unit=INPUT_UNIT, fmt=*) num_square

    ! STEP.02
    ! allocate the array to store the given data
    allocate( val_height(1:num_square) )

    ! STEP.03
    ! read out the given data (the values of height)
    read(unit=INPUT_UNIT, fmt=*) val_height(:)

    ! STEP.04
    ! initialize the variables for this <subroutine>
    itr                = 1_INT32
    num_movement_max   = 0_INT32
    num_movement_trial = 0_INT32

    do while (itr .lt. num_square)

      if ( val_height(itr) .ge. val_height(itr + 1) ) then
        num_movement_trial = num_movement_trial + 1_INT32
      else
        num_movement_trial = 0_INT32
      end if

      num_movement_max = max(num_movement_max, num_movement_trial)

      itr = itr + 1_INT32

    end do

    ! STEP.05
    ! allocate the array to store the given data
    deallocate( val_height )

    ! STEP.06
    ! output the answer of this task
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') num_movement_max

    ! STEP.END
    return

  end subroutine task_C

end module ABC139

program main

  ! <module>s to import
  use, non_intrinsic :: ABC139

  ! require all variables to be explicitly declared
  implicit none

  call task_C

end program main
