! [contest]  ABC 131
! [task]     A
! [URL]      https://atcoder.jp/contests/abc131/tasks/abc131_a
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc131/submissions/6062304 : AC

module ABC131

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_A

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_A (order)

    ! arguments for this <subroutine>
    integer(INT32), intent(in) :: order

    ! variables for this <subroutine>
    integer(INT32) :: given_integer

    ! arrays for this <subroutine>
    integer(INT32), dimension(0:order) :: data_digit

    ! support variables for this <subroutine>
    integer(INT32) :: itr

    ! STEP.01
    ! read out the given integer
    read(unit=INPUT_UNIT, fmt=*) given_integer

    ! STEP.02
    ! get the value of each digit
    do itr = 0_INT32, order, 1_INT32
      data_digit(itr) =                   mod(given_integer, 10_INT32 ** (itr + 1_INT32))
      data_digit(itr) = data_digit(itr) - mod(given_integer, 10_INT32 ** itr            )
      data_digit(itr) = data_digit(itr) / 10_INT32 ** itr
    end do

    ! STEP.03
    ! judge the digits
    if (data_digit(0) .eq. data_digit(1) .or. data_digit(1) .eq. data_digit(2) .or. data_digit(2) .eq. data_digit(3)) then
      write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') 'Bad'
    else
      write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') 'Good'
    end if

    ! STEP.END
    return

  end subroutine task_A

end module ABC131


program main

  ! <module>s to import
  use, non_intrinsic :: ABC131

  ! require all variables to be explicitly declared
  implicit none

  call task_A (3)

end program main
