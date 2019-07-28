! [contest]  ABC 135
! [task]     C
! [URL]      https://atcoder.jp/contests/abc135/tasks/abc135_c
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc135/submissions/6588807 : WA, AC*4, RE*12, WA*1
!            https://atcoder.jp/contests/abc135/submissions/6588885 : WA, AC*4, RE*12, WA*1
!            https://atcoder.jp/contests/abc135/submissions/6588909 : WA, AC*4
!            https://atcoder.jp/contests/abc135/submissions/6588932 : WA, AC*2

module ABC135

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_C

  ! contained <subroutine>s and <function>s are below
  contains
  
  subroutine task_C

    ! variables for this <subroutine>
    integer(INT32) :: num_city
    integer(INT32) :: num_Killed_total

    ! arrays for this <subroutine>
    integer(INT64), dimension(:),   allocatable :: num_monster
    integer(INT64), dimension(:,:), allocatable :: num_Killed
    integer(INT64), dimension(:),   allocatable :: num_ToKill

    ! support variables for this <subroutine>
    integer(INT32) :: itr
    
    ! STEP.01
    ! read out the given data
    ! (length of the given sequence)
    read(unit=INPUT_UNIT, fmt=*) num_city

    ! STEP.02
    ! allocate the array to store the given data
    allocate( num_monster(1_INT32:num_city + 1_INT32) )
    allocate( num_ToKill(1_INT32:num_city) )
    allocate( num_Killed(1_INT32:2_INT32, 1_INT32:num_city) )

    ! STEP.03
    ! read out the given data
    ! (values of the given sequence)
    read(unit=INPUT_UNIT, fmt=*) num_monster(:)
    read(unit=INPUT_UNIT, fmt=*) num_ToKill(:)

    ! STEP.04
    ! calculate the answer of this task

    num_Killed(1_INT32, 1_INT32) = min( num_monster(1_INT32), num_ToKill(1_INT32) )
    num_Killed(2_INT32, 1_INT32) = min( num_monster(2_INT32), num_ToKill(1_INT32) - num_Killed(1_INT32, 1_INT32) )

    do itr = 2_INT32, num_city, 1_INT32
      num_Killed(1_INT32, itr) = min( num_monster(itr) - num_Killed(2_INT32, itr - 1_INT32), num_ToKill(itr) )
      num_Killed(2_INT32, itr) = min( num_monster(itr + 1_INT32), num_ToKill(itr) - num_Killed(1_INT32, itr) )
    end do

    num_Killed_total = 0_INT64

    do itr = 1_INT32, num_city, 1_INT32
        num_Killed_total       &!
        = num_Killed_total     &!
        + num_Killed(1_INT32, itr) &!
        + num_Killed(2_INT32, itr)
    end do

    ! STEP.05
    ! output the answer of this task
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') num_Killed_total

    ! STEP.08
    ! deallocate the array to store the given data
    deallocate( num_monster )
    deallocate( num_ToKill )
    deallocate( num_Killed )
    
    ! STEP.END
    return

  end subroutine task_C

end module ABC135

program main

  ! <module>s to import
  use, non_intrinsic :: ABC135
  
  call task_C

end program main

! End of File
