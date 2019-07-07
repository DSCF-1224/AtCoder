! [contest]  ABC 133
! [task]     D
! [URL]      https://atcoder.jp/contests/abc133/tasks/abc133_d
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc133/submissions/6295469 : WA
!            https://atcoder.jp/contests/abc133/submissions/6295729 : AC

module ABC133

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_D

  ! variables for this <module>
  integer(INT32), private :: num_mountain

  ! arrays for this <module>
  integer(INT64), dimension(:), allocatable, private :: solution

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_D

    ! support variables for this <subroutine>
    integer(INT32) :: itr

    ! STEP.01
    ! read out given data (1/2)
    read(unit=INPUT_UNIT, fmt=*) num_mountain

    ! STEP.02
    ! allocate the array to store the given data & the answer of this task
    allocate( solution(1:num_mountain) )

    ! STEP.03
    ! read out given data (2/2)
    read(unit=INPUT_UNIT, fmt=*) solution(:)

    ! STEP.04
    ! calculate the answer of this task
    solution(:) = solution(:) * 2_INT32

    do itr = 2, num_mountain - 1, 1
      solution(itr) = solution(itr) - solution(itr - 1)
    end do

    if ( mod(num_mountain, 2_INT32) .eq. 0_INT32 ) then
      solution(num_mountain) = solution(num_mountain) - solution(num_mountain - 1)
    else
      solution(num_mountain) = solution(num_mountain) + solution(num_mountain - 1)
    end if

    solution(num_mountain) = solution(num_mountain) / 2_INT64

    solution(num_mountain - 1) = solution(num_mountain) - solution(num_mountain - 1)

    do itr = 1, num_mountain - 2, 1
      if ( mod(itr, 2_INT32) .eq. 0_INT32 ) then
        solution(itr) = solution(itr) + solution(num_mountain - 1)
      else
        solution(itr) = solution(itr) - solution(num_mountain - 1)
      end if
    end do

    ! STEP.05
    ! output the answer of this task
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='no') solution(num_mountain - 1)

    do itr = 2, num_mountain - 1, 1
      write(unit=OUTPUT_UNIT, fmt='(1X,I0)', advance='no') solution(itr - 1)
    end do

    write(unit=OUTPUT_UNIT, fmt='(1X,I0)', advance='no') solution(num_mountain)

    ! STEP.06
    ! deallocate the array to store the given data & the answer of this task
    deallocate( solution )

    ! STEP.END
    return

  end subroutine task_D

end module ABC133


program main

  ! <module>s to import
  use, non_intrinsic :: ABC133

  ! require all variables to be explicitly declared
  implicit none

  call task_D

end program main
