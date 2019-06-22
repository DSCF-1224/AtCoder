! [contest]  ABC 131
! [task]     D
! [URL]      https://atcoder.jp/contests/abc131/tasks/abc131_d
! [compiler] fortran (gfortran v4.8.4)
! [status]   NOT Submitted

module ABC131

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_D

  ! <type>s for this <module>
  type data_task
    integer(INT32), public :: cost
    integer(INT32), public :: deadline
  end type data_task

  ! arrays for this <module>
  type(data_task), allocatable, dimension(:), private :: given_data

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine sort_data (index_start, index_end, mode)

    ! arguments for this <subroutine>
    integer(INT32), intent(in) :: index_start
    integer(INT32), intent(in) :: index_end
    logical,        intent(in) :: mode

    ! variables for this <subroutine>
    integer(INT32) :: buf1, buf2

    ! support variables for this <subroutine>
    integer(INT32) :: itr_start, itr_end

    do itr_start = index_start, index_end, 1_INT32
    do itr_end   = itr_start,   index_end, 1_INT32
    end do
    end do


  end subroutine sort_data

  subroutine task_D

    ! variables for this <subroutine>
    integer(INT32) :: num_task

    ! support variables for this <subroutine>
    integer(INT32) :: itr

    ! STEP.01
    ! read out the given data
    read(unit=INPUT_UNIT, fmt=*) num_task

    ! STEP.02
    ! allocate the array to store the given data
    allocate( given_data(1:num_task) )

    ! STEP.03
    ! read out the given data
    do itr = 1_INT32, num_task, 1_INT32
      read(unit=INPUT_UNIT, fmt=*) given_data(itr)%cost, given_data(itr)%deadline
    end do

    ! STEP.04
    ! deallocate the array to store the given data
    deallocate( given_data )

    ! STEP.END
    return

  end subroutine task_D

end module ABC131


program main

  ! <module>s to import
  use, non_intrinsic :: ABC131

  ! require all variables to be explicitly declared
  implicit none

  call task_D

end program main
