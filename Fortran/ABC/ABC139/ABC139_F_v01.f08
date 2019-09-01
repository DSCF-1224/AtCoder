! [contest]  ABC 139
! [task]     F
! [URL]      https://atcoder.jp/contests/abc139/tasks/abc139_f
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc139/submissions/7290249 : WA
!            https://atcoder.jp/contests/abc139/submissions/7292200 : WA

module ABC139

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  type coordinate
    real(REAL128), public :: x
    real(REAL128), public :: y
    real(REAL128), public :: distance
  end type coordinate

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_F

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_F

    ! variables for this <subroutine>
    integer(INT32) :: num_engines
    real(REAL128)  :: x_max, x_read, x_trial
    real(REAL128)  :: y_max, y_read, y_trial
    real(REAL128)  :: distance_max
    real(REAL128)  :: distance_trial

    ! support variables for this <subroutine>
    integer(INT32) :: itr

    ! STEP.01
    ! read out the given data (the number of engines)
    read(unit=INPUT_UNIT, fmt=*) num_engines

    ! STEP.02
    ! initialize the variables for this <subroutine>
    distance_max = 0.0_REAL128
    x_max        = 0.0_REAL128
    y_max        = 0.0_REAL128
    x_trial      = 0.0_REAL128
    y_trial      = 0.0_REAL128

    ! STEP.03
    ! calculate the answer of this task
    do itr = 1, num_engines, 1

      ! read out the given data (the movement by the each engine)
      read(unit=INPUT_UNIT, fmt=*) x_read, y_read

      x_trial        = x_trial + x_read
      y_trial        = y_trial + y_read
      distance_trial = sqrt(x_trial * x_trial + y_trial * y_trial)

      if (distance_trial .gt. distance_max) then
        x_max        = x_trial
        y_max        = y_trial
        distance_max = distance_trial
      end if

    end do

    ! STEP.04
    ! output the answer of this task
    write(unit=OUTPUT_UNIT, fmt='(ES44.36e3)', advance='yes') distance_max

    ! STEP.END
    return

  end subroutine task_F

end module ABC139

program main

  ! <module>s to import
  use, non_intrinsic :: ABC139

  ! require all variables to be explicitly declared
  implicit none

  call task_F

end program main
