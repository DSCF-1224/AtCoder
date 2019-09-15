! [contest]  ABC 141
! [task]     E
! [URL]      https://atcoder.jp/contests/abc141/tasks/abc141_e
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc141/submissions/7545400 : TLE

module ABC141

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_E

  ! constants for this <module>
  integer(INT32), parameter, private :: len_string_max = 5_INT32 * 10_INT32 ** 3_INT32

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_E

    ! variables for this <subroutine>
    character(len=len_string_max, kind=1) :: string_given
    character(len=len_string_max, kind=1) :: string_partial_f
    character(len=len_string_max, kind=1) :: string_partial_r

    ! variables for this <subroutine>
    integer(INT32) :: len_string
    integer(INT32) :: len_string_partial_max

    ! support variables for this <subroutine>
    integer(INT32) :: itr_len
    integer(INT32) :: itr_start_f
    integer(INT32) :: itr_start_r

    ! STEP.01
    ! read out the given data
    read(unit=INPUT_UNIT, fmt=*) len_string
    read(unit=INPUT_UNIT, fmt=*) string_given

    ! STEP.02
    ! calculate the maximum length of the partial string of the given one
    if (mod(len_string, 2_INT32) .eq. 0_INT32) then
      len_string_partial_max = len_string / 2_INT32
    else
      len_string_partial_max = (len_string - 1_INT32) / 2_INT32
    end if

    do itr_len     = len_string_partial_max, 1_INT32,              -1_INT32
    do itr_start_f = 1_INT32,                len_string - itr_len,  1_INT32

      string_partial_f = string_given(itr_start_f:itr_start_f + itr_len - 1_INT32)

      do itr_start_r = itr_start_f + 1_INT32, len_string - itr_len + 1_INT32, 1_INT32
        if (string_partial_f .eq. string_given(itr_start_r:itr_start_r + itr_len - 1_INT32)) then
          write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') itr_len
          return
        end if
      end do

    end do
    end do

    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') 0_INT32

    ! STEP.END
    return

  end subroutine task_E

end module ABC141


program main

  ! <module>s to import
  use, non_intrinsic :: ABC141

  ! require all variables to be explicitly declared
  implicit none

  call task_E

end program main
