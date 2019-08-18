! [contest]  ABC 138
! [task]     A
! [URL]      https://atcoder.jp/contests/abc138/tasks/abc138_a
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc138/submissions/6997432 : AC

module ABC138

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_A

  ! constants for this <module>
  integer, parameter, private :: len_string = 10

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_A

    ! variables for this <subroutine>
    character(len=len_string, kind=1) :: given_string
    integer(INT16)                    :: given_integer

    ! STEP.01
    ! read out the given data
    read(unit=INPUT_UNIT, fmt=*) given_integer
    read(unit=INPUT_UNIT, fmt=*) given_string

    ! STEP.02
    ! output the answer of this task
    if ( given_integer .ge. 3200_INT16 ) then
      write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') trim(given_string)
    else
      write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') 'red'
    end if

    ! STEP.END
    return

  end subroutine task_A

end module ABC138


program main

  ! <module>s to import
  use, non_intrinsic :: ABC138

  ! require all variables to be explicitly declared
  implicit none

  call task_A

end program main
