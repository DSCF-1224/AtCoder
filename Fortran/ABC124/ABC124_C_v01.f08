! [contest]  ABC 124
! [task]     C
! [URL]      https://atcoder.jp/contests/abc124/tasks/abc124_c
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc124/submissions/4964270 : AC

module ABC124

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_C

  ! constants for this <module>
  integer(kind=INT32), parameter, private :: len_string_max = 100000_INT32

  ! variables for this <module>
  character(len=len_string_max, kind=1) :: given_string
  character(len=len_string_max, kind=1) :: reference_0, reference_1
  integer  (kind=INT32)                 :: len_string
  integer  (kind=INT32)                 :: num_operations(0:1)

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_C

    ! variables for this <subroutine>
    integer(kind=INT32) :: itr

    ! STEP.01
    ! read out the given string
    read(unit=INPUT_UNIT, fmt='(A)') given_string

    ! STEP.02
    ! count up the number of operations
    len_string     = len_trim(given_string)
    num_operations = 0_INT32

    do itr = 1_INT32, len_string, 2_INT32
      reference_0(itr:itr) = '0'
      reference_1(itr:itr) = '1'
    end do

    do itr = 2_INT32, len_string, 2_INT32
      reference_0(itr:itr) = '1'
      reference_1(itr:itr) = '0'
    end do

    do itr = 1_INT32, len_string, 1_INT32
      if (given_string(itr:itr) .ne. reference_0(itr:itr)) num_operations(0) = num_operations(0) + 1_INT32
      if (given_string(itr:itr) .ne. reference_1(itr:itr)) num_operations(1) = num_operations(1) + 1_INT32
    end do

    ! STEP.04
    ! output the result
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') min(num_operations(0), num_operations(1))

    ! STEP.END
    return

  end subroutine task_C

end module ABC124


program main

  ! <module>s to import
  use, non_intrinsic :: ABC124

  ! require all variables to be explicitly declared
  implicit none

  call task_C

end program main
