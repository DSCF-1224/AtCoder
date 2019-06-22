! [contest]  ABC 131
! [task]     B
! [URL]      https://atcoder.jp/contests/abc131/tasks/abc131_b
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc131/submissions/6066769 : AC

module ABC131

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_B

  ! variables for this <module>
  integer(INT32), private :: num_apples
  integer(INT32), private :: val_taste_baseline

  ! arrays for this <module>
  integer(INT32), allocatable, dimension(:), private :: data_taste

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_B

    ! support variables for this <subroutine>
    integer(INT32) :: val_taste_sum

    ! support variables for this <subroutine>
    integer(INT32) :: index
    integer(INT32) :: itr

    ! STEP.01
    ! read out the given data
    read(unit=INPUT_UNIT, fmt=*) num_apples, val_taste_baseline

    ! STEP.02
    ! allocate the array to store the data of taste
    allocate( data_taste(1:num_apples) )

    ! STEP.03
    ! calculate the taste
    data_taste(:) = val_taste_baseline - 1_INT32

    do itr = 1_INT32, num_apples, 1_INT32
      data_taste(itr) = data_taste(itr) + itr 
    end do

    ! STEP.04
    ! find the index of apple which you can eat
    index = minloc( abs(data_taste(:)), dim=1 )

    ! STEP.05
    ! calculate the summation
    val_taste_sum = 0_INT32
    
    do itr = 1_INT32, num_apples, 1_INT32
      if (itr .ne. index) val_taste_sum = val_taste_sum + data_taste(itr) 
    end do

    ! STEP.06
    ! output the result
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') val_taste_sum

    ! STEP.07
    ! deallocate the array to store the data of taste
    deallocate( data_taste )

    ! STEP.END
    return

  end subroutine task_B

end module ABC131


program main

  ! <module>s to import
  use, non_intrinsic :: ABC131

  ! require all variables to be explicitly declared
  implicit none

  call task_B

end program main
