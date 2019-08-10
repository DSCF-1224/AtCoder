! [contest]  ABC 137
! [task]     B
! [URL]      https://atcoder.jp/contests/abc137/tasks/abc137_b
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc137/submissions/6812666 : AC

module ABC137

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_B

  ! constants for this <module>
  integer(INT32), parameter, private :: val_coordinate_min_limit = -10000000_INT32
  integer(INT32), parameter, private :: val_coordinate_max_limit =  10000000_INT32

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_B (val_width, val_coordinate)

    ! arguments for this <subroutine>
    integer(INT32), intent(in) :: val_width, val_coordinate

    ! variables for this <subroutine>
    integer(INT32) :: val_coordinate_min
    integer(INT32) :: val_coordinate_max

    ! support variables for this <subroutine>
    integer(INT32) :: itr

    ! STEP.01
    ! calculate the range of coordinate where the black stone was set
    val_coordinate_min = val_coordinate - (val_width - 1_INT32)
    val_coordinate_max = val_coordinate + (val_width - 1_INT32)

    ! STEP.02
    ! adjust the range
    if ( val_coordinate_min .lt. val_coordinate_min_limit ) val_coordinate_min = val_coordinate_min_limit
    if ( val_coordinate_max .gt. val_coordinate_max_limit ) val_coordinate_max = val_coordinate_max_limit

    ! STEP.03
    ! output the answer of this task
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='no') val_coordinate_min

    do itr = val_coordinate_min + 1_INT32, val_coordinate_max, 1_INT32
      write(unit=OUTPUT_UNIT, fmt='(1X,I0)', advance='no') itr
    end do

    write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') ""

    ! STEP.END
    return

  end subroutine task_B

end module ABC137


program main

  ! <module>s to import
  use, non_intrinsic :: ABC137

  ! require all variables to be explicitly declared
  implicit none

  ! variables for this <program>
  integer(INT32) :: K, X

  ! STEP.01
  ! read out the given data
  read(unit=INPUT_UNIT, fmt=*) K, X

  ! STEP.02
  ! calculate & output the answer of this task
  call task_B (K, X)

end program main
