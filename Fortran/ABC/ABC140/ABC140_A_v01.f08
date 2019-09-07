! [contest]  ABC 140
! [task]     A
! [URL]      https://atcoder.jp/contests/abc140/tasks/abc140_a
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc140/submissions/7383065 : AC

module ABC140

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_A

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_A

    ! variables for this <subroutine>
    integer(INT32) :: N

    ! STEP.01
    ! read out the given data
    read(unit=INPUT_UNIT, fmt=*) N

    ! STEP.02
    ! output the answer of this task
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') N ** 3_INT32

    ! STEP.END
    return

  end subroutine task_A

end module ABC140


program main

  ! <module>s to import
  use, non_intrinsic :: ABC140

  ! require all variables to be explicitly declared
  implicit none

  call task_A

end program main
