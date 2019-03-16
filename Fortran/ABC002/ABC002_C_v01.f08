! AtCoder Beginner Contest 002 C
! [URL]      https://atcoder.jp/contests/abc002/tasks/abc002_3
! [compiler] fortran (gfortran v4.8.4)
! [status]   AC

module ABC002

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: ABC002_C
  private :: calc_area

  ! <type> for this <module>
  type type_point
    real(kind=REAL64) :: CDX
    real(kind=REAL64) :: CDY
  end type type_point

  ! variables for this <module>
  type (type_point), private :: point_A, point_B, point_C

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine ABC002_C

    ! STEP.01
    ! read out the data
    read (unit=INPUT_UNIT, fmt=*) &!
      point_A%CDX, point_A%CDY, &!
      point_B%CDX, point_B%CDY, &!
      point_C%CDX, point_C%CDY

    ! STEP.02
    ! calculate & output the area of the triangle
    write (unit=OUTPUT_UNIT, fmt='(ES23.15e3)', advance='yes') calc_area (point_A, point_B, point_C)

    ! STEP.END
    return

  end subroutine ABC002_C

  pure function calc_area (A, B, C) result (val_area)

    ! arguments for this <function>
    type (type_point), intent(in) :: A, B, C

    ! return value of this <function>
    real(kind=REAL64) :: val_area

    val_area = abs ( (B%CDX - A%CDX) * (C%CDY - A%CDY) - (B%CDY - A%CDY) * (C%CDX - A%CDX) ) * 5.0e-01_REAL64
    return

  end function calc_area

end module ABC002

program main

  ! <module>s to import
  use, non_intrinsic :: ABC002

  call ABC002_C  

end program main
