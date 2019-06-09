! [contest]  ABC 129
! [task]     ?
! [URL]      https://atcoder.jp/contests/abc129/tasks/abc129_a
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc129/submissions/5838635 : AC

module ABC129

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_A

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_A

    ! variables for this <subroutine>
    integer(INT16) :: cost(1:3)

    ! STEP.01
    ! read out the costs to move
    read(unit=INPUT_UNIT, fmt=*) cost(1:3)

    ! STEP.02
    ! calculate the monimium value of total cost to visit all airports
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') sum( cost(:), dim=1 ) - maxval( cost(:), dim=1 )

    ! STEP.END
    return

  end subroutine task_A

end module ABC129


program main

  ! <module>s to import
  use, non_intrinsic :: ABC129

  ! require all variables to be explicitly declared
  implicit none

  call task_A

end program main
