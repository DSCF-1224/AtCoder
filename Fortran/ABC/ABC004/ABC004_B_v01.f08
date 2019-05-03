! AtCoder Beginner Contest 004 B
! [URL]      https://atcoder.jp/contests/abc004/tasks/abc004_2
! [compiler] fortran (gfortran v4.8.4)
! [status]   AC

module ABC004

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: ABC004_B

  ! constants for this <module>
  integer, parameter, private :: size_board = 4
  integer, parameter, private :: size_buf   = 7

  ! variables for this <module>
  character(len=1,        kind=1) :: char_board(1:size_board,1:size_board)
  character(len=size_buf, kind=1) :: buf_line

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine ABC004_B

    ! variables for this <subroutine>
    integer :: itr_line, itr_elem

    ! STEP.01
    ! read out the target data
    do itr_line = 1, size_board, 1
      read (unit=INPUT_UNIT, fmt='(A)') buf_line
      do itr_elem = 1, size_board, 1
        char_board(itr_elem,itr_line)(1:1) = buf_line(2*itr_elem-1:2*itr_elem-1)
      end do
    end do

    ! STEP.02
    ! output the rotated result
    do itr_line = size_board, 1, -1
      write(unit=OUTPUT_UNIT, fmt='(A1,3(1X,A1))', advance='yes') char_board(size_board:1:-1, itr_line)(1:1)
    end do

    ! STEP.END
    return

  end subroutine ABC004_B

end module ABC004

program main

  ! <module>s to import
  use, non_intrinsic :: ABC004

  call ABC004_B

end program main
