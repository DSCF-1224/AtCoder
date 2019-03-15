! AtCoder Beginner Contest 120 B
! [URL]      https://atcoder.jp/contests/abc120/tasks/abc120_b
! [compiler] fortran (gfortran v4.8.4)

module ABC120

  ! <module> to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: ABC120_B
  private :: isMultiple

  ! variables for this <module>
  integer(kind=INT8), public  :: A, B, K

  ! contained <subroutine>s and <function>s are below
  contains

  pure function isMultiple (target, divisor) result (stat)

    ! arguments for this <function>
    integer(kind=INT8), intent(in) :: target, divisor

    ! return value of this <function>
    logical :: stat

    stat = mod (target, divisor) .eq. 0_INT8
    return

  end function isMultiple

  pure function ABC120_B (A, B, K) result (divisor)

    ! arguments for this <function>
    integer(kind=INT8), intent(in) :: A, B, K

    ! return value of this <function>
    integer(kind=INT8) :: divisor

    ! variables for this <function>
    integer(kind=INT8) :: itr_dvsr, dvsr_max, counter
  
    ! STEP.01
    ! initialize the variables
    dvsr_max = min (A, B)
    counter  = 0_INT8

    ! STEP.02
    ! search the target divisor
    do itr_dvsr = dvsr_max, 1_INT8, -1_INT8

      if ( isMultiple (target=A, divisor=itr_dvsr) .and. isMultiple (target=B, divisor=itr_dvsr) ) counter = counter + 1_INT8

      if (counter .eq. K) then
        divisor = itr_dvsr
        return
      end if

    end do

  end function ABC120_B

end module ABC120


program main

  ! <module> to import
  use, non_intrinsic :: ABC120
  
  ! STEP.01
  ! read out the data
  read *, A, B, K
  
  ! STEP.02
  ! output the result
  write (unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') ABC120_B (A, B, K)

end program main
