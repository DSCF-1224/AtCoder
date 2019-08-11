! [contest]  ABC 137
! [task]     C
! [URL]      https://atcoder.jp/contests/abc137/tasks/abc137_c
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc137/submissions/6854130 : TLE

module ABC137

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_C
  private :: fetch_data_string
  private :: isAnagram

  ! constants for this <module>
  integer(INT8), parameter, private :: len_string = 10_INT8
  integer(INT8), parameter, private :: ichar_a    = ichar("a", kind=INT8)
  integer(INT8), parameter, private :: ichar_z    = ichar("z", kind=INT8)

  ! <type>s for this <module>
  type data_task
    character(len=len_string, kind=1), public :: string
    integer(INT8),                     public :: code(ichar_a:ichar_z)
    integer(INT64),                    public :: times
  end type data_task

  ! arrays for this <module>
  type(data_task), allocatable, private :: given_data(:)

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine fetch_data_string (index)

    ! arguments for this <subroutine>
    integer(INT32), intent(in) :: index

    ! support variables for this <subroutine>
    integer(INT8) :: val_ichar
    integer(INT8) :: itr

    do itr = 1_INT8, len_string, 1_INT8
      val_ichar                         = ichar(c=given_data(index)%string(itr:itr), kind=INT8)
      given_data(index)%code(val_ichar) = given_data(index)%code(val_ichar) + 1_INT8
    end do

    ! STEP.END
    return

  end subroutine fetch_data_string

  pure function isAnagram (index_origin, index_target) result(stat)

    ! arguments for this <function>
    integer(INT32), intent(in) :: index_origin
    integer(INT32), intent(in) :: index_target

    ! return value of this <function>
    logical :: stat

    ! support variables for this <function>
    integer(INT8) :: itr

    ! STEP.01
    ! initialize the return value of this function
    stat = .true.

    ! STEP.02
    ! judge the status of given data
    do itr = ichar_a, ichar_z, 1_INT8
      if ( given_data(index_origin)%code(itr) .ne. given_data(index_target)%code(itr) ) then
        stat = .false.
        exit
      end if
    end do

    ! STEP.END
    return

  end function isAnagram

  subroutine task_C

    ! variables for this <subroutine>
    integer(INT32) :: num_string
    integer(INT64) :: num_anagram

    ! support variables for this <subroutine>
    integer(INT32) :: itr, itr_origin, itr_target

    ! STEP.01
    ! read out the given data

    ! STEP.01.01
    ! read out the number of given strings
    read(unit=INPUT_UNIT, fmt=*) num_string

    ! STEP.01.02
    ! allocate the array to store the given strings
    allocate( given_data(1:num_string) )

    ! STEP.01.03
    do itr = 1_INT32, num_string, 1_INT32

      ! initialize the variable
      given_data(itr)%code(:) = 0_INT8
      given_data(itr)%times   = 0_INT64

      ! read out the given string
      read(unit=INPUT_UNIT, fmt=*) given_data(itr)%string

    end do

    ! STEP.02
    ! count up the number of anagram
    num_anagram = 0_INT64

    do itr_origin = 1_INT32, num_string, 1_INT32

      call fetch_data_string(itr_origin)

      do itr_target = 1_INT32, itr_origin - 1_INT32, 1_INT32
        if ( isAnagram (itr_origin, itr_target) ) then
          given_data(itr_target)%times = 1_INT64     + given_data(itr_target)%times
          num_anagram                  = num_anagram + given_data(itr_target)%times
          exit
        end if
      end do

    end do

    ! STEP.03
    ! output the answer of this task
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') num_anagram

    ! STEP.04
    ! deallocate the array to store the given strings
    deallocate( given_data )

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
