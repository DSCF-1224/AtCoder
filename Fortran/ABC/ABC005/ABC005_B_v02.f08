! [contest]    AtCoder Beginner Contest 005
! [task]       B
! [URL]        https://atcoder.jp/contests/abc005/tasks/abc005_2
! [compiler]   fortran (gfortran v4.8.4)
! [submission] https://atcoder.jp/contests/abc005/submissions/4653210 : AC

module ABC005

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: ABC005_B

  ! variables for this <module>
  integer (kind=INT8) :: seconds_FromMade(1:100)

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine ABC005_B

    ! variables for this <module>
    integer (kind=INT8 ) :: num_takoyaki
    integer (kind=INT8 ) :: seconds_buf, seconds_min
    integer (kind=INT32) :: itr 

    ! STEP.01
    ! read out the number of Takoyaki
    read (unit=INPUT_UNIT, fmt=*) num_takoyaki

    ! STEP.02
    ! read out the values of the seconds
    seconds_min = huge (seconds_min)

    do itr = 1, num_takoyaki, 1
      read (unit=INPUT_UNIT, fmt=*) seconds_buf
      seconds_min = min (seconds_buf, seconds_min)
    end do

    ! STEP.03
    ! output the result
    write (unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') seconds_min

    ! STEP.END
    return

  end subroutine ABC005_B

end module ABC005

program main

  ! <module>s to import
  use, non_intrinsic :: ABC005

  call ABC005_B

end program main
