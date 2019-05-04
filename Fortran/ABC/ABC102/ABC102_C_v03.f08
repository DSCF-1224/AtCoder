! [contest]  ABC 102
! [task]     C
! [URL]      https://atcoder.jp/contests/abc102/tasks/arc100_a
! [compiler] fortran (gfortran v4.8.4)
! [status]   NOT Submitted

module ABC102

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_C
  private :: sort_Shell
  private :: swap
  private :: print_progression
  private :: calc_median
  private :: is_greater

  ! variables for this <module>
  integer(INT32), private :: len_progression
  integer(INT64), private :: median_progression

  ! array for this <module>
  integer(INT64), allocatable, private :: progression(:)

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_C

    ! support variables for this <subroutine>
    integer(INT32) :: iter

    ! STEP.01
    ! read out the length of the given progression
    read(unit=INPUT_UNIT, fmt=*) len_progression

    ! STEP.02
    ! allocate the array to store the given progression
    allocate(progression(1:len_progression))

    ! STEP.03
    ! read out the values of the given progression
    read(unit=INPUT_UNIT, fmt=*) progression(1:len_progression)

    ! STEP.for debug
    ! call print_progression
    ! call sort_Shell
    ! call print_progression

    ! STEP.04
    ! shift the values of given progression using the iterator
    do iter = 1, len_progression, 1
      progression(iter) = progression(iter) - iter
    end do

    ! STEP.05
    ! sort the given progression
    call sort_Shell

    ! STEP.06
    ! calculate the median of the given progression
    median_progression = calc_median(len_progression, progression(:))

    ! STEP.07
    ! subtract the median of the given progression from the each term of the progression
    ! calculate the absolute the value of the each term of the given progression
    progression(:) = abs(progression(:) - median_progression)

    ! STEP.08
    ! calculate & output the minimum value of the sadness
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') sum(progression(:), dim=1)

    ! STEP.07
    ! deallocate the array to store the given progression
    deallocate(progression)

    ! STEP.END
    return

  end subroutine task_C

  subroutine sort_Shell

    ! variables for this <subroutine>
    integer(INT32) :: step_iter

    ! support variables for this <subroutine>
    integer(INT32) :: iter_end, iter

    ! STEP.02
    ! initialize the step of swapping
    iter      = len_progression / 9_INT32
    step_iter = 0_INT32

    do while(step_iter .le. iter)
      step_iter = 3_INT32 * step_iter + 1_INT32
    end do

    ! STEP.02
    ! sorting
    do while(step_iter .gt. 0_INT32)

      do iter_end = len_progression-step_iter, 1, -1
        do iter = 1, iter_end, 1
          if( is_greater(iter, iter + step_iter) ) then
            call swap (iter, iter + step_iter)
          end if
        end do
      end do

      step_iter = step_iter / 3_INT32

    end do

    ! STEP.END
    return

  end subroutine sort_Shell

  subroutine swap(iter1, iter2)

    ! arguments for this <subroutine>
    integer(INT32), intent(in) :: iter1, iter2

    ! variables for this <function>
    integer(INT64) :: tmp

    tmp                = progression(iter1)
    progression(iter1) = progression(iter2)
    progression(iter2) = tmp
    return

  end subroutine swap

  subroutine print_progression

    print '(1000(1X,I0))', progression(1:len_progression)
    return

  end subroutine print_progression

  pure function is_greater(iter_trgt, iter_ref) result(stat)

    ! arguments for this <function>
    integer(INT32), intent(in) :: iter_trgt, iter_ref

    ! return value of this <function>
    logical :: stat

    stat = progression(iter_trgt) .gt. progression(iter_ref)
    return

  end function is_greater

  pure function calc_median(size, array) result(median)

    ! arguments for this <function>
    integer(INT32), intent(in) :: size
    integer(INT64), intent(in) :: array(1:size)

    ! return value of this <function>
    integer(INT64) :: median

    ! variables for this <function>
    integer(INT32) :: postion

    if (mod(size, 2_INT32) .eq. 0) then
      postion = size / 2
      median  = (array(postion) + array(postion+1)) / 2_INT64
    else
      median = array((size+1)/2)
    end if

    return

  end function calc_median

end module ABC102

program main

  ! <module>s to import
  use, non_intrinsic :: ABC102

  ! require all variables to be explicitly declared
  implicit none

  call task_C

end program main
