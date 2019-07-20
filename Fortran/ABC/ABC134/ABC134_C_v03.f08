! [contest]  ABC 134
! [task]     C
! [URL]      https://atcoder.jp/contests/abc134/tasks/abc134_c
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc134/submissions/6471784 : TLE

module ABC134

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_C
  private :: task_C_unit

  ! variables for this <module>
  integer(INT32), private :: maxval_left
  integer(INT32), private :: maxval_right

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_C

    ! variables for this <subroutine>
    integer(INT32) :: len_sequence
    integer(INT32) :: maxloc_left
    integer(INT32) :: maxloc_right

    ! arrays for this <subroutine>
    integer(INT32), dimension(:), allocatable :: val_sequence

    ! support variables for this <subroutine>
    integer(INT32) :: itr

    ! STEP.01
    ! read out the given data
    ! (the length of the given sequence)
    read(unit=INPUT_UNIT, fmt=*) len_sequence

    ! STEP.01
    ! read out the given data
    ! (the values of the given sequence)

    allocate( val_sequence(1:len_sequence) )

    do itr = 1_INT32, len_sequence, 1_INT32
      read(unit=INPUT_UNIT, fmt=*) val_sequence(itr)
    end do

    ! STEP.03
    ! calculate & output the answer of this task
    maxloc_left  = 0_INT32
    maxloc_right = maxloc( val_sequence(2_INT32:len_sequence), dim=1 ) + 1_INT32
    maxval_left  = 0_INT32
    maxval_right = val_sequence( maxloc_right )
    call task_C_unit

    do itr = 2_INT32, len_sequence, 1_INT32

      if ( val_sequence(itr - 1_INT32) .gt. maxval_left ) then
        maxloc_left = itr - 1_INT32
        maxval_left = val_sequence( maxloc_left )
      end if

      if ( itr .lt. len_sequence .and. itr + 1_INT32 .gt. maxloc_right ) then
        maxloc_right = maxloc( val_sequence(itr + 1_INT32:len_sequence), dim=1 ) + itr
        maxval_right = val_sequence( maxloc_right )
      end if

      maxval_left  = val_sequence( maxloc_left  )
      maxval_right = val_sequence( maxloc_right )

      call task_C_unit

    end do

    ! STEP.03
    ! deallocate the array to store the given data
    deallocate( val_sequence )

    ! STEP.END
    return

  end subroutine task_C

  subroutine task_C_unit

    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') max(maxval_left, maxval_right)
    return

  end subroutine task_C_unit

end module ABC134


program main

  ! <module>s to import
  use, non_intrinsic :: ABC134

  ! require all variables to be explicitly declared
  implicit none

  call task_C

end program main
