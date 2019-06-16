! [contest]  diverta 2019 Programming Contest
! [task]     A
! [URL]      https://atcoder.jp/contests/abc130/tasks/abc130_a
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc130/submissions/5953967 : AC

module diverta2019_1

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
    integer(INT8) :: len_sequence_total
    integer(INT8) :: len_sequence_consecutive

    ! STEP.01
    ! read out the ...
    ! 1. length of the given sequence
    ! 2. length of the       sequence to choose consecutively
    read(unit=INPUT_UNIT, fmt=*) len_sequence_total, len_sequence_consecutive

    ! STEP.02
    ! calculate the how many ways are there to choose `len_sequence_consecutive` consecutive integers ?
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') len_sequence_total - len_sequence_consecutive + 1_INT8

    ! STEP.END
    return

  end subroutine task_A

end module diverta2019_1


program main

  ! <module>s to import
  use, non_intrinsic :: diverta2019_1

  ! require all variables to be explicitly declared
  implicit none

  call task_A

end program main
