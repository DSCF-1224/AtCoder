! [contest]    いろはちゃんコンテスト 2019 Day4
! [task]       A
! [URL]        https://atcoder.jp/contests/iroha2019-day4/tasks/iroha2019_day4_a
! [compiler]   fortran (gfortran v4.8.4)
! [submission] NOT Submitted

module iroha2019

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_day4_a

  ! constants for this <module>
  integer(INT32), parameter, private :: num_players    =   4_INT32
  integer(INT32), parameter, private :: num_rounds_max = 100_INT32

  ! variables for this <module>
  integer(INT32), private :: num_rounds

  ! arrays for this <module>
  integer(INT32), private :: num_times_scored(1:num_players)
  integer(INT32), private :: val_rank        (1:num_rounds_max, 1:num_players)
  integer(INT32), private :: player_rank_4th (1:num_players)

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_day4_a

    ! support variables for this <subroutine>
    integer(INT32) :: iter

    ! STEP.01
    ! read out the number of the rounds
    ! read out the number of scored times of each player
    read(unit=INPUT_UNIT, fmt=*) num_rounds, num_times_scored(1:num_players)

    ! STEP.02
    ! initialize the array to store the value of rank
    val_rank(1:num_rounds, 1:num_players) = 0_INT32

    ! STEP.03
    ! read out the value of rank of each player
    do iter = 1, num_players, 1
      if (num_times_scored(iter) .gt. 0_INT32) then
        read(unit=INPUT_UNIT, fmt=*) val_rank(1:num_times_scored(iter), iter)
      end if
    end do

    do iter = 1, num_players, 1
      write(unit=OUTPUT_UNIT, fmt='(100(1X,I1))') val_rank(1:num_rounds, iter)
    end do

    ! STEP.END
    return

  end subroutine task_day4_a

end module iroha2019

program main

  ! <module>s to import
  use, non_intrinsic :: iroha2019

  ! require all variables to be explicitly declared
  implicit none

  call task_day4_a

end program main
