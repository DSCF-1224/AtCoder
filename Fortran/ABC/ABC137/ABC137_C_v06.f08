! [contest]  ABC 137
! [task]     C
! [URL]      https://atcoder.jp/contests/abc137/tasks/abc137_c
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc137/submissions/6888340 : TLE

module ABC137

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_C
  private :: isAnagram

  ! constants for this <module>
  integer(INT8), parameter, private :: len_string = 10_INT8
  integer(INT8), parameter, private :: ichar_a    = ichar("a", kind=INT8)
  integer(INT8), parameter, private :: ichar_z    = ichar("z", kind=INT8)

  ! <type>s for this <module>
  type data_task
    integer(INT8),  public :: code(ichar_a:ichar_z)
    integer(INT64), public :: times
  end type data_task

  ! contained <subroutine>s and <function>s are below
  contains

  pure function isAnagram (code_origin, code_target) result(stat)

    ! arguments for this <function>
    integer(INT8), intent(in) ::code_origin(ichar_a:ichar_z)
    integer(INT8), intent(in) ::code_target(ichar_a:ichar_z)

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
      if ( code_origin(itr) .ne. code_target(itr) ) then
        stat = .false.
        exit
      end if
    end do

    ! STEP.END
    return

  end function isAnagram

  subroutine task_C

    ! variables for this <subroutine>
    character(len=len_string, kind=1) :: given_data
    integer(INT8)                     :: val_ichar
    integer(INT32)                    :: num_string
    integer(INT64)                    :: num_anagram
    integer(INT32)                    :: len_list_anagram
    logical                           :: is_anagram

    ! arrays for this <subroutine>
    integer(INT8)                :: code(ichar_a:ichar_z)
    type(data_task), allocatable :: list_anagram(:)

    ! support variables for this <subroutine>
    integer(INT32) :: itr, itr_origin, itr_target

    ! STEP.01
    ! read out the number of given strings
    read(unit=INPUT_UNIT, fmt=*) num_string

    ! STEP.02
    ! allocate the array to store the given strings
    allocate( list_anagram(1:num_string) )

    ! STEP.03
    ! initialize the variables
    len_list_anagram = 0_INT32
    num_anagram      = 0_INT64

    ! STEP.04
    do itr_origin = 1_INT32, num_string, 1_INT32

      ! STEP.04.01
      ! reset the flag, array
      is_anagram = .false.
      code(:)    = 0_INT8

      ! STEP.04.02
      ! read out the given string
      read(unit=INPUT_UNIT, fmt='(A)') given_data

      ! STEP.04.02
      ! fetch the data of the given string
      do itr = 1_INT8, len_string, 1_INT8
        val_ichar       = ichar(c=given_data(itr:itr), kind=INT8)
        code(val_ichar) = code(val_ichar) + 1_INT8
      end do

      ! STEP.04.03
      ! compare the read string with the list of anagram
      do itr_target = 1_INT32, len_list_anagram, 1_INT32

        if ( isAnagram(code(:), list_anagram(itr_target)%code(:)) ) then
          list_anagram(itr_target)%times = 1_INT64     + list_anagram(itr_target)%times
          num_anagram                    = num_anagram + list_anagram(itr_target)%times
          is_anagram                     = .true.
          exit
        end if

      end do

      ! STEP.03.05
      ! update the list of anagram
      if (.not. is_anagram) then
        len_list_anagram                       = len_list_anagram + 1_INT32
        list_anagram(len_list_anagram)%code(:) = code(:)
        list_anagram(len_list_anagram)%times   = 0_INT64
      end if

    end do

    ! STEP.03
    ! output the answer of this task
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') num_anagram

    ! STEP.04
    ! deallocate the array to store the given strings
    deallocate( list_anagram )

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
