! [contest]  ABC 142
! [task]     C
! [URL]      https://atcoder.jp/contests/abc142/tasks/abc142_c
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc142/submissions/7756763 : AC

module ABC142

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_C
  public :: data_order

  ! <type>s for this <module>
  type data_order
    integer(INT32), public :: index
    integer(INT32), public :: num
  end type data_order

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine sort_heap (size, list_order)

    ! arguments for this <subroutine>
    integer(INT32),      intent(in)    :: size
    type   (data_order), intent(inout) :: list_order(1:size)

    ! support variables for this <subroutine>
    integer(INT32)      :: idx_p, idx_c
    integer(INT32)      :: itr
    integer(INT32)      :: size_heap
    type   (data_order) :: buffer
    
    size_heap = size           + 1_INT32
    itr       = size / 2_INT32 + 1_INT32

    do while (.true.)

      if (itr .gt. 1_INT32 ) then
        itr    = itr - 1_INT32
        buffer = list_order(itr)
      else
        size_heap = size_heap - 1_INT32
        if (size_heap .eq. 1_INT32) return
        buffer                = list_order(size_heap)
        list_order(size_heap) = list_order(        1)
      end if

      idx_p = itr
      idx_c = itr + itr

      do while (idx_c .lt. size_heap)

        if (idx_c + 1_INT32 .lt. size_heap) then
          if ( list_order(idx_c + 1_INT32)%num .gt. list_order(idx_c)%num ) idx_c = idx_c + 1_INT32
        end if

        if ( list_order(idx_c)%num .gt. buffer%num ) then
          list_order(idx_p) = list_order(idx_c)
          idx_p             = idx_c
          idx_c             = idx_p + idx_p
        else
          exit
        end if

      end do

      list_order(idx_p) = buffer

    end do

  end subroutine sort_heap

  subroutine task_C (num_students, list_num)

    ! arguments for this <subroutine>
    integer(INT32), intent(in) :: num_students
    integer(INT32), intent(in) :: list_num(:)

    ! arrays for this <subroutine>
    type(data_order), allocatable :: list_order(:)

    ! support variables for this <subroutine>
    integer(INT32) :: itr

    ! STEP.01
    ! allocate the array to store the given data
    allocate( list_order(1:num_students) )

    ! STEP.02
    ! store the given data
    do concurrent (itr = 1_INT32 : num_students : 1_INT32)
      list_order(itr)%index = itr
      list_order(itr)%num   = list_num(itr)
    end do

    ! STEP.03
    ! sort the given data
    call sort_heap (num_students, list_order)

    ! STEP.04
    ! output the answer of this task
    print '(I0,*(1X,I0))', list_order(:)%index

    ! STEP.05
    ! deallocate the array to store the given data
    deallocate( list_order )

    ! STEP.END
    return

  end subroutine task_C

end module ABC142


program main

  ! <module>s to import
  use, non_intrinsic :: ABC142

  ! require all variables to be explicitly declared
  implicit none

  ! constants for this <program>
  integer(INT32), parameter :: num_students_max = 10_INT32 ** 5_INT32

  ! variables for this <program>
  integer(INT32) :: N
  integer(INT32) :: A(1:num_students_max)

  ! STEP.01
  ! read out the given data
  read(unit=INPUT_UNIT, fmt=*) N
  read(unit=INPUT_UNIT, fmt=*) A(1:N)

  ! STEP.02
  ! calculate & output the answer of this task
  call task_C (N, A(:))

end program main

! --- EOF --- !
