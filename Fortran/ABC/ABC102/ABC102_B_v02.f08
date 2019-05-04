! [contest]  ABC 102
! [task]     B
! [URL]      https://atcoder.jp/contests/abc102/tasks/abc102_b
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc102/submissions/5248981 : AC

module ABC102

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_B
  private :: linear_search

  ! constants for this <module>
  integer(INT32), parameter, private :: len_sequence_max = 100

  ! variables for this <module>
  integer(INT32), private :: len_sequence
  integer(INT32), private :: val_sequence_max
  integer(INT32), private :: val_sequence_min

  ! array for this <module>
  integer(INT32), private :: val_sequence(1:len_sequence_max)

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_B

    ! STEP.01
    ! read out the length of the given sequence
    read(unit=INPUT_UNIT, fmt=*) len_sequence

    ! STEP.02
    ! read out the values of the given sequence
    read(unit=INPUT_UNIT, fmt=*) val_sequence(1:len_sequence)

    ! STEP.03
    ! find the maximum & minimum value of the given sequence
    call linear_search

    ! STEP.04
    ! calculate & output the maximum difference of the given sequence
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') val_sequence_max - val_sequence_min

    ! STEP.END
    return

  end subroutine task_B

  subroutine linear_search

    ! support variables for this <subroutine>
    integer(INT32) :: iter

    val_sequence_max = val_sequence(1)
    val_sequence_min = val_sequence(1)

    do iter = 1, len_sequence, 1
      if (val_sequence(iter) .gt. val_sequence_max) val_sequence_max = val_sequence(iter)
      if (val_sequence(iter) .lt. val_sequence_min) val_sequence_min = val_sequence(iter)
    end do

    return

  end subroutine linear_search

end module ABC102


program main

  ! <module>s to import
  use, non_intrinsic :: ABC102

  ! require all variables to be explicitly declared
  implicit none

  call task_B

end program main
