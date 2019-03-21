! AtCoder Beginner Contest 004 C
! [URL]      https://atcoder.jp/contests/abc004/tasks/abc004_3
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc004/submissions/4652344 : TLE

module ABC004

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: ABC004_C
  private :: initialize_val_card
  private :: swap_INT8

  ! constants for this <module>
  integer, parameter, private :: num_cards = 6

  ! variables for this <module>
  integer (kind=INT8), private :: val_card(1:num_cards)

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine ABC004_C

    ! variables for this <subroutine>
    integer (kind=INT8 ) :: buf_val_card, elem
    integer (kind=INT32) :: itr
    integer (kind=INT32) :: num_operation

    ! STEP.01
    ! read out the number of operation
    read (unit=INPUT_UNIT, fmt='(I10)') num_operation

    ! STEP.02
    ! initialize the value of the cards
    call initialize_val_card

    ! STEP.03
    ! exchange the cards
    do itr = 0, num_operation-1_INT32, 1
      elem = 1_INT8 + mod (itr, 5_INT32)
      call swap_INT8 ( val_card(elem), val_card(elem+1_INT8) )
    end do

    ! STEP.04
    ! output the result
    write (unit=OUTPUT_UNIT, fmt='(6(I1))', advance='yes') val_card(1:num_cards)

    ! STEP.END
    return

  end subroutine ABC004_C

  subroutine initialize_val_card

    ! variables for this <subroutine>
    integer (kind=INT8) :: itr

    val_card(1:num_cards) = (/ (itr, itr=1_INT8, num_cards, 1_INT8) /)
    return

  end subroutine initialize_val_card

  subroutine swap_INT8 (a, b)

    ! arguments for this <subroutine>
    integer (kind=INT8), intent(inout) :: a, b

    ! variables for this <subroutine>
    integer (kind=INT8) :: buf

    buf = a; a = b; b = buf;

  end subroutine swap_INT8

end module ABC004

program main

  ! <module>s to import
  use, non_intrinsic :: ABC004

  call ABC004_C

end program main
