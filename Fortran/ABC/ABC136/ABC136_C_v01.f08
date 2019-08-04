! [contest]  ABC 136
! [task]     C
! [URL]      https://atcoder.jp/contests/abc136/tasks/abc136_c
! [compiler] fortran (gfortran v4.8.4)
! [status]   NOT Submitted

module ABC136

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_C
  private :: isPossible
  
  contains
  
  subroutine task_C

    ! variables for this <subroutine>
    integer(INT32) :: num_cell
  
    ! arrays for this <subroutine>
    integer(INT32), dimension(:), allocatable :: val_height

    ! STEP.01
    ! read out the number of cells
    read(unit=INPUT_UNIT, fmt=*) num_cell

    ! STEP.02
    ! allocate the array to store the height of each cell
    allocate( val_height(1:num_cell) )

    ! STEP.03
    ! read out the height of each cell
    read(unit=INPUT_UNIT, fmt=*) val_height(:)

    ! STEP.04
    ! output the answer of this task
    if ( isPossible(num_cell, val_height(:)) ) then
      write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') 'Yes'
    else
      write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') 'No'
    end if

    ! STEP.END
    return

  end subroutine task_C

  function isPossible (num_cell, val_height) result(stat)

    ! arguments for this <function>
    integer(INT32), intent(in) :: num_cell
    integer(INT32), intent(in) :: val_height(:)

    ! return value of this <function>
    logical :: stat

    ! STEP.END
    return

  end function isPossible

end module ABC136

program main

  ! <module>s to import
  use, non_intrinsic :: ABC136

  call task_C

end program main

! End of File
