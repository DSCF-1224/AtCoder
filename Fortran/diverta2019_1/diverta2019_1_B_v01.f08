! [contest]  diverta 2019 Programming Contest
! [task]     B
! [URL]      https://atcoder.jp/contests/abc130/tasks/abc130_b
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc130/submissions/5963833 : WA
!            https://atcoder.jp/contests/abc130/submissions/5965571 : WA
!            https://atcoder.jp/contests/abc130/submissions/5970066 : WA
!            https://atcoder.jp/contests/abc130/submissions/5972216 : AC

module diverta2019_1

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_B

  ! <type>s for this <module>
  type type_ball
    integer(INT32), public :: red
    integer(INT32), public :: green
    integer(INT32), public :: blue
  end type type_ball

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_B

    ! variables for this <subroutine>
    integer(INT32)     :: num_ball_total, num_set_box
    type   (type_ball) :: box

    ! support variables for this <subroutine>
    integer(INT32) :: itr_Lv1, itr_Lv2

    ! STEP.01
    ! read out the number of balls in the each color box and total number of ones
    read(unit=INPUT_UNIT, fmt=*) box%red, box%green, box%blue, num_ball_total

    ! STEP.02
    ! calculate how may triples of non-begative integers achieve the given condition


    ! STEP.END
    return

  end subroutine task_B

end module diverta2019_1


program main

  ! <module>s to import
  use, non_intrinsic :: diverta2019_1

  ! require all variables to be explicitly declared
  implicit none

  call task_B

end program main
