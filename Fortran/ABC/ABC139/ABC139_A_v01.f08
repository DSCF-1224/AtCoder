! [contest]  ABC 139
! [task]     A
! [URL]      https://atcoder.jp/contests/abc139/tasks/abc139_a
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc139/submissions/7252697 : AC

module ABC139

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_A

  ! constants for this <module>
  integer(INT32), parameter, private :: len_data = 3_INT32

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_A

    ! variables for this <subroutine>
    character(len=len_data, kind=1) :: weather_estimated
    character(len=len_data, kind=1) :: weather_real
    integer(INT32)                  :: num_day

    ! support variables for this <subroutine>
    integer(INT32) :: itr

    ! STEP.01
    ! read out the given data
    read(unit=INPUT_UNIT, fmt='(A)') weather_estimated
    read(unit=INPUT_UNIT, fmt='(A)') weather_real

    ! STEP.02
    ! initialize the variables for this <subroutine>
    num_day = 0_INT32

    ! STEP.03
    ! calculate the answer of this task
    do itr = 1_INT32, len_data, 1_INT32
      if (weather_estimated(itr:itr) .eq. weather_real(itr:itr)) num_day = num_day + 1_INT32
    end do

    ! STEP.03
    ! output the answer of this task
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') num_day

    ! STEP.END
    return

  end subroutine task_A

end module ABC139

program main

  ! <module>s to import
  use, non_intrinsic :: ABC139

  ! require all variables to be explicitly declared
  implicit none

  call task_A

end program main
