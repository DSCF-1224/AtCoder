! [contest]    いろはちゃんコンテスト 2019 Day1
! [task]       E
! [URL]        https://atcoder.jp/contests/iroha2019-day1/tasks/iroha2019_day1_e
! [compiler]   fortran (gfortran v4.8.4)
! [submission] NOT Submitted

module iroha2019

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_day1_e

  ! constants for this <module>
  integer(INT8), parameter, private :: schedule_prog = 1_INT8
  integer(INT8), parameter, private :: schedule_meet = 0_INT8

  ! variables for this <module>
  integer(INT64), private :: num_days_scheduling
  integer(INT64), private :: num_days_limit
  integer(INT16), private :: num_days_meeting

  ! array for this <module>
  integer(INT8),  allocatable, private :: list_schedule(:)
  integer(INT64), allocatable, private :: date_meeting (:)

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_day1_e

    ! support variables for this <subroutine>
    integer(INT64) :: iter

    ! STEP.01
    ! read out the days to schedule
    ! read out the maximum days without a date
    ! read out the number of the memorial days
    read(unit=INPUT_UNIT, fmt=*) num_days_scheduling, num_days_limit, num_days_meeting

    ! STEP.02
    ! allocate the array to store the schedule
    ! allocate the array to store the date of the memorial date
    allocate(list_schedule(0:num_days_scheduling+1))
    allocate(date_meeting (1:num_days_meeting     ))

    ! STEP.03
    ! initialize the array to store the schedule
    list_schedule(0)                     = schedule_meet
    list_schedule(1:num_days_scheduling) = schedule_prog
    list_schedule(1+num_days_scheduling) = schedule_meet
    
    ! STEP.04
    ! read out the date of the memorial date
    read(unit=INPUT_UNIT, fmt=*) date_meeting(1:num_days_meeting)

    ! STEP.04
    ! update the list of schedule
    ! filling the date of memorial meeting
    do iter = 1, num_days_meeting, 1
      list_schedule(date_meeting(iter)) = 0_INT8
    end do

    print '(1000I1)', list_schedule(:)

    ! STEP.04
    ! deallocate the array to store the schedule
    ! deallocate the array to store the date of the memorial date
    deallocate(list_schedule)
    deallocate(date_meeting )

    ! STEP.END
    return

  end subroutine task_day1_e

end module iroha2019

program main

  ! <module>s to import
  use, non_intrinsic :: iroha2019

  ! require all variables to be explicitly declared
  implicit none

  call task_day1_e

end program main
