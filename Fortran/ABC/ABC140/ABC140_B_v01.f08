! [contest]  ABC 140
! [task]     B
! [URL]      https://atcoder.jp/contests/abc140/tasks/abc140_b
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc140/submissions/7389522 : AC

module ABC140

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_B

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_B

    ! variables for this <subroutine>
    integer(INT32) :: num_dishes
    integer(INT32) :: sum_satisfaction

    ! arrays for this <subroutine>
    integer(INT32), dimension(:), allocatable :: list_turn
    integer(INT32), dimension(:), allocatable :: list_satisfaction
    integer(INT32), dimension(:), allocatable :: list_satisfaction_additional

    ! support variables for this <subroutine>
    integer :: itr

    ! STEP.01
    ! read out the given data
    ! (the number of the dishes)
    read(unit=INPUT_UNIT, fmt=*) num_dishes

    ! STEP.02
    ! allocate the arrays to store the given data
    allocate( list_turn(1:num_dishes) )
    allocate( list_satisfaction(1:num_dishes) )
    allocate( list_satisfaction_additional(1:num_dishes - 1) )

    ! STEP.03
    ! read out the given data
    read(unit=INPUT_UNIT, fmt=*) list_turn(:)
    read(unit=INPUT_UNIT, fmt=*) list_satisfaction(:)
    read(unit=INPUT_UNIT, fmt=*) list_satisfaction_additional(:)

    ! STEP.04
    ! calculate the sum of the satisfaction
    sum_satisfaction = list_satisfaction( list_turn(1) )

    do itr = 2, num_dishes, 1

      sum_satisfaction = sum_satisfaction + list_satisfaction( list_turn(itr) )

      if ( list_turn(itr - 1) + 1_INT32 .eq. list_turn(itr) ) then
        sum_satisfaction = sum_satisfaction + list_satisfaction_additional( list_turn(itr - 1) )
      end if

    end do

    ! STEP.05
    ! output the answer of this task
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') sum_satisfaction

    ! STEP.06
    ! deallocate the arrays to store the given data
    deallocate( list_turn )
    deallocate( list_satisfaction )
    deallocate( list_satisfaction_additional )

    ! STEP.END
    return

  end subroutine task_B

end module ABC140


program main

  ! <module>s to import
  use, non_intrinsic :: ABC140

  ! require all variables to be explicitly declared
  implicit none

  call task_B

end program main
