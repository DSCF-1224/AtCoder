! [contest]  ABC 141
! [task]     B
! [URL]      https://atcoder.jp/contests/abc141/tasks/abc141_b
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc141/submissions/7527195 : AC

module ABC141

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_B
  private :: check_string

  ! constants for this <module>
  integer(INT32),           parameter, private :: len_string_max = 100_INT32
  character(len=1, kind=1), parameter, private :: char_left      = 'L'
  character(len=1, kind=1), parameter, private :: char_right     = 'R'

  ! variables for this <module>
  character(len=len_string_max, kind=1) :: buffer

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_B

    ! variables for this <subroutine>

    ! STEP.01
    ! read out the given string
    read(unit=INPUT_UNIT, fmt='(A)') buffer

    ! STEP.02
    ! output the answer of this task
    if ( check_string( len_trim(buffer) ) ) then
      write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') 'Yes'
    else
      write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') 'No'
    end if

    ! STEP.END
    return

  end subroutine task_B

  function check_string (len_string) result(stat)

    ! arguments for this <function>
    integer(INT32), intent(in) :: len_string

    ! return value of this <function>
    logical :: stat

    ! support variables for this <function>
    integer(INT32) :: itr

    ! STEP.01
    ! initialize the return value of this function
    stat = .true.

    do itr = 1_INT32, len_string, 1_INT32
      if (mod(itr, 2_INT32) .eq. 0_INT32) then
        if (buffer(itr:itr) .eq. char_right) then
          stat = .false.
          return
        end if
      else
        if (buffer(itr:itr) .eq. char_left) then
          stat = .false.
          return
        end if
      end if
    end do

    return

  end function check_string

end module ABC141


program main

  ! <module>s to import
  use, non_intrinsic :: ABC141

  ! require all variables to be explicitly declared
  implicit none

  call task_B

end program main

! --- EOF --- !
