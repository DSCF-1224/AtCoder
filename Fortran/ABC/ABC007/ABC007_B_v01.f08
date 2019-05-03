! [contest]  ABC 007
! [task]     B
! [URL]      https://atcoder.jp/contests/abc007/tasks/abc007_2
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc007/submissions/4840756 : AC

module ABC007

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: ABC007_B

  ! constants for this <module>
  integer(kind=INT8), parameter, private :: len_given_string_max = 11_INT8

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine ABC007_B

    ! variables for this <subroutine>
    character(len=len_given_string_max, kind=1) :: string_given
    integer  (kind=INT8)                        :: len_given_string

    ! STEP.01
    ! read out the given string
    read(unit=INPUT_UNIT, fmt='(A)') string_given

    ! STEP.02
    ! get the length of the given string
    len_given_string = len_trim(string_given, kind=INT8)

    if(len_given_string .eq. 1_INT8 .and. iachar(string_given(1:1)) .eq. iachar('a')) then
      write(unit=OUTPUT_UNIT, fmt='(I2)', advance='yes') -1_INT8
    else
      write(unit=OUTPUT_UNIT, fmt='(A1)', advance='yes') 'a'
    end if

    ! STEP.END
    return

  end subroutine ABC007_B

end module ABC007


program main

  ! <module>s to import
  use, non_intrinsic :: ABC007

  ! require all variables to be explicitly declared
  implicit none

  call ABC007_B

end program main
