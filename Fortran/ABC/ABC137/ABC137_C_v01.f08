! [contest]  ABC 137
! [task]     C
! [URL]      https://atcoder.jp/contests/abc137/tasks/abc137_c
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc137/submissions/6822356 : TLE

module ABC137

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_C
  private :: sort_string

  ! constants for this <module>
  integer(INT32), parameter, private :: len_string = 10_INT32

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine sort_string (str_target)

    ! arguments for this <subroutine>
    character(len=len_string, kind=1), intent(inout) :: str_target

    ! variables for this <subroutine>
    character(len=1, kind=1) :: buffer

    ! support variables for this <subroutine>
    integer(INT32) :: itr1, itr2

    do itr1 = 1_INT32,        len_string - 1_INT32, 1_INT32
    do itr2 = itr1 + 1_INT32, len_string,           1_INT32
      if ( str_target(itr1:itr1) .gt. str_target(itr2:itr2) ) then
        buffer                = str_target(itr1:itr1)
        str_target(itr1:itr1) = str_target(itr2:itr2)
        str_target(itr2:itr2) = buffer
      end if
    end do
    end do

    ! STEP.END
    return

  end subroutine sort_string

  subroutine task_C

    ! variables for this <subroutine>
    integer(INT32) :: num_string
    integer(INT64) :: num_anagram

    ! arrays for this <module>
    character(len=len_string, kind=1), allocatable :: str_data(:)

    ! support variables for this <subroutine>
    integer(INT32) :: itr, itr_orgn, itr_trgt

    ! STEP.01
    ! read out the given data

    ! STEP.01.01
    ! read out the number of given strings
    read(unit=INPUT_UNIT, fmt=*) num_string

    ! STEP.01.02
    ! allocate the array to store the given strings
    allocate( str_data(1:num_string) )

    ! STEP.01.03
    ! read out the given strings
    do itr = 1_INT32, num_string, 1_INT32
      read(unit=INPUT_UNIT, fmt=*) str_data(itr)
    end do

    ! STEP.02
    ! calcualte the answer of this task

    ! STEP.02.01
    ! sort the each given string
    do itr = 1_INT32, num_string, 1_INT32
      call sort_string( str_data(itr) )
    end do

    ! STEP.02.02
    ! count up the number of anagram
    num_anagram  = 0_INT64

    do itr_orgn = 1_INT32,            num_string - 1_INT32, 1_INT32
    do itr_trgt = itr_orgn + 1_INT32, num_string,           1_INT32
      if ( lge(str_data(itr_orgn), str_data(itr_trgt)) .and. lle(str_data(itr_orgn), str_data(itr_trgt)) ) then
        num_anagram = num_anagram + 1_INT64
      end if
    end do
    end do

    ! STEP.03
    ! output the answer of this task
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') num_anagram

    ! STEP.04
    ! deallocate the array to store the given strings
    deallocate( str_data )

    ! STEP.END
    return

  end subroutine task_C

end module ABC137


program main

  ! <module>s to import
  use, non_intrinsic :: ABC137

  ! require all variables to be explicitly declared
  implicit none

  call task_C

end program main
