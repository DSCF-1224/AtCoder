! [contest]  ABC 139
! [task]     E
! [URL]      https://atcoder.jp/contests/abc139/tasks/abc139_e
! [compiler] fortran (gfortran v4.8.4)
! [status]   NOT Submitted

module ABC139

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_D

  ! constants for this <module>
  integer(INT16), private :: num_players_max = 1000_INT16

  ! <type>s for this <module>
  type data_match
    integer(INT16), dimension(1:num_players_max - 1) :: list_opponent
  end type data_match

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_D

    ! variables for this <subroutine>
    integer(INT64) :: num_players

    ! support variables for this <subroutine>
    integer(INT32) :: itr

    ! STEP.01
    ! read out the given data (the number of squares)
    read(unit=INPUT_UNIT, fmt=*) num_players

    ! STEP.02
    ! read out the given data (order of the opponents)
    do itr = 1, num_players, 1
      read(unit=INPUT_UNIT, fmt=*) list_opponent(1:num_players - 1)
    end do

    ! STEP.END
    return

  end subroutine task_D

end module ABC139

program main

  ! <module>s to import
  use, non_intrinsic :: ABC139

  ! require all variables to be explicitly declared
  implicit none

  call task_D

end program main
