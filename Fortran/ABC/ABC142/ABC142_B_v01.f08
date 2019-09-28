! [contest]  ABC 142
! [task]     B
! [URL]      https://atcoder.jp/contests/abc142/tasks/abc142_b
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc142/submissions/7748199 : AC

module ABC142

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_B

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_B (num_people, height_min, data_height)

    ! arguments for this <subroutine>
    integer(INT32), intent(in) :: num_people
    integer(INT16), intent(in) :: height_min
    integer(INT16), intent(in) :: data_height(1:num_people)

    ! variables for this <subroutine>
    integer(INT32) :: itr
    integer(INT32) :: sum

    ! STEP.01
    ! initialize the variables
    sum = 0_INT32

    ! STEP.02
    ! count up the number of people who can ride the roller coaster
    do itr = 1_INT32, num_people, 1_INT32
      if ( data_height(itr) .ge. height_min ) sum = sum + 1_INT32
    end do

    ! STEP.03
    ! output the answer of this task
    print '(I0)', sum

    ! STEP.END
    return

  end subroutine task_B

end module ABC142


program main

  ! <module>s to import
  use, non_intrinsic :: ABC142

  ! require all variables to be explicitly declared
  implicit none

  ! constants for this <program>
  integer(INT32), parameter :: num_people_max = 10_INT32 ** 5_INT32

  ! variables for this <program>
  integer(INT32) :: N
  integer(INT16) :: K
  integer(INT16) :: h(1:num_people_max)

  ! STEP.01
  ! read out the given data
  read(unit=INPUT_UNIT, fmt=*) N, K
  read(unit=INPUT_UNIT, fmt=*) h(1:N)

  ! STEP.02
  ! calculate & output the answer of this task
  call task_B (N, K, h(:))

end program main

! --- EOF --- !
