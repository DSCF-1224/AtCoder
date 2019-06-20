! [contest]  ABC 130
! [task]     C
! [URL]      https://atcoder.jp/contests/abc130/tasks/abc130_c
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc130/submissions/6004304 : AC

module ABC130

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_C
  private :: calculate_area
  private :: judge_pattern

  ! <type> for this <module>
  type coordinate
    integer(INT32), public :: x
    integer(INT32), public :: y
  end type coordinate

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_C

    ! variables for this <subroutine>
    type(coordinate) :: rectangle
    type(coordinate) :: point

    ! STEP.01
    ! read out the coordinates
    read(unit=INPUT_UNIT, fmt=*) &!
      rectangle%x, rectangle%y, &!
      point%x,     point%y

    ! STEP.03
    ! calculate & output the result
    write(unit=OUTPUT_UNIT, fmt='(ES23.15e3,1X,I1)', advance='yes'), &!
      calculate_area (rectangle),       &!
      judge_pattern  (rectangle, point)

    ! STEP.END
    return

  end subroutine task_C

  pure function calculate_area (data_rectangle) result(val_area)

    ! arguments for this <function>
    type(coordinate), intent(in) :: data_rectangle

    ! return value of this <function>
    real(REAL64) :: val_area

    val_area = 5.0e-001_REAL64 * data_rectangle%x * data_rectangle%y
    return

  end function calculate_area

  pure function judge_pattern (data_rectangle, data_point) result (val_stat)

    ! arguments for this <function>
    type(coordinate), intent(in) :: data_rectangle
    type(coordinate), intent(in) :: data_point

    ! return value of this <function>
    integer(INT8) :: val_stat

    ! variables for this <function>
    logical :: stat_x, stat_y

    stat_x = data_rectangle%x .eq. data_point%x + data_point%x
    stat_y = data_rectangle%y .eq. data_point%y + data_point%y

    if (stat_x .and. stat_y) then
      val_stat = 1_INT8
    else
      val_stat = 0_INT8
    end if

    return

  end function judge_pattern

end module ABC130


program main

  ! <module>s to import
  use, non_intrinsic :: ABC130

  ! require all variables to be explicitly declared
  implicit none

  call task_C

end program main
