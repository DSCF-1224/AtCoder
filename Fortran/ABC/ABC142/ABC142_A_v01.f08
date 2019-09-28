! [contest]  ABC 142
! [task]     A
! [URL]      https://atcoder.jp/contests/abc142/tasks/abc142_a
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc142/submissions/7743789 : AC

module ABC142

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_A

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_A (num)

    ! arguments for this <subroutine>
    integer(INT32), intent(in) :: num

    ! variables for this <subroutine>
    integer(INT32)   :: itr
    integer(INT32)   :: sum
    real   (REAL128) :: possibility

    ! STEP.01
    ! calculate the answer of this task
    if (mod(num, 2_INT32) .eq. 0_INT32) then
      possibility = 5.0e-01_REAL128
    else

      sum = 0_INT32

      do itr = 1_INT32, num, 1_INT32
        if (mod(itr, 2_INT32) .ne. 0_INT32) sum = sum + 1_INT32
      end do

      possibility = sum
      possibility = possibility / num

    end if

    ! STEP.02
    ! output the answer of this task
    print *, possibility

    ! STEP.END
    return

  end subroutine task_A

end module ABC142


program main

  ! <module>s to import
  use, non_intrinsic :: ABC142

  ! require all variables to be explicitly declared
  implicit none

  ! variables for this <program>
  integer(INT32) :: N

  ! STEP.01
  ! read out the given data
  read(unit=INPUT_UNIT, fmt=*) N

  ! STEP.02
  ! calculate & output the answer of this task
  call task_A (N)

end program main

! --- EOF --- !
