! [contest]  ABC 137
! [task]     C
! [URL]      https://atcoder.jp/contests/abc137/tasks/abc137_c
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc137/submissions/6875023 : TLE

module ABC137

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_C
  private :: insert_element
  private :: sort_insert
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

  subroutine insert_element (string, pos)

    ! arguments for this <subroutine>
    character(len=*, kind=1), intent(inout) :: string
    integer,                  intent(in)    :: pos

    ! variables for this <subroutine>
    character(len=1, kind=1) :: str_buffer

    ! support variables for this <subroutine>
    integer :: itr

    itr        = pos - 1
    str_buffer = string(pos:pos)

    do while (itr .ge. 1)
      if (str_buffer .lt. string(itr:itr)) then
        itr = itr - 1
      else
        exit
      end if
    end do

    string(itr + 2:pos    ) = string(itr + 1:pos - 1)
    string(itr + 1:itr + 1) = str_buffer

    return

  end subroutine insert_element

  subroutine sort_insert (string)

    ! arguments for this <subroutine>
    character(len=*, kind=1), intent(inout) :: string

    ! support variables for this <subroutine>
    integer :: itr

    do itr = 2, len_string, 1
      call insert_element (string, itr)
    end do

    return

  end subroutine sort_insert

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

  subroutine task_C

    ! variables for this <subroutine>
    character(len=len_string, kind=1) :: given_data
    integer(INT32)                    :: num_string
    integer(INT32)                    :: len_list_anagram
    integer(INT64)                    :: num_anagram
    logical                           :: is_anagram

    ! arrays for this <module>
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
    ! read out the given data
    ! count up the number of anagram
    do itr_origin = 1_INT32, num_string, 1_INT32

      ! STEP.03.01
      ! read out the given strings
      read(unit=INPUT_UNIT, fmt='(A)') given_data

      ! STEP.03.02
      ! sort the read string
      call sort_insert(given_data)

      ! STEP.03.03
      ! reset the flag
      is_anagram = .false.

      ! STEP.03.04
      ! compare the read string with the list of anagram
      do itr_target = 1_INT32, len_list_anagram, 1_INT32

        if (given_data .eq. list_anagram(itr_target)%string) then
          list_anagram(itr_target)%times = 1_INT64     + list_anagram(itr_target)%times
          num_anagram                    = num_anagram + list_anagram(itr_target)%times
          is_anagram                     = .true.
          exit
        end if

      end do

      ! STEP.03.05
      ! update the list of anagram
      if (.not. is_anagram) then
        len_list_anagram                      = len_list_anagram + 1_INT32
        list_anagram(len_list_anagram)%string = given_data
        list_anagram(len_list_anagram)%times  = 0_INT64
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
