! [contest]  ABC 007
! [task]     C
! [URL]      https://atcoder.jp/contests/abc007/tasks/abc007_3
! [compiler] fortran (gfortran v4.8.4)
! [status]   NOT submitted

module ABC007

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: ABC007_C

  ! constants for this <module>
  character(len=1, kind=1), parameter, private :: char_passable   = '.'
  character(len=1, kind=1), parameter, private :: char_impassable = '#'
  integer  (kind=INT16),    parameter, private :: num_rows_max    = 50_INT16
  integer  (kind=INT16),    parameter, private :: num_cols_max    = 50_INT16

  ! variables for this <module>
  integer(kind=INT8), private :: num_rows
  integer(kind=INT8), private :: num_cols

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine ABC007_C

    ! variables for this <subroutine>
    character(len=num_cols_max, kind=1) buf_data

    ! support variables for this <subroutine>
    integer(kind=INT16) :: itr

    ! STEP.01
    ! read out the number of rows and columns of the maze
    read(unit=INPUT_UNIT, fmt=*) num_rows, num_cols

    do itr = 1, num_rows, 1
      read(unit=INPUT_UNIT, fmt='(A)') buf_data
      write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') trim(buf_data)
    end do

    return

  end subroutine ABC007_C

end module ABC007


program main

  ! <module>s to import
  use, non_intrinsic :: ABC007

  ! require all variables to be explicitly declared
  implicit none

  call ABC007_C

end program main
