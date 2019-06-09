! [contest]  ABC 101 / ARC 099
! [task]     C
! [URL]      https://atcoder.jp/contests/abc101/tasks/arc099_a
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc101/submissions/5832283 : AC

module ABC101

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_C
  private :: calculate_min_num_operations

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_C

    ! variables for this <subroutine>
    integer(INT32) :: len_sequence
    integer(INT32) :: num_elements_replacing

    ! STEP.01
    ! read out ...
    ! 1. the length of the given sequence
    ! 2. the number of elements to replace at once
    read(unit=INPUT_UNIT, fmt=*) len_sequence, num_elements_replacing

    ! STEP.02
    ! calculate & output minumum value of the number of operations that can be realized in a given sequence
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') calculate_min_num_operations(len_sequence, num_elements_replacing)

    ! STEP.END
    return

  end subroutine task_C

  pure function calculate_min_num_operations (len_sequence, num_elements_replacing) result(num_operations)

    ! arguments for this <function>
    integer(INT32), intent(in) :: len_sequence
    integer(INT32), intent(in) :: num_elements_replacing

    ! return value of this <function>
    integer(INT32) :: num_operations

    num_operations &!
      = ceiling( &!
        real(len_sequence           - 1_INT32, kind=REAL64) / &!
        real(num_elements_replacing - 1_INT32, kind=REAL64),  &!
        kind=INT32                                            &!
      )

      return

  end function calculate_min_num_operations

end module ABC101


program main

  ! <module>s to import
  use, non_intrinsic :: ABC101

  ! require all variables to be explicitly declared
  implicit none

  call task_C

end program main
