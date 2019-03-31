! [contest]  AtCoder WUPC2019
! [task]     A
! [URL]      https://atcoder.jp/contests/wupc2019/tasks/wupc2019_a
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/wupc2019/submissions/4595617 : TLE
! 
module WUPC2019

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: WUPC2019_A
  private :: exchange_string

  ! constants for this <module>
  character(len=2, kind=1), parameter, private :: str_chng_trgt = 'WA'
  character(len=2, kind=1), parameter, private :: str_chng_rslt = 'AC'

  integer (kind=INT32), parameter, private :: len_string_max = 10_INT32 ** 5

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine WUPC2019_A

    ! variables for this <subroutine>
    character(len=len_string_max, kind=1) :: buf_string
    integer (kind=INT32)                  :: len_string, itr_pstn
    logical                               :: stat

    ! STEP.01
    ! read out the target string
    read (unit=INPUT_UNIT, fmt='(A)') buf_string
    len_string = len_trim (buf_string)

    ! STEP.02
    ! exhange the target strings
    stat = .true.

    do while (stat)
      call exchange_string (buf_string, len_string, stat)
    end do

    ! STEP.03
    ! output the result
    write (unit=OUTPUT_UNIT, fmt='(A)', advance='yes') trim (buf_string)

    ! STEP.END
    return

  end subroutine WUPC2019_A

  subroutine exchange_string (trgt_string, len_string, stat)

    ! arguments for this <subroutine>
    character(len=len_string_max, kind=1), intent(inout) :: trgt_string
    integer (kind=INT32),                  intent(in)    :: len_string
    logical,                               intent(inout) :: stat

    ! variables for this <subroutine>
    integer (kind=INT32) :: itr

    stat = .false.

    ! STEP.01
    do itr = 1, len_string-1_INT32, 1_INT32
      if ( LGE (trgt_string(itr:itr+1), str_chng_trgt(1:2)) .and. LLE (trgt_string(itr:itr+1), str_chng_trgt(1:2)) ) then
        trgt_string(itr:itr+1) = str_chng_rslt(1:2)
        stat                   = .true.
      end if
    end do

    ! STEP.END
    return

  end subroutine exchange_string

end module WUPC2019


program main

  ! <module>s to import
  use, non_intrinsic :: WUPC2019

  ! require all variables to be explicitly declared
  implicit none

  call WUPC2019_A

end program main
