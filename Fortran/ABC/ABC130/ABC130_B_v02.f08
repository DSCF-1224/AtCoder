! [contest]  ABC 130
! [task]     B
! [URL]      https://atcoder.jp/contests/abc130/tasks/abc130_b
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc130/submissions/5991879 : AC

module ABC130

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_B
  private :: calculate_num_bounce

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_B

    ! variables for this <subroutine>
    integer(INT32) :: num_landing_all
    integer(INT32) :: coordinate_limit

    ! array for this <subroutine>
    integer(INT32), dimension(:), allocatable :: coordinate_landing

    ! STEP.01
    ! read out the number of times to land
    ! read out the upper limit of coordinate
    read(unit=INPUT_UNIT, fmt=*) num_landing_all, coordinate_limit

    ! STEP.02
    ! allocate the array to store the coordinates to land
    allocate( coordinate_landing(1:num_landing_all) )

    ! STEP.03
    ! read out the coordinates to land
    read(unit=INPUT_UNIT, fmt=*) coordinate_landing(1:num_landing_all)

    ! STEP.04
    ! output the result
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') calculate_num_bounce(num_landing_all, coordinate_landing, coordinate_limit)

    ! STEP.END
    return

  end subroutine task_B

  function calculate_num_bounce (num_landing_all, data_cd_landing, data_cd_limit) result(num_landing)

    ! arguments for this <function>
    integer(INT32), intent(in) :: num_landing_all
    integer(INT32), intent(in) :: data_cd_landing(1:num_landing_all)
    integer(INT32), intent(in) :: data_cd_limit

    ! return value of this <function>
    integer(INT32) :: num_landing

    ! variables for this <function>
    integer(INT32) :: coordinate_reached(1:num_landing_all)

    ! support variables for this <function>
    integer(INT32) :: itr

    ! STEP.01
    ! initialize ...
    ! 1. the number of times to land
    ! 2. the coordinate to reach
    num_landing           = 1_INT32
    coordinate_reached(1) = data_cd_landing(1)

    ! STEP.02
    ! calculate the coordinate to reach
    do itr = 2_INT32, num_landing_all, 1_INT32
      coordinate_reached(itr) = coordinate_reached(itr-1) + data_cd_landing(itr)
    end do

    ! STEP.03
    ! calculate the number of times to bounce before reaching the limit
    do itr = 1_INT32, num_landing_all, 1_INT32
      if (coordinate_reached(itr) .le. data_cd_limit) then
        num_landing = num_landing + 1_INT32
      else
        exit
      end if
    end do

    ! STEP.END
    return

  end function calculate_num_bounce

end module ABC130


program main

  ! <module>s to import
  use, non_intrinsic :: ABC130

  ! require all variables to be explicitly declared
  implicit none

  call task_B

end program main
