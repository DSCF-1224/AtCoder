! [contest]  ABC 102
! [task]     B
! [URL]      https://atcoder.jp/contests/abc102/tasks/abc102_b
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc102/submissions/5247639 : AC

module ABC102

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_B

  ! constants for this <module>
  integer(INT32), parameter, private :: len_sequence_max = 100

  ! variables for this <module>
  integer(INT32), private :: len_sequence

  ! array for this <module>
  integer(INT32), private :: val_sequence(1:len_sequence_max)

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_B

    ! variables for this <subroutine>
    integer :: iter

    ! STEP.01
    ! read out the length of the given sequence
    read(unit=INPUT_UNIT, fmt=*) len_sequence

    ! STEP.02
    ! read out the values of the given sequence
    read(unit=INPUT_UNIT, fmt=*) val_sequence(1:len_sequence)  

    ! STEP.03
    ! calculate & output the maximum difference of the given sequence
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') &!
      maxval(val_sequence(:), dim=1, mask=val_sequence .ge. 1_INT32) - &!
      minval(val_sequence(:), dim=1, mask=val_sequence .ge. 1_INT32)

    ! STEP.END
    return

  end subroutine task_B

end module ABC102


program main

  ! <module>s to import
  use, non_intrinsic :: ABC102

  ! require all variables to be explicitly declared
  implicit none

  call task_B

end program main
