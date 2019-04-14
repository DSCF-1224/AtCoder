! [contest]    AtCoder Beginner Contest 002
! [task]       B
! [URL]        https://atcoder.jp/contests/abc002/tasks/abc002_2
! [compiler]   fortran (gfortran v4.8.4)
! [submission] https://atcoder.jp/contests/abc002/submissions/4981264 : AC

module ABC002

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_B

  ! constants for this <module>
  integer(kind=INT8), parameter, private :: len_string_max = 30_INT8

  ! variables for this <module>
  character(len=len_string_max, kind=1), private :: given_string
  integer(kind=INT8),                    private :: len_given_string

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_B

    ! variables for this <subroutine>
    integer(kind=INT8) :: itr

    ! STEP.01
    ! read out the given string
    do itr = 1_INT8, len_string_max, 1_INT8
      given_string(itr:itr) = ' '
    end do

    read(unit=INPUT_UNIT, fmt='(A)') given_string

    ! STEP.02
    ! output the given string without the vowels
    do itr = 1_INT8, len_trim(given_string), 1_INT8
      if (given_string(itr:itr) .eq. 'a') then
        continue
      else if (given_string(itr:itr) .eq. 'i') then
        continue
      else if (given_string(itr:itr) .eq. 'u') then
        continue
      else if (given_string(itr:itr) .eq. 'e') then
        continue
      else if (given_string(itr:itr) .eq. 'o') then
        continue
      else
        write(unit=OUTPUT_UNIT, fmt='(A1)', advance='no') given_string(itr:itr)
      end if
    end do

    write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes')

    ! STEP.END
    return

  end subroutine task_B

end module ABC002

program main

  ! <module>s to import
  use, non_intrinsic :: ABC002

  ! require all variables to be explicitly declared
  implicit none

  call task_B

end program main
