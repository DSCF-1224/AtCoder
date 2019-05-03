! [contest]  ABC 124
! [task]     B
! [URL]      https://atcoder.jp/contests/abc124/tasks/abc124_b
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc124/submissions/4949669

module ABC124

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_B

  ! constants for this <module>
  integer(kind=INT8), parameter, private :: num_mountains_max = 100_INT8

  ! variables for this <module>
  integer(kind=INT8) :: num_mountains_all
  integer(kind=INT8) :: num_mountains_visible
  integer(kind=INT8) :: height_mountain(1:num_mountains_max)
  logical            :: is_visible

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_B

    ! variables for this <subroutine>
    integer(kind=INT8) :: itr_Mt, itr_ToWest

    ! STEP.01
    ! read out the number of the mountains
    read(unit=INPUT_UNIT, fmt=*) num_mountains_all

    ! STEP.02
    ! read out the heights of the mountains
    read(unit=INPUT_UNIT, fmt=*) height_mountain(1:num_mountains_all)

    ! STEP.03
    ! count up the number of mountains which you can see the sea from the top of the mountain
    num_mountains_visible = 0_INT8

    do itr_Mt = 1_INT8, num_mountains_all, 1_INT8
      
      is_visible = .true.

      do itr_ToWest = itr_Mt-1_INT8, 1_INT8, -1_INT8
        if (height_mountain(itr_ToWest) .gt. height_mountain(itr_Mt)) then
          is_visible = .false.
          exit
        end if
      end do

      if (is_visible) num_mountains_visible = num_mountains_visible + 1_INT8

    end do

    ! STEP.04
    ! output the result
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') num_mountains_visible

    ! STEP.END
    return

  end subroutine task_B

end module ABC124


program main

  ! <module>s to import
  use, non_intrinsic :: ABC124

  ! require all variables to be explicitly declared
  implicit none

  call task_B

end program main
