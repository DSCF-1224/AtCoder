! [contest]    AtCoder Beginner Contest 002
! [task]       C
! [URL]        https://atcoder.jp/contests/abc002/tasks/abc002_3
! [compiler]   fortran (gfortran v4.8.4)
! [submission] https://atcoder.jp/contests/abc002/submissions/4992398 : AC

module ABC002

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_C
  private :: sub_type_point
  private :: calc_area

  ! <type> for this <module>
  type type_point
    real(kind=REAL64) :: CDX
    real(kind=REAL64) :: CDY
  end type type_point

  ! <interface>s for this <module>
  interface operator (-)
    module procedure sub_type_point
  end interface operator (-)

  ! variables for this <module>
  type (type_point), private :: point_A, point_B, point_C

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_C

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

  end subroutine task_C

  pure function sub_type_point(A, B) result(retval)

    ! arguments for this <function>
    type (type_point), intent(in) :: A, B

    ! return value of this <function>
    type (type_point) :: retval

    retval%CDX = A%CDX - B%CDX
    retval%CDY = A%CDY - B%CDY
    return

  end function sub_type_point

  pure function calc_area (A, B, C) result (val_area)

    ! arguments for this <function>
    type (type_point), intent(in) :: A, B, C

    ! variables for this <function>
    type (type_point) :: vector_AB, vector_AC

    ! return value of this <function>
    real(kind=REAL64) :: val_area

    vector_AB = point_B - point_A
    vector_AC = point_C - point_A
    val_area  = abs ( vector_AB%CDX * vector_AC%CDY - vector_AB%CDY * vector_AC%CDX ) * 5.0e-01_REAL64
    return

  end function calc_area

end module ABC002

program main

  ! <module>s to import
  use, non_intrinsic :: ABC002

  ! require all variables to be explicitly declared
  implicit none

  call task_C  

end program main
