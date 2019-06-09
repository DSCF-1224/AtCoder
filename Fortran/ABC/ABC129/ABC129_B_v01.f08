! [contest]  ABC 129
! [task]     B
! [URL]      https://atcoder.jp/contests/abc129/tasks/abc129_b
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc129/submissions/5843759 : AC

module ABC129

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_B

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_B

    ! variables for this <subroutine>
    integer(INT32) :: num_weights
    integer(INT32) :: sum_fore, sum_rear
    integer(INT32) :: difference_min

    ! support variables for this <subroutine>
    integer(INT32) :: itr

    ! arrays for this <subroutine>
    integer(INT32), allocatable :: val_weight(:)

    ! STEP.01
    ! read out the number of weights
    read(unit=INPUT_UNIT, fmt=*) num_weights

    ! STEP.02
    ! allocate the array to store the values of weight
    allocate( val_weight(1:num_weights) )

    ! STEP.03
    ! read out the values of weight
    read(unit=INPUT_UNIT, fmt=*) val_weight(1:num_weights)

    ! STEP.04
    ! search the minimum value of difference of summation of weights that can be realized in given weights
    sum_fore       = val_weight(1)
    sum_rear       = sum( val_weight(2:num_weights), dim=1 )
    difference_min = abs( sum_fore - sum_rear )

    do itr = 2_INT32, num_weights - 1_INT32, 1_INT32
      sum_fore       = sum_fore + val_weight(itr)
      sum_rear       = sum_rear - val_weight(itr)
      difference_min = min( difference_min, abs( sum_fore - sum_rear ) )
    end do

    ! STEP.05
    ! output the minimum value of difference of summation of weights that can be realized in given weights
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') difference_min

    ! STEP.05
    ! deallocate the array to store the values of weight
    deallocate( val_weight )

    ! STEP.END
    return

  end subroutine task_B

end module ABC129


program main

  ! <module>s to import
  use, non_intrinsic :: ABC129

  ! require all variables to be explicitly declared
  implicit none

  call task_B

end program main
