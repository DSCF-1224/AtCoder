! [contest]  ABC 123
! [task]     B
! [URL]      https://atcoder.jp/contests/abc123/tasks/ABC123_b
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc123/submissions/4857018 : AC
 
module ABC123

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: ABC123_B

  ! constants for this <module>
  integer(kind=INT16), parameter, private :: num_dishes =  5_INT16
  integer(kind=INT16), parameter, private :: time_unit  = 10_INT16

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine ABC123_B

    ! variables for this <subroutine>
    integer(kind=INT16) :: required_time    (1:num_dishes)
    integer(kind=INT16) :: required_time_mod(1:num_dishes)
    integer(kind=INT16) :: required_time_total
    integer(kind=INT16) :: retval_mod
    integer(kind=INT16) :: num_dishes_added

    ! support variables for this <subroutine>
    integer(kind=INT16) :: itr, elem_maxloc

    ! STEP.01
    ! initialize the total required time
    required_time_total = 0_INT16
    num_dishes_added        = 0_INT16

    ! STEP.02
    ! read out the each required time
    do itr = 1_INT16, num_dishes, 1_INT16
      read(unit=INPUT_UNIT, fmt='(I3)') required_time(itr)
    end do

    ! STEP.03
    required_time_mod(:) = mod(required_time(:), time_unit)

    ! STEP.04
    ! calculate the minimum total time
    do itr = 1_INT16, num_dishes, 1_INT16
      if(required_time_mod(itr) .eq. 0_INT16) then
        required_time_total    = required_time_total + required_time(itr)
        required_time_mod(itr) = 0_INT16
        num_dishes_added       = num_dishes_added + 1_INT16
      end if
    end do

    do itr = 1_INT16, num_dishes-num_dishes_added, 1_INT16

      elem_maxloc = maxloc(required_time_mod(:), dim=1)

      retval_mod = mod(required_time_total, time_unit)
      
      if(retval_mod .ne. 0_INT16) required_time_total = required_time_total - retval_mod + time_unit

      required_time_total = required_time_total + required_time(elem_maxloc)

      required_time_mod(elem_maxloc) = 0_INT16

    end do

    ! STEP.04
    ! output the tota; time
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') required_time_total

    ! STEP.END
    return

  end subroutine ABC123_B

end module ABC123


program main

  ! <module>s to import
  use, non_intrinsic :: ABC123

  ! require all variables to be explicitly declared
  implicit none

  call ABC123_B

end program main
