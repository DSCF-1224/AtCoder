! [contest]  ABC 137
! [task]     C
! [URL]      https://atcoder.jp/contests/abc137/tasks/abc137_c
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc137/submissions/6840001 : WA
!            https://atcoder.jp/contests/abc137/submissions/6840010 : TLE
!            https://atcoder.jp/contests/abc137/submissions/6854439 : TLE
!            https://atcoder.jp/contests/abc137/submissions/6874916 : WA

module ABC137

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_C
  private :: heapify
  private :: sort_heap
  private :: swap_element

  ! constants for this <module>
  integer(INT8), parameter, private :: len_string = 10_INT8

  ! <type>s for this <module>
  type data_task
    character(len=len_string, kind=1), public :: string
    integer(INT64),                    public :: times
  end type data_task

  ! contained <subroutine>s and <function>s are below
  contains

  recursive subroutine heapify (string, idx, idx_max)

    ! arguments for this <subroutine>
    character(len=*, kind=1), intent(inout) :: string
    integer,                  intent(in)    :: idx
    integer,                  intent(in)    :: idx_max

    ! variables for this <subroutine>
    integer :: idx_largest
    integer :: idx_left
    integer :: idx_right

    idx_largest = idx
    idx_left    = 2 * idx
    idx_right   = idx_left + 1

    if ( idx_left .lt. idx_max ) then
      if ( string(idx:idx) .lt. string(idx_left:idx_left) ) then
        idx_largest = idx_left
      end if
    end if
    
    if ( idx_right .lt. idx_max ) then
      if ( string(idx_largest:idx_largest) .lt. string(idx_right:idx_right) ) then
        idx_largest = idx_right
      end if
    end if
    
    if ( idx_largest .ne. idx ) then
      call swap_element ( string(idx:idx), string(idx_largest:idx_largest) )
      call heapify      (string, idx_largest, idx_max)
    end if

    return

  end subroutine heapify

  subroutine swap_element (a1, a2)

    ! arguments for this <subroutine>
    character(len=1, kind=1), intent(inout) :: a1, a2

    ! variables for this <subroutine>
    character(len=1, kind=1) :: buffer

    buffer = a1
    a1     = a2
    a2     = buffer
    return

  end subroutine swap_element

  subroutine sort_heap (string)

    ! arguments for this <subroutine>
    character(len=*, kind=1), intent(inout) :: string

    ! variables for this <subroutine>
    integer :: len_str

    ! support variables for this <subroutine>
    integer :: itr

    len_str = len( string )

    do itr = len_str / 2, 1, -1
      call heapify(string, itr, len_str)
    end do
    
    do itr = len_str, 1, -1
      call swap_element( string(1:1), string(itr:itr) )
      call heapify(string, 1, itr)
    end do

    return

  end subroutine sort_heap

  subroutine task_C

    ! variables for this <subroutine>
    integer(INT32) :: num_string
    integer(INT64) :: num_anagram

    ! arrays for this <module>
    type(data_task), allocatable :: given_data(:)

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
    ! read out the given strings
    do itr = 1_INT32, num_string, 1_INT32
      read(unit=INPUT_UNIT, fmt='(A)') given_data(itr)%string
      given_data(itr)%times = 0_INT64
    end do

    ! STEP.02
    ! calcualte the answer of this task

    ! STEP.02.01
    ! initialize the variables
    num_anagram  = 0_INT64

    ! STEP.02.02
    ! count up the number of anagram
    do itr_origin = 1_INT32, num_string, 1_INT32
      
      ! sort the each given string
      call sort_heap( given_data(itr_origin)%string )

      do itr_target = 1_INT32, itr_origin - 1_INT32, 1_INT32
        if ( given_data(itr_origin)%string .eq. given_data(itr_target)%string ) then
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
