! [contest]    AtCoder Beginner Contest 002
! [task]       A
! [URL]        https://atcoder.jp/contests/abc002/tasks/abc002_1
! [compiler]   fortran (gfortran v4.8.4)
! [submission] https://atcoder.jp/contests/abc002/submissions/4980196 : AC

module ABC002

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_A

  ! variables for this <module>
  integer(kind=INT32), private :: A, B

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_A

    ! STEP.01
    ! read out the given two integers
    read(unit=INPUT_UNIT, fmt=*) A, B

    ! STEP.02
    ! output the bigger integer
    if (A .gt. B) then
      write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') A
    else
      write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') B
    end if

    ! STEP.END
    return

  end subroutine task_A

end module ABC002

program main

	! <module>s to import
	use, non_intrinsic :: ABC002

	! require all variables to be explicitly declared
	implicit none

	call task_A

end program main
