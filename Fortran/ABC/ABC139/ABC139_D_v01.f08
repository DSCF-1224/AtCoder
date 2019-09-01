! [contest]  ABC 139
! [task]     D
! [URL]      https://atcoder.jp/contests/abc139/tasks/abc139_d
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc139/submissions/7276635 : WA
!            https://atcoder.jp/contests/abc139/submissions/7276970 : AC

module ABC139

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_D

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_D

    ! variables for this <subroutine>
    integer(INT64) :: len_sequence

    ! STEP.01
    ! read out the given data (the number of squares)
    read(unit=INPUT_UNIT, fmt=*) len_sequence

    ! STEP.02
    ! output the answer of this task
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') (len_sequence - 1_INT64) * len_sequence / 2_INT64

    ! STEP.END
    return

  end subroutine task_D

end module ABC139

program main

  ! <module>s to import
  use, non_intrinsic :: ABC139

  ! require all variables to be explicitly declared
  implicit none

  call task_C

end program main
