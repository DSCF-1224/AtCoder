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
  private :: judge_isPossible
  
  contains
  
  subroutine task_C

    ! variables for this <subroutine>
    integer(INT32) :: num_cell
    logical        :: isPossible
  
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
    ! calculate the answer of this task
    call judge_isPossible(num_cell, val_height(:), isPossible)

    ! STEP.04
    ! output the answer of this task
    if ( isPossible ) then
      write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') 'Yes'
    else
      write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') 'No'
    end if

    ! STEP.END
    return

  end subroutine task_C

  subroutine judge_isPossible (num_cell, val_height, isPossible)

    ! arguments for this <subroutine>
    integer(INT32), intent(in)    :: num_cell
    integer(INT32), intent(inout) :: val_height(:)
    logical,        intent(inout) :: isPossible

    ! support variables for this <subroutine>
    integer(INT32) :: itr

    ! STEP.01
    ! initialize the return value of this subroutine
    isPossible = .true.

    ! STEP.02
    ! judge the possibility using the number of cells
    if (num_cell .eq. 1_INT32) then
      return
    end if

    ! STEP.03
    ! judge the possibility using the value of height
    do itr = num_cell - 1_INT32, 1_INT32, -1_INT32

      if ( val_height(itr) .le. val_height(itr + 1_INT32) ) then
        continue
      else if ( val_height(itr) - val_height(itr + 1_INT32) .eq. 1_INT32 ) then
        val_height(itr) = val_height(itr) - 1_INT32
      else
        isPossible = .false.
        exit
      end if

    end do

    ! STEP.END
    return

  end subroutine judge_isPossible

end module ABC136

program main

  ! <module>s to import
  use, non_intrinsic :: ABC136

  call task_C

end program main

! End of File
