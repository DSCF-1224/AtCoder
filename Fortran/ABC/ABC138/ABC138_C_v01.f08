! [contest]  ABC 138
! [task]     C
! [URL]      https://atcoder.jp/contests/abc138/tasks/abc138_c
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc138/submissions/7001935 : AC

module ABC138

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_C
  private :: sort_heap

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_C

    ! variables for this <subroutine>
    integer      :: num_ingredient
    real(REAL64) :: value_maximum

    ! support variables for this <subroutine>
    integer :: itr

    ! arrays for this <subroutine>
    real(REAL64), dimension(:), allocatable :: value_ingredient

    ! STEP.01
    ! read out the number of given ingredient
    read(unit=INPUT_UNIT, fmt=*) num_ingredient

    ! STEP.02
    ! allocate the array to store value of ingredients
    allocate( value_ingredient(1:num_ingredient) )

    ! STEP.03
    ! read out given value of ingredients
    read(unit=INPUT_UNIT, fmt=*) value_ingredient(:)

    ! STEP.04
    ! sort the array storing the value of ingredients
    call sort_heap ( value_ingredient(:), num_ingredient )

    ! STEP.05
    ! calculate the answer of this task
    value_maximum = value_ingredient(1)

    do itr = 2, num_ingredient, 1
      value_maximum = 0.5_REAL64 * (value_maximum + value_ingredient(itr))
    end do

    ! STEP.06
    ! output the answer of this task
    write(unit=OUTPUT_UNIT, fmt='(ES23.15e3)', advance='yes') value_maximum

    ! STEP.05
    ! deallocate the array to store the given data
    deallocate( value_ingredient )

    ! STEP.END
    return

  end subroutine task_C

  subroutine sort_heap (array, size)

    ! arguments for this <subroutine>
    real(REAL64), intent(inout) :: array(:)
    integer,      intent(in)    :: size

    ! variables for this <subroutine>
    integer      :: idx_p
    integer      :: idx_c
    integer      :: size_heap
    real(REAL64) :: buffer_val

    ! support variables for this <subroutine>
    integer :: itr

    size_heap = size     + 1
    itr       = size / 2 + 1
    
    do while (.true.)

      if (itr .gt. 1) then

        itr        = itr - 1
        buffer_val = array(itr)

      else

        size_heap = size_heap - 1
        if (size_heap .eq. 1) return
        buffer_val       = array(size_heap)
        array(size_heap) = array(1)

      end if
    
      idx_p = itr
      idx_c = itr * 2

      do while ( idx_c .lt. size_heap )

        if ( idx_c + 1 .lt. size_heap ) then
          if ( array(idx_c + 1) .gt. array(idx_c) ) idx_c = idx_c + 1
        end if

        if ( array(idx_c) .gt. buffer_val ) then
          array(idx_p) = array(idx_c)  
          idx_p        = idx_c         
          idx_c        = idx_p * 2     
        else
          exit 
        end if

      end do

      array(idx_p) = buffer_val

    end do

  end subroutine sort_heap

end module ABC138


program main

  ! <module>s to import
  use, non_intrinsic :: ABC138

  ! require all variables to be explicitly declared
  implicit none

  call task_C

end program main
