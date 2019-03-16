! AtCoder Beginner Contest 003 C
! [URL]      https://atcoder.jp/contests/abc003/tasks/abc003_c
! [compiler] fortran (gfortran v4.8.4)
! [status]   AC

module ABC003

  ! <module> to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: ABC003_C
  private :: calc_maximum_rate

  ! contained <subroutine>s and <function>s are below
  contains

  function calc_maximum_rate (num_video_whole, num_video_watch, rate_video) result (rate_max)

    ! arguments for this <function>
    integer,           intent(in)    :: num_video_whole
    integer,           intent(in)    :: num_video_watch
    real(kind=REAL64), intent(inout) :: rate_video(:)

    ! return value of this <function>
    real(kind=REAL64) :: rate_max

    ! variables for this <function>
    integer :: itr_video
  
    ! STEP.01
    ! initialize the variables
    rate_max = 0.0e+00_REAL64

    ! STEP.02
    ! calculate the achievable maximum rate

      ! STEP.02.01
      ! eliminate the values which not be watch
      do itr_video = 1, num_video_whole - num_video_watch, 1
        rate_video( minloc (rate_video(:), dim=1, mask=rate_video .gt. 0.0e+00_REAL64) ) = 0.0e+00_REAL64
      end do

      do itr_video = 1, num_video_watch, 1
        
        ! STEP.02.02
        ! update the maximum rate
        rate_max = 5.0e-01_REAL64 * ( rate_max + minval (rate_video(:), dim=1, mask=rate_video .gt. 0.0e+00_REAL64) )

        ! STEP.02.03
        ! update the values of the rate of videos
        rate_video( minloc (rate_video(:), dim=1, mask=rate_video .gt. 0.0e+00_REAL64) ) = 0.0e+00_REAL64

      end do

    ! STEP.END
    return

  end function calc_maximum_rate

  subroutine ABC003_C

    ! variables for this <subroutine>
    integer :: num_video_whole
    integer :: num_video_watch
    
    real(kind=REAL64), allocatable :: rate_video(:)

    ! STEP.01
    ! read out the number of videos
    read (unit=INPUT_UNIT, fmt=*) num_video_whole, num_video_watch

    ! STEP.02
    ! allocate the array to store the values of the rate of the videos
    allocate ( rate_video(1:num_video_whole) )

    ! STEP.03
    ! read out the values of the rate of the videos
    read (unit=INPUT_UNIT, fmt=*) rate_video(:)

    ! STEP.04
    ! calculate & output the achievable maximum rate
    write (unit=OUTPUT_UNIT, fmt='(ES23.15e3)', advance='yes') calc_maximum_rate (num_video_whole, num_video_watch, rate_video)

    ! STEP.05
    ! deallocate the array to store the values of the rate of the videos
    deallocate ( rate_video )

    ! STEP.END
    return

  end subroutine ABC003_C

end module ABC003


program main

  ! <module> to import
  use, non_intrinsic :: ABC003
  
  call ABC003_C

end program main
