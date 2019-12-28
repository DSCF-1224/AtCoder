! [contest]  大手前プロコン 2019
! [task]     A
! [URL]      https://atcoder.jp/contests/otemae2019/tasks/otemae2019_a
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/otemae2019/submissions/7244545 : WA
!            https://atcoder.jp/contests/otemae2019/submissions/7244555 : AC

module Otemae2019

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_A

  ! contained <subroutine>s and <function>s are below
  contains

  pure function task_A (time_remained, time_walking) result(stat)

    ! arguments for this <function>
    integer(INT16), intent(in) :: time_remained, time_walking

    ! return value of this <function>
    integer(INT8) :: stat

    if (time_remained .ge. time_walking) then
      stat = 1_INT8
    else
      stat = 0_INT8
    end if

    ! STEP.END
    return

  end function task_A

end module Otemae2019

program main

  ! <module>s to import
  use,     intrinsic :: iso_fortran_env
  use, non_intrinsic :: Otemae2019

  ! require all variables to be explicitly declared
  implicit none

  ! variables for this <program>
  integer(INT16) :: A, B

  ! STEP.01
  ! read out the given data
  read(unit=INPUT_UNIT, fmt=*) A, B

  ! STEP.02
  ! output the answer of this task
  write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') task_A(A, B)

end program main
