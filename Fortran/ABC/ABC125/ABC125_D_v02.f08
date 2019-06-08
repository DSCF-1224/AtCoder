! [contest]  ABC 125
! [task]     D
! [URL]      https://atcoder.jp/contests/abc125/tasks/abc125_d
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc125/submissions/5827794 : AC

module ABC125

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_D

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_D

    ! variables for this <subroutine>
    integer(INT32) :: len_sequence
    
    ! arrays for this <subroutine>
    integer(INT64), allocatable :: val_sequence(:)
    integer(INT64), allocatable :: dp(:,:)

    ! support variables for this <subroutine>
    integer(INT32) :: itr

    ! STEP.01
    ! read out the length of the given sequence
    read(unit=INPUT_UNIT, fmt=*) len_sequence

    ! STEP.02
    ! allocate to store ...
    ! 1. the sequence of values
    ! 2. the process of the dynamic planning
    allocate( val_sequence(1:len_sequence) )
    allocate( dp(1:2, 1:len_sequence+1) )

    ! STEP.03
    ! read out the given sequence of values
    read(unit=INPUT_UNIT, fmt=*) val_sequence(1:len_sequence)

    ! STEP.04
    ! dynamic planning
    dp(1,1) = 0_INT64
    dp(2,1) = - sum( abs( val_sequence(1:len_sequence) ) )

    do itr = 1_INT32, len_sequence, 1_INT32
      dp(1, itr + 1) = max( dp(1, itr) + val_sequence(itr), dp(2, itr) - val_sequence(itr) )
      dp(2, itr + 1) = max( dp(1, itr) - val_sequence(itr), dp(2, itr) + val_sequence(itr) )
    end do

    ! STEP.05
    ! output the maximum value of the summation that can be realized in a given sequence
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') dp(1, len_sequence + 1)

    ! STEP.END
    return

  end subroutine task_D

end module ABC125


program main

  ! <module>s to import
  use, non_intrinsic :: ABC125

  ! require all variables to be explicitly declared
  implicit none

  call task_D

end program main
