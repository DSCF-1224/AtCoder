! [contest]  ABC 133
! [task]     C
! [URL]      https://atcoder.jp/contests/abc133/tasks/abc133_c
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc133/submissions/6314014 : WA
!            https://atcoder.jp/contests/abc133/submissions/6314052 : WA

module ABC133

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_C
  private :: calculate_mod_minimum

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_C (base)

    ! arguments for this <subroutine>
    integer(INT32), intent(in) :: base

    ! variables for this <subroutine>
    integer(INT32) :: range_min
    integer(INT32) :: range_max

    ! STEP.01
    ! read out given data
    read(unit=INPUT_UNIT, fmt=*) range_min, range_max

    ! STEP.02
    ! output the answer of this task
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') calculate_mod_minimum(base, range_min, range_max)

    ! STEP.END
    return

  end subroutine task_C

  pure function calculate_mod_minimum (base, range_min, range_max) result(mod_minimum)

    ! arguments for this <function>
    integer(INT32), intent(in) :: base
    integer(INT32), intent(in) :: range_min
    integer(INT32), intent(in) :: range_max

    ! arrays for this <function>
    integer(INT32), dimension(:), allocatable :: data_mod

    ! return value of this <function>
    integer(INT32) :: mod_minimum

    ! variables for this <function>
    integer(INT32) :: mod_minimum_1st
    integer(INT32) :: mod_minimum_2nd

    ! support variables for this <function>
    integer(INT32) :: itr

    if (range_max - range_min .ge. base) then
      mod_minimum = 0_INT32
    else

      allocate( data_mod(range_min:range_max) )

      do itr = range_min, range_max, 1_INT32
        data_mod(itr) = mod(itr, base)
      end do

      mod_minimum_1st = minval(data_mod(:), dim=1)

      if (mod_minimum_1st .eq. 0_INT32) then
        mod_minimum = 0_INT32
        return
      else
        mod_minimum_2nd = minval(data_mod(:), dim=1, mask=data_mod .gt. mod_minimum_1st)
        mod_minimum     = mod(mod_minimum_1st * mod_minimum_2nd, base)
      end if

      deallocate( data_mod )

    end if

    return

  end function calculate_mod_minimum

end module ABC133


program main

  ! <module>s to import
  use, non_intrinsic :: ABC133

  ! require all variables to be explicitly declared
  implicit none

  call task_C (2019_INT32)

end program main
