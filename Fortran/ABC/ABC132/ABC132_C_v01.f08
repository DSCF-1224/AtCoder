! [contest]  ABC 132
! [task]     C
! [URL]      https://atcoder.jp/contests/abc132/tasks/abc132_c
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc132/submissions/6180610 : AC

module ABC132

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_C

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_C

    ! variables for this <subroutine>
    integer(INT32) :: answer
    integer(INT32) :: len_sequence
    integer(INT32) :: max_sequence
    integer(INT32) :: min_sequence
    integer(INT32) :: num_questions_ABC
    integer(INT32) :: num_questions_ARC
    logical        :: stat

    ! arrays for this <subroutine>
    integer(INT32), dimension(:), allocatable :: val_sequence
    integer(INT32), dimension(:), allocatable :: num_value

    ! support variables for this <subroutine>
    integer(INT32) :: index

    ! STEP.01
    ! read out the given data
    read(unit=INPUT_UNIT, fmt=*) len_sequence
    allocate( val_sequence(1:len_sequence) )
    read(unit=INPUT_UNIT, fmt=*) val_sequence(1:len_sequence)

    ! STEP.02
    ! calculate the answer of this task
    max_sequence = maxval(val_sequence(:), dim=1)
    min_sequence = minval(val_sequence(:), dim=1)

    allocate( num_value(min_sequence:max_sequence) )

    num_value(:) = 0_INT32

    do index = 1, len_sequence, 1
      num_value( val_sequence(index) ) = num_value( val_sequence(index) ) + 1_INT32
    end do

    num_questions_ABC = 0_INT32
    num_questions_ARC = len_sequence
    answer            = 0_INT32
    stat              = .false.

    do index = min_sequence, max_sequence, 1
      if ( num_value(index) .eq. 0_INT32 ) then
        if (stat) answer = answer + 1_INT32
        continue
      else

        num_questions_ABC = num_questions_ABC + num_value(index)
        num_questions_ARC = num_questions_ARC - num_value(index)

        ! print *, index, num_questions_ABC, num_questions_ARC

        if ( num_questions_ABC .eq. num_questions_ARC ) then
          answer = answer + 1_INT32
          stat   = .true.
        else
          stat = .false.
          continue
        end if

      end if
    end do

    ! STEP.03
    ! deallocate the allocatable arrays
    deallocate( val_sequence )
    deallocate( num_value    )

    ! STEP.04
    ! output the answer of this task
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') answer

    ! STEP.END
    return

  end subroutine task_C

end module ABC132


program main

  ! <module>s to import
  use, non_intrinsic :: ABC132

  ! require all variables to be explicitly declared
  implicit none

  call task_C

end program main
