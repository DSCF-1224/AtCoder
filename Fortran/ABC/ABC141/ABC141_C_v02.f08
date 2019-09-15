! [contest]  ABC 141
! [task]     C
! [URL]      https://atcoder.jp/contests/abc141/tasks/abc141_c
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc141/submissions/7540649 : AC

module ABC141

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
    integer(INT32) :: id_player_answered
    integer(INT32) :: num_players
    integer(INT32) :: val_points_init
    integer(INT32) :: num_questions

    ! arrays for this <subroutine>
    integer(INT32), dimension(:), allocatable :: list_player_points

    ! support variables for this <subroutine>
    integer(INT32) :: itr_p
    integer(INT32) :: itr_q

    ! STEP.01
    ! read out the given data
    read(unit=INPUT_UNIT, fmt=*) num_players, val_points_init, num_questions

    ! STEP.02
    ! allocate the array to store the given data
    allocate( list_player_points  (1:num_players)   )

    ! STEP.03
    ! initialize the list of points
    list_player_points(:) = 0_INT32

    ! STEP.04
    ! read out the given data
    ! update the points of the players
    do itr_q = 1_INT32, num_questions, 1_INT32
      read(unit=INPUT_UNIT, fmt=*) id_player_answered
      list_player_points( id_player_answered ) = list_player_points( id_player_answered ) + 1_INT32
    end do

    ! STEP.05
    ! output the answer of this task
    ! update the points of the players
    do itr_p = 1_INT32, num_players, 1_INT32

      if (list_player_points(itr_p) .gt. num_questions - val_points_init) then
        write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') 'Yes'
      else
        write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') 'No'
      end if

    end do

    ! STEP.06
    ! deallocate the array to store the given data
    deallocate( list_player_points )

    ! STEP.END
    return

  end subroutine task_C

end module ABC141


program main

  ! <module>s to import
  use, non_intrinsic :: ABC141

  ! require all variables to be explicitly declared
  implicit none

  call task_C

end program main

! --- EOF --- !
