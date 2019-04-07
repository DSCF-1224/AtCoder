! [contest]  ABC 007
! [task]     A
! [URL]      https://atcoder.jp/contests/abc007/tasks/abc007_1
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc007/submissions/4838102 : AC
! 
module ABC007

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: ABC007_A

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine ABC007_A

    ! variables for this <subroutine>
    integer(kind=INT16) :: num_trees

    ! STEP.01
    ! read out the number of trees
    read(unit=INPUT_UNIT, fmt='(I5)') num_trees

    ! STEP.02
    ! output the number of the intervals
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') num_trees - 1_INT16

    ! STEP.END
    return

  end subroutine ABC007_A

end module ABC007


program main

  ! <module>s to import
  use, non_intrinsic :: ABC007

  ! require all variables to be explicitly declared
  implicit none

  call ABC007_A

end program main
