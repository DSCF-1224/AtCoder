! [contest]  ABC 137
! [task]     C
! [URL]      https://atcoder.jp/contests/abc137/tasks/abc137_c
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc137/submissions/6829324 : TLE

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
  integer(INT32), parameter, private :: len_string = 10_INT32
  integer(INT32), parameter, private :: ichar_a    = ichar("a", kind=INT32)
  integer(INT32), parameter, private :: ichar_z    = ichar("z", kind=INT32)

  ! arrays for this <module>
  character(len=len_string, kind=1), allocatable, private :: given_string(:)
  integer(int8),                     allocatable, private :: data_string (:,:)

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine fetch_data_string (index_target)

    ! arguments for this <subroutine>
    integer(INT32), intent(in) :: index_target

    ! support variables for this <subroutine>
    integer(INT32) :: val_char
    integer(INT32) :: itr

    do itr = 1_INT32, len_string, 1_INT32
      val_char = ichar(given_string(index_target)(itr:itr))
      data_string(val_char, index_target) = data_string(val_char, index_target) + 1_INT8
    end do

    ! STEP.END
    return

  end subroutine fetch_data_string

  pure function isAnagram (index_orign, index_target) result(stat)

    ! arguments for this <function>
    integer(INT32), intent(in) :: index_orign
    integer(INT32), intent(in) :: index_target

    ! return value of this <function>
    logical :: stat

    ! support variables for this <function>
    integer(INT32) :: itr

    ! STEP.01
    ! initialize the return value of this function
    stat = .true.

    ! STEP.02
    ! judge the status of given data
    do itr = ichar_a, ichar_z, 1_INT32
      if ( data_string(itr, index_orign) .ne. data_string(itr, index_target) ) then
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
    allocate( given_string(1:num_string) )
    allocate( data_string(ichar_a:ichar_z, 1:num_string) )

    ! STEP.01.03
    ! read out the given strings
    do itr = 1_INT32, num_string, 1_INT32
      read(unit=INPUT_UNIT, fmt=*) given_string(itr)
    end do

    ! STEP.02
    ! calcualte the answer of this task

    ! STEP.02.02
    ! fetch the data of the given string
    data_string(:,:) = 0_INT32

    do itr = 1_INT32, num_string, 1_INT32
      call fetch_data_string(itr)
    end do


    ! STEP.02.02
    ! count up the number of anagram
    num_anagram = 0_INT64

    do itr_origin = 1_INT32,              num_string - 1_INT32, 1_INT32
    do itr_target = itr_origin + 1_INT32, num_string,           1_INT32
      if ( isAnagram (itr_origin, itr_target) ) then
        num_anagram = num_anagram + 1_INT64
      end if
    end do
    end do

    ! STEP.03
    ! output the answer of this task
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') num_anagram

    ! STEP.04
    ! deallocate the array to store the given strings
    deallocate( given_string )
    deallocate( data_string )

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
