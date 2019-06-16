! [contest]  ABC 130
! [task]     ?
! [URL]      https://atcoder.jp/contests/abc130/tasks/abc130_?
! [compiler] fortran (gfortran v4.8.4)
! [status]   NOT Submitted

module ABC130

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_A

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_A

    ! variables for this <subroutine>
    integer(INT8) :: X, A

    ! STEP.01
    ! read out the given integer
    read(unit=INPUT_UNIT, fmt=*) X, A

    ! STEP.02
    ! output the result
    if (X .lt. A) then
      write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') 0_INT8
    else
      write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') 10_INT8
    end if

    ! STEP.END
    return

  end subroutine task_A

end module ABC130


program main

  ! <module>s to import
  use, non_intrinsic :: ABC130

  ! require all variables to be explicitly declared
  implicit none

  call task_A

end program main
