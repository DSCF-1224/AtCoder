! [contest]  ABC 123
! [task]     A
! [URL]      https://atcoder.jp/contests/abc123/tasks/abc123_a
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc123/submissions/4866818 : AC

module ABC123

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: ABC123_A

  ! constants for this <module>
  character(len=4, kind=1), parameter, private :: string_communicatable     = 'Yay!'
  character(len=2, kind=1), parameter, private :: string_NOT_communicatable = ':('
  integer  (kind=INT8),     parameter, private :: num_antenna               = 5_INT8

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine ABC123_A

    ! variables for this <subroutine>
    integer(kind=INT8) :: coordinate_A, coordinate_E
    integer(kind=INT8) :: distance_max

    ! support variables for this <subroutine>
    integer(kind=INT8) :: itr

    ! STEP.01
    ! read out the coordinate of the antennas
    read(unit=INPUT_UNIT, fmt='(I3)') coordinate_A

    do itr = 2_INT8, num_antenna, 1_INT8
      read(unit=INPUT_UNIT, fmt='(I3)') coordinate_E
    end do

    ! STEP.02
    ! read out the maximum communicatable distance
    read(unit=INPUT_UNIT, fmt='(I3)') distance_max

    ! STEP.03
    ! judge the distance among the antennas
    if ( coordinate_E - coordinate_A .gt. distance_max ) then
      write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') string_NOT_communicatable
    else
      write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') string_communicatable
    end if

    ! STEP.END
    return

  end subroutine ABC123_A

end module ABC123


program main

  ! <module>s to import
  use, non_intrinsic :: ABC123

  ! require all variables to be explicitly declared
  implicit none

  call ABC123_A

end program main
