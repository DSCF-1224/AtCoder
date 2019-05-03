! [contest]  ABC 125
! [task]     C
! [URL]      https://atcoder.jp/contests/abc125/tasks/abc125_c
! [compiler] fortran (gfortran v4.8.4)
! [status]   NOT Submitted

module ABC125

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_C
  private :: calc_GCD

  ! constants for this <program>
  integer(INT32), parameter, private :: num_integers_max = 10_INT32 ** 5_INT32

  ! variables for this <module>
  integer(INT32), private :: num_integers

  ! arrays for this <module>
  integer(INT32), private :: val_integer(1:num_integers_max)
  integer(INT32), private :: val_GCD    (1:num_integers_max)

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_C

    ! support variables for this <subroutine>
    integer :: iter_elem
    integer :: iter_trgt

    ! STEP.01
    ! read out the number of target integers
    read(unit=INPUT_UNIT, fmt=*) num_integers

    ! STEP.02
    ! read out the value of the given integers
    read(unit=INPUT_UNIT, fmt=*) val_integer(1:num_integers)

    val_GCD(:) = 0_INT32

    do iter_trgt = 1, num_integers, 1

      do iter_elem = 1, num_integers, 1
        if (iter_elem .ne. iter_trgt) then
          val_GCD(iter_trgt) = calc_GCD(val_GCD(iter_trgt), val_integer(iter_elem))
        end if
      end do

    end do

    ! STEP.03
    ! output the maximum value of the greatest common divisor
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') maxval(val_GCD(:), dim=1)

    ! STEP.END
    return

  end subroutine task_C

  pure function calc_GCD(target1, target2) result(gcd)

    ! arguments for this <function>
    integer(INT32), intent(in) :: target1, target2

    ! return value of this <function>
    integer(INT32) :: gcd

    ! variables for this <function>
    integer(INT32) :: buffer, buffer1, buffer2

    ! STEP.01
    ! handle the exception
    if (target1 .eq. 0_INT32) then; gcd = target2; return; end if
    if (target2 .eq. 0_INT32) then; gcd = target1; return; end if

    ! STEP.02
    ! store the values of the given integers
    buffer1 = target1
    buffer2 = target2

    ! STEP.03
    ! calculate the greatest common divisor
    do while (buffer2 .ne. 0_INT32)
      buffer  = mod(buffer1, buffer2)
      buffer1 = buffer2
      buffer2 = buffer
    end do

    gcd = buffer1

    ! STEP.END
    return

  end function calc_GCD

end module ABC125


program main

  ! <module>s to import
  use, non_intrinsic :: ABC125

  ! require all variables to be explicitly declared
  implicit none

  call task_C

end program main
