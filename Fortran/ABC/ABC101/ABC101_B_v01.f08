! [contest]  ABC 101
! [task]     B
! [URL]      https://atcoder.jp/contests/abc101/tasks/abc101_b
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc101/submissions/5247516 : AC

module ABC101

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_B

  ! variables for this <module>
  integer(INT32) :: integer_target, integer_buffer
  integer(INT32) :: sum_digits

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_B

    ! variables for this <subroutine>
    integer :: iter

    ! STEP.01
    ! read out the target integer string
    read(unit=INPUT_UNIT, fmt=*) integer_target

    ! STEP.03
    ! calculate the summation of the digits of the target integer
    sum_digits     = 0_INT32
    integer_buffer = integer_target

    do while(integer_buffer .gt. 0_INT32)
      ! print *, integer_buffer, mod(integer_buffer, 10_INT32), sum_digits ! for debug
      sum_digits     = sum_digits + mod(integer_buffer, 10_INT32)
      integer_buffer = integer_buffer / 10_INT32
    end do

    ! STEP.04
    ! output the status of the target integer
    if (mod(integer_target, sum_digits) .eq. 0_INT32) then
      write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') 'Yes'
    else
      write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') 'No'
    end if

    ! STEP.END
    return

  end subroutine task_B

end module ABC101


program main

  ! <module>s to import
  use, non_intrinsic :: ABC101

  ! require all variables to be explicitly declared
  implicit none

  call task_B

end program main
