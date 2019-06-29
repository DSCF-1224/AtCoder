! [contest]  ABC 132
! [task]     A
! [URL]      https://atcoder.jp/contests/abc132/tasks/abc132_a
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc132/submissions/6166597 : AC

module ABC132

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_A
  private :: judge_string

  ! constants for this <module>
  integer(INT32), parameter, private :: len_string = 4_INT32

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_A

    ! variables for this <subroutine>
    character(len=len_string, kind=1) :: given_string

    ! STEP.01
    ! read out the given string
    read(unit=INPUT_UNIT, fmt='(A)') given_string

    ! STEP.02
    ! output the answer of this task
    if ( judge_string(given_string) ) then
      write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') 'Yes'
    else
      write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') 'No'
    end if

    ! STEP.END
    return

  end subroutine task_A

  function judge_string (str) result(stat)

    ! arguments for this <function>
    character(len=len_string, kind=1) :: str

    ! return value of this <function>
    logical :: stat

    stat = .false.

    if (str(1:1) .eq. str(2:2) .and. str(3:3) .eq. str(4:4) .and. str(1:1) .ne. str(3:3) ) then
      stat = .true.
      return
    end if

    if (str(1:1) .eq. str(3:3) .and. str(2:2) .eq. str(4:4) .and. str(1:1) .ne. str(2:2) ) then
      stat = .true.
      return
    end if

    if (str(1:1) .eq. str(4:4) .and. str(2:2) .eq. str(3:3) .and. str(1:1) .ne. str(2:2) ) then
      stat = .true.
      return
    end if

    ! STEP.END
    return

  end function judge_string

end module ABC132


program main

  ! <module>s to import
  use, non_intrinsic :: ABC132

  ! require all variables to be explicitly declared
  implicit none

  call task_A

end program main
