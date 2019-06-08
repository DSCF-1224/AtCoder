! [contest]  ABC 126
! [task]     A
! [URL]      https://atcoder.jp/contests/abc126/tasks/abc126_a
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc126/submissions/5822742 : AC

module ABC126

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_A

  ! constants for this <module>
  integer(INT32), parameter, private :: len_string_max = 50_INT32

  ! variables for this <module>
  character(len=len_string_max, kind=1), private :: given_string
  integer(INT32),                        private :: index
  integer(INT32),                        private :: len_string

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_A

    ! support variables for this <subroutine>
    integer(INT32) :: itr

    ! STEP.01
    ! read out the given data
    read(unit=INPUT_UNIT, fmt=*    ) len_string, index
    read(unit=INPUT_UNIT, fmt='(A)') given_string

    ! STEP.02
    ! lowercasing the target string
    if( ichar(given_string(index:index)) .eq. ichar('A') )  given_string(index:index) = 'a'
    if( ichar(given_string(index:index)) .eq. ichar('B') )  given_string(index:index) = 'b'
    if( ichar(given_string(index:index)) .eq. ichar('C') )  given_string(index:index) = 'c'

    ! STEP.03
    ! calculate & output the summation
    write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') trim(given_string)

    ! STEP.END
    return

  end subroutine task_A

end module ABC126


program main

  ! <module>s to import
  use, non_intrinsic :: ABC126

  ! require all variables to be explicitly declared
  implicit none

  call task_A

end program main
