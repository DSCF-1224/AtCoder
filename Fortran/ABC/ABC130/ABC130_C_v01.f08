! [contest]  ABC 130
! [task]     C
! [URL]      https://atcoder.jp/contests/abc130/tasks/abc130_c
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc130/submissions/5984138 : WA
!            https://atcoder.jp/contests/abc130/submissions/5984755 : WA

module ABC130

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_C
  private :: adjust_point
  private :: exchange_coordinate
  private :: rotate_rectangle

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

    ! STEP.02
    ! adjust the given data
    call exchange_coordinate (point, rectangle)
    call rotate_rectangle    (rectangle)
    call adjust_point        (point, rectangle)

    ! STEP.03
    ! calculate & output the result
    if (rectangle%x/2 .eq. point%x) then
      write(unit=OUTPUT_UNIT, fmt='(ES23.15e3,1X,I1)', advance='yes') &!
        5.0e-001_REAL64 * rectangle%x * rectangle%y, &!
        1_INT8
    else
      write(unit=OUTPUT_UNIT, fmt='(ES23.15e3,1X,I1)', advance='yes') &!
        5.0e-001_REAL64 * point%x * rectangle%y, &!
        0_INT8
    end if

    ! STEP.END
    return

  end subroutine task_C

  subroutine adjust_point (data_point, data_rectangle)

    ! arguments for this <subroutine>
    type(coordinate), intent(inout) :: data_point
    type(coordinate), intent(in)    :: data_rectangle

    ! variables for this <subroutine>
    integer(INT32) :: buffer

    if (data_point%x .gt. data_rectangle%x / 2) then
      data_point%x = data_rectangle%x - data_point%x
    end if

    return

  end subroutine adjust_point

  subroutine rotate_rectangle (data_rectangle)

    ! arguments for this <subroutine>
    type(coordinate), intent(inout) :: data_rectangle

    ! variables for this <subroutine>
    integer(INT32) :: buffer_min, buffer_max

    buffer_min = min(data_rectangle%x, data_rectangle%y)
    buffer_max = max(data_rectangle%x, data_rectangle%y)

    data_rectangle%x = buffer_max
    data_rectangle%y = buffer_min

    return

  end subroutine rotate_rectangle

  subroutine exchange_coordinate (data_point, data_rectangle)

    ! arguments for this <subroutine>
    type(coordinate), intent(inout) :: data_point
    type(coordinate), intent(in)    :: data_rectangle

    ! variables for this <subroutine>
    integer(INT32) :: buffer

    if (data_rectangle%x .lt. data_rectangle%y) then
      buffer       = data_point%y
      data_point%y = data_point%x
      data_point%x = buffer
    end if

    return

  end subroutine exchange_coordinate

end module ABC130


program main

  ! <module>s to import
  use, non_intrinsic :: ABC130

  ! require all variables to be explicitly declared
  implicit none

  call task_C

end program main
