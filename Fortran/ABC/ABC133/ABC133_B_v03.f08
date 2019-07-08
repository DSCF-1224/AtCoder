! [contest]  ABC 133
! [task]     B
! [URL]      https://atcoder.jp/contests/abc133/tasks/abc133_b
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc133/submissions/6313344 : AC

module ABC133

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_B
  private :: calc_distance2
  private :: is_GoodDistance

  ! variables for this <module>
  integer(INT32) :: num_point_all
  integer(INT32) :: num_point_GD
  integer(INT32) :: val_dimension

  ! arrays for this <module>
  integer(INT32), dimension(:,:), allocatable :: coordinate

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_B

    ! support variables for this <subroutine>
    integer(INT32) :: itr
    integer(INT32) :: itr_orign, itr_target

    ! STEP.01
    ! read out the given data (1/2)
    read(unit=INPUT_UNIT, fmt=*) num_point_all, val_dimension

    ! STEP.02
    ! allocate the array to store the data of the points
    allocate( coordinate(1:val_dimension, 1:num_point_all) )

    ! STEP.03
    ! read out the given data (1/2)
    do itr = 1, num_point_all, 1
      read(unit=INPUT_UNIT, fmt=*) coordinate(:, itr)
    end do

    ! STEP.04
    ! calculate the answer of this task
    num_point_GD = 0_INT32

    do itr_orign  = 1,             num_point_all, 1
    do itr_target = itr_orign + 1, num_point_all, 1

      if ( is_GoodDistance( calc_distance2( coordinate(:, itr_orign), coordinate(:, itr_target) ) ) ) then
        num_point_GD = num_point_GD + 1_INT32
      else
        continue
      end if

    end do
    end do

    ! STEP.05
    ! output the answer of this task
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') num_point_GD

    ! STEP.06
    ! deallocate the array to store the data of the points
    deallocate( coordinate )

    ! STEP.END
    return

  end subroutine task_B

  pure function calc_distance2 (coordinate_orign, coordinate_target) result(distance)

    ! arguments for this <function>
    integer(INT32), dimension(1:val_dimension), intent(in) :: coordinate_orign
    integer(INT32), dimension(1:val_dimension), intent(in) :: coordinate_target

    ! return value of this <function>
    integer(INT32) :: distance

    ! support variables for this <function>
    integer(INT32) :: difference
    integer(INT32) :: itr

    distance = 0_INT32

    do itr = 1, val_dimension, 1
      difference = coordinate_target(itr) - coordinate_orign(itr)
      distance   = distance + difference * difference
    end do

    return

  end function calc_distance2

  pure function is_GoodDistance (val_distance) result(stat)

    ! arguments for this <function>
    integer(INT32), intent(in) :: val_distance

    ! return value of this <function>
    logical :: stat

    ! support variables for this <subroutine>
    integer(INT32) :: itr, itr2

    stat = .false.

    do itr = 0_INT32, val_distance, 1_INT32

      itr2 = itr * itr

      if (itr2 .eq. val_distance) then
        stat = .true.
        exit
      end if

    end do

    return

  end function is_GoodDistance

end module ABC133


program main

  ! <module>s to import
  use, non_intrinsic :: ABC133

  ! require all variables to be explicitly declared
  implicit none

  call task_B

end program main
