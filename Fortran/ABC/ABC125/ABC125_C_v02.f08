! [contest]  ABC 125
! [task]     C
! [URL]      https://atcoder.jp/contests/abc125/tasks/abc125_c
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc125/submissions/5825611 : AC

module ABC125

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_C
  private :: calculate_gcd

  ! variables for this <module>
  integer(INT32), private              :: num_integers
  integer(INT32), private              :: gcd_max
  integer(INT32), private, allocatable :: list_integer (:)
  integer(INT32), private, allocatable :: list_gcd_fore(:)
  integer(INT32), private, allocatable :: list_gcd_rear(:)

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_C

    ! support variables for this <subroutine>
    integer(INT32) :: itr

    ! STEP.01
    ! read out the number of given integers
    read(unit=INPUT_UNIT, fmt=*) num_integers

    ! STEP.02
    ! allocate the array to store the given integers
    allocate( list_integer (1:num_integers  ) )
    allocate( list_gcd_fore(0:num_integers+1) )
    allocate( list_gcd_rear(1:num_integers+1) )

    ! STEP.03
    ! read out the given integers
    read(unit=INPUT_UNIT, fmt=*) list_integer(1:num_integers)

    ! STEP.04
    ! calculate the greatesst common divisors
    list_gcd_fore(0               ) = 0_INT32
    list_gcd_rear(num_integers + 1) = 0_INT32

    do itr = 0_INT32, num_integers, 1_INT32
      list_gcd_fore(itr+1) = calculate_gcd( list_gcd_fore(itr), list_integer(itr) )
    end do

    do itr = num_integers, 1_INT32, -1_INT32
      list_gcd_rear(itr) = calculate_gcd( list_gcd_rear(itr+1), list_integer(itr) )
    end do

    gcd_max = 0_INT32

    do itr = 1_INT32, num_integers, 1_INT32
      gcd_max = max(gcd_max, calculate_gcd( list_gcd_fore(itr), list_gcd_rear(itr+1) ))
    end do

    ! STEP.05
    ! output the maximum greatest common divisor
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') gcd_max

    ! STEP.06
    ! deallocate the array to store the given integers
    deallocate( list_integer  )
    deallocate( list_gcd_fore )
    deallocate( list_gcd_rear )

    ! STEP.END
    return

  end subroutine task_C

  recursive function calculate_gcd (x, y) result(gcd)

    ! arguments for this <function>
    integer(INT32), intent(in) :: x, y

    ! return value of this <function>
    integer(INT32) :: gcd

    if (y .eq. 0_INT32) then
      gcd = x
    else
      gcd = calculate_gcd(y, mod(x, y))
    end if

    return

  end function calculate_gcd

end module ABC125


program main

  ! <module>s to import
  use, non_intrinsic :: ABC125

  ! require all variables to be explicitly declared
  implicit none

  call task_C

end program main
