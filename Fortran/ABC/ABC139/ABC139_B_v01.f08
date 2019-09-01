! [contest]  ABC 139
! [task]     B
! [URL]      https://atcoder.jp/contests/abc139/tasks/abc139_b
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc139/submissions/7262027 : AC

module ABC139

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_B

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_B

    ! variables for this <subroutine>
    integer(INT32) :: num_strip_needed
    integer(INT32) :: num_socket_strip
    integer(INT32) :: num_socket_needed
    integer(INT32) :: num_socket_total

    ! support variables for this <subroutine>
    integer(INT32) :: itr

    ! STEP.01
    ! read out the given data
    read(unit=INPUT_UNIT, fmt=*) num_socket_strip, num_socket_needed

    ! STEP.02
    ! initialize the variables for this <subroutine>
    num_strip_needed = 0_INT32
    num_socket_total = 1_INT32

    ! STEP.03
    ! calculate the answer of this task
    do while (num_socket_total .lt. num_socket_needed)
      num_strip_needed = num_strip_needed + 1_INT32
      num_socket_total = num_socket_total + num_socket_strip - 1_INT32
    end do

    ! STEP.03
    ! output the answer of this task
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') num_strip_needed

    ! STEP.END
    return

  end subroutine task_B

end module ABC139

program main

  ! <module>s to import
  use, non_intrinsic :: ABC139

  ! require all variables to be explicitly declared
  implicit none

  call task_B

end program main
