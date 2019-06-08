! [contest]  ABC 126
! [task]     B
! [URL]      https://atcoder.jp/contests/abc126/tasks/abc126_b
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc126/submissions/5823306 : WA
! [status]   https://atcoder.jp/contests/abc126/submissions/5823321 : AC

module ABC126

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_B
  private :: extract_data
  private :: is_month
  private :: write_format

  ! variables for this <module>
  integer(INT32), private :: given_data
  integer(INT32), private :: data_first
  integer(INT32), private :: data_second

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_B

    ! STEP.01
    ! read out the given string
    read(unit=INPUT_UNIT, fmt='(I4)') given_data

    ! STEP.02
    ! convert the given string to two integers
    call extract_data

    ! STEP.03
    ! judge & output the format of the given data
    if ( is_month(data_first) )  then
      if ( is_month(data_second) ) then
        call write_format('AMBIGUOUS')
      else
        call write_format('MMYY')
      end if
    else
      if ( is_month(data_second) ) then
        call write_format('YYMM')
      else
        call write_format('NA')
      end if
    end if

    ! STEP.END
    return

  end subroutine task_B

  subroutine extract_data

    data_first  = given_data / 100_INT32
    data_second = mod(given_data, 100_INT32)

    return

  end subroutine extract_data

  pure function is_month (val) result(stat)

    ! arguments for this <function>
    integer(INT32), intent(in) :: val

    ! return value of this <function>
    logical :: stat

    stat = 1_INT32 .le. val .and. val .le. 12_INT32
    return

  end function is_month

  subroutine write_format (format)

    ! arguments for this <subroutine>
    character(len=*, kind=1), intent(in) :: format

    write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') format
    return

  end subroutine write_format

end module ABC126


program main

  ! <module>s to import
  use, non_intrinsic :: ABC126

  ! require all variables to be explicitly declared
  implicit none

  call task_B

end program main
