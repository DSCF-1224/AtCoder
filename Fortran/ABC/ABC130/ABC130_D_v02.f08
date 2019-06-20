! [contest]  ABC 130
! [task]     D
! [URL]      https://atcoder.jp/contests/abc130/tasks/abc130_d
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc130/submissions/6035412 : WA
!            https://atcoder.jp/contests/abc130/submissions/6035422 : TLE

module ABC130

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_D
  private :: judge_cumsum

  ! variables for this <module>
  integer(INT64), private :: data_limit
  integer(INT64), private :: num_partial_sequence
  integer(INT32), private :: len_sequence

  ! arrays for this <module>
  integer(INT64), dimension(:), allocatable, private :: data_sequence

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_D

    ! STEP.01
    ! read out ...
    ! 1. the length of the given sequence
    ! 2. the limit value
    read(unit=INPUT_UNIT, fmt=*) len_sequence, data_limit

    ! STEP.02
    ! allocate the array to store the given sequence
    allocate( data_sequence(1:len_sequence) )

    ! STEP.03
    ! read out the given sequence
    read(unit=INPUT_UNIT, fmt=*) data_sequence(1:len_sequence)

    ! STEP.04
    ! calculate & judge the cumulative summation of gived sequence
    call judge_cumsum

    ! STEP.05
    ! output the result
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') num_partial_sequence

    ! STEP.06
    ! deallocate the array to store the given sequence
    deallocate( data_sequence )

    ! STEP.END
    return

  end subroutine task_D

  subroutine judge_cumsum

    ! variables for this <subroutine>
    integer(INT64) :: buffer_cumsum

    ! support variables for this <subroutine>
    integer(INT32) :: itr_min, itr_elm

    ! STEP.01
    ! initialize the variable to store the number of partial sequences which satisfy the given condition
    num_partial_sequence = 0_INT64

    ! STEP.02
    ! update the number of partial sequences which satisfy the given condition
    do itr_min = 1_INT32, len_sequence, 1_INT32

      ! initialize the variable to store the cumulative summation
      buffer_cumsum = 0_INT64

      do itr_elm = itr_min, len_sequence, 1_INT32

        buffer_cumsum = buffer_cumsum + data_sequence(itr_elm)

        ! judge whether the given condition was satisfied or not
        if (buffer_cumsum .ge. data_limit) then
          num_partial_sequence = num_partial_sequence + (len_sequence - itr_elm + 1_INT64)
          exit
        end if

      end do

    end do

    return

  end subroutine judge_cumsum

end module ABC130


program main

  ! <module>s to import
  use, non_intrinsic :: ABC130

  ! require all variables to be explicitly declared
  implicit none

  call task_D

end program main
