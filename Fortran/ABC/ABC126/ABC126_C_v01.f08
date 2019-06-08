! [contest]  ABC 126
! [task]     C
! [URL]      https://atcoder.jp/contests/abc126/tasks/abc126_c
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc126/submissions/5823762 : AC
! [status]   https://atcoder.jp/contests/abc126/submissions/5823784 : AC

module ABC126

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_C
  private :: calculate_probability_win

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_C

    ! variables for this <subroutine>
    integer(INT32) :: num_sides_dice
    integer(INT32) :: val_limit_win

    ! STEP.01
    ! read out ...
    ! 1. the number of sides of the given dice
    ! 2. the minimum points to win
    read(unit=INPUT_UNIT, fmt=*), num_sides_dice, val_limit_win

    ! STEP.02
    ! calculate and output the probability of winning this game under given conditions
    write(unit=OUTPUT_UNIT, fmt='(ES23.15e3)', advance='yes') calculate_probability_win (num_sides_dice, val_limit_win)

    ! STEP.END
    return

  end subroutine task_C

  pure function calculate_probability_win (num_sides_dice, val_limit_win) result(prbl_win)

    ! arguments for this <function>
    integer(INT32), intent(in) :: num_sides_dice
    integer(INT32), intent(in) :: val_limit_win

    ! return value of this <function>
    real(REAL64) :: prbl_win

    ! variables for this <function>
    integer(INT32)  :: points
    real   (REAL64) :: prbl_dice_simple_event
    real   (REAL64) :: prbl_coin_simple_event
    real   (REAL64) :: prbl_unit

    ! support variables for this <function>
    integer(INT32) :: itr_side

    ! STEP.01
    ! calculate & store the probability of simple event
    prbl_coin_simple_event = 5.0e-001_REAL64
    prbl_dice_simple_event = 1.0e+000_REAL64 / num_sides_dice

    ! STEP.02
    ! initialize the variable to store the total probability that points will reach the winning condition
    prbl_win = 0.0e+000_REAL64

    ! STEP.03
    ! calculate the total probability that points will reach the winning condition
    do itr_side = 1_INT32, num_sides_dice, 1_INT32

      ! STEP.03.01
      ! initialize the variable to store ...
      ! 1. the current points
      ! 2. the probability that points will reach the winning condition under a side of dice
      points    = itr_side
      prbl_unit = prbl_dice_simple_event

      ! STEP.03.02
      ! calculate the probability that points will reach the winning condition under a side of dice
      do while (points .lt. val_limit_win)
        points    = points    * 2_INT32
        prbl_unit = prbl_unit * prbl_coin_simple_event
      end do

      ! STEP.03
      ! update the total probability that points will reach the winning condition
      prbl_win = prbl_win + prbl_unit

    end do

    ! STEP.END
    return

  end function

end module ABC126


program main

  ! <module>s to import
  use, non_intrinsic :: ABC126

  ! require all variables to be explicitly declared
  implicit none

  call task_C

end program main
