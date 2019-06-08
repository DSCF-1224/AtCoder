! [contest]  ABC 125
! [task]     D
! [URL]      https://atcoder.jp/contests/abc125/tasks/abc125_d
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc125/submissions/5828013 : AC

module ABC125

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_D
  private :: count_num_negative_elements
  private :: is_even
  private :: is_including_zero

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_D

    ! variables for this <subroutine>
    integer(INT32) :: len_sequence
    integer(INT64) :: maximum_sum
    
    ! arrays for this <subroutine>
    integer(INT64), allocatable :: val_sequence(:)

    ! support variables for this <subroutine>
    integer(INT32) :: itr

    ! STEP.01
    ! read out the length of the given sequence
    read(unit=INPUT_UNIT, fmt=*) len_sequence

    ! STEP.02
    ! allocate to store the sequence of values
    allocate( val_sequence(1:len_sequence) )

    ! STEP.03
    ! read out the given sequence of values
    read(unit=INPUT_UNIT, fmt=*) val_sequence(1:len_sequence)

    ! STEP.04
    ! calculate the summation of absolute values of given sequence
    if ( &!
      is_even( count_num_negative_elements( val_sequence(1:len_sequence) ) ) .or. &!
      is_including_zero( val_sequence(1:len_sequence) )                           &!
    ) then
      maximum_sum = sum( abs( val_sequence(1:len_sequence) ), dim=1 )
    else
      maximum_sum = sum( abs( val_sequence(1:len_sequence) ), dim=1 )
      maximum_sum = maximum_sum - 2_INT64 * minval( abs( val_sequence(1:len_sequence) ), dim=1 )
    end if

    ! STEP.06
    ! output the maximum value of the summation that can be realized in a given sequence
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') maximum_sum

    ! STEP.06
    ! deallocate to store the sequence of values
    deallocate( val_sequence )

    ! STEP.END
    return

  end subroutine task_D

  pure function count_num_negative_elements (array) result(num_elements)

    ! arguments for this <function>
    integer(INT64), intent(in) :: array(:)

    ! support variables for this <function>
    integer(INT32) :: itr

    ! return value of this <function>
    integer(INT32) :: num_elements

    ! STEP.01
    ! initialize the variable which stores the number of negative elements
    num_elements = 0_INT32

    ! STEP.02
    ! count up the number of negative elements
    do itr = 1_INT32, size(array(:), dim=1), 1_INT32
      if (array(itr) .lt. 0_INT64) num_elements = num_elements + 1_INT32
    end do

    ! STEP.END
    return

  end function count_num_negative_elements

  pure function is_even (val) result(stat)

    ! arguments for this <function>
    integer(INT32), intent(in) :: val

    ! return value of this <function>
    logical :: stat

    stat = mod(val, 2_INT32) .eq. 0_INT32
    return

  end function is_even

  pure function is_including_zero (array) result(stat)

    ! arguments for this <function>
    integer(INT64), intent(in) :: array(:)

    ! support variables for this <function>
    integer(INT32) :: itr

    ! return value of this <function>
    logical :: stat

    stat = .false.

    do itr = 1_INT32, size(array(:), dim=1), 1_INT32
      if ( array(itr) .eq. 0_INT64 ) then
        stat = .true.
        exit
      end if
    end do

    return

  end function is_including_zero

end module ABC125


program main

  ! <module>s to import
  use, non_intrinsic :: ABC125

  ! require all variables to be explicitly declared
  implicit none

  call task_D

end program main
