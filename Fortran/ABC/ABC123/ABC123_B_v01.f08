! [contest]  ABC 123
! [task]     B
! [URL]      https://atcoder.jp/contests/abc123/tasks/ABC123_b
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc123/submissions/4870304 : AC
 
module ABC123

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: ABC123_B
  private :: calc_required_time_total
  private :: permutations
  private :: swap

  ! constants for this <module>
  integer(kind=INT32), parameter, private :: num_dishes =  5_INT32
  integer(kind=INT32), parameter, private :: time_unit  = 10_INT32

  ! variables for this <module>
  integer(kind=INT32) :: required_time(1:num_dishes)
  integer(kind=INT32) :: order(1:num_dishes)
  integer(kind=INT32) :: required_time_total

  ! contained <subroutine>s and <function>s are below
  contains

  function calc_required_time_total(order_given) result(retval)

    ! arguments for this <function>
    integer(kind=INT32), intent(in) :: order_given(1:num_dishes)

    ! variables for this <function>
    integer(kind=INT32) :: retval_mod

    ! support variables for this <function>
    integer(kind=INT32) :: itr

    ! return value of this <function>
    integer(kind=INT32) :: retval

    retval = 0_INT32

    do itr = 1_INT32, num_dishes, 1_INT32
      retval_mod = mod(retval, time_unit)
      if (retval_mod .ne. 0_INT32) retval = retval - retval_mod + time_unit
      retval = retval + required_time(order_given(itr))
    end do

    return

  end function calc_required_time_total

  subroutine swap(a, b)

    ! arguments for this <subroutine>
    integer(kind=INT32), intent(inout) :: a, b

    ! variables for this <subroutine>
    integer(kind=INT32) :: tmp

    tmp = a
    a   = b
    b   = tmp
    return

  end subroutine swap

  ! [reference]
  ! 1. https://rosettacode.org/wiki/Permutations
  ! 2. https://rosettacode.org/wiki/Permutations#Fortran
  recursive subroutine permutations (i)

    ! arguments for this <subroutine>
    integer(kind=INT32), intent(in) :: i

    ! variables for this <subroutine>
    integer(kind=INT32) :: j

    if (i .eq. num_dishes) then
      required_time_total = min(required_time_total, calc_required_time_total(order(:)))
    else
        do j = i, num_dishes, 1_INT32
          call swap(order(i), order(j))
          call permutations(i + 1_INT32)
          call swap(order(i), order(j))
        end do
    end if

    return
 
  end subroutine permutations

  subroutine ABC123_B

    ! support variables for this <subroutine>
    integer(kind=INT32) :: itr

    ! STEP.01
    ! read out the each required time
    do itr = 1_INT32, num_dishes, 1_INT32
      read(unit=INPUT_UNIT, fmt='(I3)') required_time(itr)
    end do

    ! STEP.02
    ! calculate the minimum total time
    required_time_total = huge(0_INT32)
    order(1:num_dishes) = [(itr, itr = 1_INT32, num_dishes, 1_INT32)]

    call permutations(1_INT32)

    ! STEP.04
    ! output the minimum total time
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') required_time_total

    ! STEP.END
    return

  end subroutine ABC123_B

end module ABC123


program main

  ! <module>s to import
  use, non_intrinsic :: ABC123

  ! require all variables to be explicitly declared
  implicit none

  call ABC123_B

end program main
