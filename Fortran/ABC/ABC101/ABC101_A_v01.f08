! [contest]  ABC 101
! [task]     A
! [URL]      https://atcoder.jp/contests/abc101/tasks/abc101_a
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc101/submissions/5245887 : AC

module ABC101

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_A

  ! constants for this <module>
  integer, parameter, private :: len_given_string = 4

  ! variables for this <module>
  character(len=len_given_string, kind=1), private :: given_string
  integer,                                 private :: integer_target

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_A

    ! variables for this <subroutine>
    integer :: iter

    ! STEP.01
    ! initialize the integer which Mr.Takahashi remembers
    integer_target = 0

    ! STEP.02
    ! read out the given string
    read(unit=INPUT_UNIT, fmt='(A)') given_string

    ! STEP.03
    ! update the target integer
    do iter = 1, len_given_string, 1
      if (given_string(iter:iter) .eq. '+') integer_target = integer_target + 1
      if (given_string(iter:iter) .eq. '-') integer_target = integer_target - 1
    end do

    ! STEP.04
    ! output the target integer
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') integer_target

    ! STEP.END
    return

  end subroutine task_A

end module ABC101


program main

  ! <module>s to import
  use, non_intrinsic :: ABC101

  ! require all variables to be explicitly declared
  implicit none

  call task_A

end program main
