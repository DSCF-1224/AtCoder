! [contest]  ABC 129
! [task]     C
! [URL]      https://atcoder.jp/contests/abc129/tasks/abc129_c
! [compiler] fortran (gfortran v4.8.4)
! [status]   NOT Submitted

module ABC129

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_C

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_C

    ! variables for this <subroutine>
    integer(INT32) :: num_stairs_total
    integer(INT32) :: num_stairs_broken
    integer(INT64) :: sum_ways

    ! arrays for this <subroutine>
    integer(INT32), allocatable :: index_broken_stair(:)
    integer(INT64), allocatable :: list_sum_ways(:)

    ! support variables for this <subroutine>
    integer(INT32) :: itr

    ! STEP.01
    ! read out the number of total & broken stairs
    read(unit=INPUT_UNIT, fmt=*) num_stairs_total, num_stairs_broken

    ! STEP.02
    ! allocate the array to store ...
    ! 1. the indexes of broken stairs
    ! 2. how many are there to climb up to the `itr`-th step
    allocate( index_broken_stair(1:num_stairs_broken) )
    allocate( list_sum_ways     (1:num_stairs_total ) )

    ! STEP.03
    ! read out indexes of broken stairs
    do itr = 1_INT32, num_stairs_broken, 1_INT32
      read(unit=INPUT_UNIT, fmt=*) index_broken_stair(itr)
    end do

    ! STEP.04
    ! check which step can not be stepped
    list_sum_ways(1)                  =  1_INT64
    list_sum_ways(2)                  =  2_INT64
    list_sum_ways(3:num_stairs_total) = -1_INT64

    do itr = 1_INT32, num_stairs_broken, 1_INT32
      list_sum_ways( index_broken_stair(itr) ) = 0_INT64
    end do

    ! STEP.05
    ! calculate how many are there to climb up to the top step
    do itr = 3_INT32, num_stairs_total, 1_INT32
      if ( list_sum_ways(itr) .eq. 0_INT64 ) then
        continue
      else
        list_sum_ways(itr) = mod( list_sum_ways(itr-2) + list_sum_ways(itr-1), 1000000007_INT64 )
      end if
    end do

    ! STEP.06
    ! output how many are there to climb up to the top step
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') sum_ways

    ! STEP.07
    ! deallocate the array to store the indexes of broken stairs
    deallocate( index_broken_stair )
    deallocate( list_sum_ways      )

    ! STEP.END
    return

  end subroutine task_C

end module ABC129


program main

  ! <module>s to import
  use, non_intrinsic :: ABC129

  ! require all variables to be explicitly declared
  implicit none

  call task_C

end program main
