! [contest]  ABC 140
! [task]     F
! [URL]      https://atcoder.jp/contests/abc140/tasks/abc140_f
! [compiler] fortran (gfortran v4.8.4)
! [status]   NOT Submitted

module ABC140

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_F

  ! constants for this <module>
  integer(INT32), parameter, private :: val_health_limit_min =  0_INT32
  integer(INT32), parameter, private :: val_health_limit_max = 10_INT32 ** 9_INT32

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_F

    ! variables for this <subroutine>
    integer(INT32) :: num_operation
    integer(INT32) :: len_list_health_raw
    integer(INT32) :: len_list_health_zip
    integer(INT32) :: val_health_max
    integer(INT32) :: val_health_min
    logical        :: stat_task

    ! arrays for this <subroutine>
    integer(INT32), dimension(:), allocatable :: val_health_raw
    integer(INT32), dimension(:), allocatable :: val_health_zip

    ! support variables for this <subroutine>
    integer :: itr, idx

    ! STEP.01
    ! read out the given data
    ! (the number of operations)
    read(unit=INPUT_UNIT, fmt=*) num_operation

    ! STEP.02
    ! allocate the arrays to store the given data
    ! (values of the health)
    len_list_health_raw = 2_INT32 ** num_operation
    allocate( val_health_raw(1:len_list_health_raw) )

    ! STEP.03
    ! read out the given data
    ! (values of the health)
    read(unit=INPUT_UNIT, fmt=*) val_health_raw(:)

    ! STEP.04
    ! find the maximum / minimum value of the health in the given data
    val_health_min = val_health_limit_max
    val_health_max = val_health_limit_min

    do itr = 1, len_list_health_raw, 1
      val_health_min = min(val_health_min, val_health_raw(itr))
      val_health_max = max(val_health_max, val_health_raw(itr))
    end do

    ! STEP.05
    ! allocate the arrays to store the given data
    ! (compressed values of the health)
    allocate( val_health_zip(val_health_min:val_health_max) )

    ! STEP.06
    ! compress list of values of the health
    val_health_zip(:) = 0_INT32

    do itr = 1, len_list_health_raw, 1
      idx                   = val_health_raw(itr)
      val_health_zip( idx ) = val_health_zip( idx ) + 1_INT32
    end do

    len_list_health_zip = val_health_max - val_health_min + 1_INT32

    do itr = val_health_min, val_health_max, 1
      write(unit=OUTPUT_UNIT, fmt='(1X,I0)', advance='no') itr
    end do

    write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') ""

    do itr = val_health_min, val_health_max, 1_INT32
      write(unit=OUTPUT_UNIT, fmt='(1X,I0)', advance='no') val_health_zip(itr)
    end do

    do itr = val_health_max - 1, val_health_min, -1_INT32
      val_health_zip(itr) = val_health_zip(itr + 1) + val_health_zip(itr)
    end do

    write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') ""

    do itr = val_health_min, val_health_max, 1_INT32
      write(unit=OUTPUT_UNIT, fmt='(1X,I0)', advance='no') val_health_zip(itr)
    end do

    ! STEP.END
    return

  end subroutine task_F

end module ABC140


program main

  ! <module>s to import
  use, non_intrinsic :: ABC140

  ! require all variables to be explicitly declared
  implicit none

  call task_F

end program main
