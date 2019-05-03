! [contest]  ABC 124
! [task]     A
! [URL]      https://atcoder.jp/contests/abc124/tasks/abc124_a
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc124/submissions/4945137

module ABC124

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_A
  private :: update_num_coins

  ! variables for this <module>
  integer(kind=INT8) :: A, B
  integer(kind=INT8) :: num_coins

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine update_num_coins

    if (A .gt. B) then
      num_coins = num_coins + A
      A         = A - 1_INT8
    else
      num_coins = num_coins + B
      B         = B - 1_INT8
    end if

  end subroutine update_num_coins

  subroutine task_A

    ! variables for this <subroutine>
    integer(kind=INT8) :: itr_trial

    ! STEP.01
    ! read out the size of the bottons
    read(unit=INPUT_UNIT, fmt=*) A, B

    ! STEP.02
    ! initialize the number of got coins
    num_coins = 0_INT8

    ! STEP.03
    ! calculate the maximum number of the coins
    do itr_trial = 1_INT8, 2_INT8, 1_INT8
      call update_num_coins
    end do

    ! STEP.04
    ! output the result
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') num_coins

    ! STEP.END
    return

  end subroutine task_A

end module ABC124


program main

  ! <module>s to import
  use, non_intrinsic :: ABC124

  ! require all variables to be explicitly declared
  implicit none

  call task_A

end program main
