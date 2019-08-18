! [contest]  ABC 138
! [task]     B
! [URL]      https://atcoder.jp/contests/abc138/tasks/abc138_b
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc138/submissions/6999758 : AC

module ABC138

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_B
  private :: calc_solution

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_B

    ! variables for this <subroutine>
    integer :: len_data

    ! arrays for this <subroutine>
    real(REAL64), dimension(:), allocatable :: val_data

    ! STEP.01
    ! read out the given data (length of the given data)
    read(unit=INPUT_UNIT, fmt=*) len_data

    ! STEP.02
    ! allocate the array to store the given data
    allocate( val_data(1:len_data) )

    ! STEP.03
    ! read out given data (value)
    read(unit=INPUT_UNIT, fmt=*) val_data(:)

    ! STEP.04
    ! calculate & output the answer of this task
    write(unit=OUTPUT_UNIT, fmt='(ES23.15e3)', advance='yes') calc_solution( val_data(:) )

    ! STEP.05
    ! deallocate the array to store the given data
    deallocate( val_data )

    ! STEP.END
    return

  end subroutine task_B

  pure function calc_solution (array) result(solution)

    ! arguments for this <function>
    real(REAL64), dimension(:), intent(in) :: array

    ! return value of this <function>
    real(REAL64) :: solution

    ! support variables for this <function>
    integer :: itr

    solution = 0.0_REAL64

    do itr = 1, size(array(:), dim=1), 1
      solution = solution + 1.0_REAL64 / array(itr)
    end do

    solution = 1.0_REAL64 / solution

  end function calc_solution

end module ABC138


program main

  ! <module>s to import
  use, non_intrinsic :: ABC138

  ! require all variables to be explicitly declared
  implicit none

  call task_B

end program main
