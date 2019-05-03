! [contest]    いろはちゃんコンテスト 2019 Day1
! [task]       D
! [URL]        https://atcoder.jp/contests/iroha2019-day1/tasks/iroha2019_day1_d
! [compiler]   fortran (gfortran v4.8.4)
! [submission] https://atcoder.jp/contests/iroha2019-day1/submissions/5238784 : AC

module iroha2019

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_day1_d
  private :: sort_bubble
  private :: swap
  private :: is_less

  ! constants for this <module>
  integer, parameter, private :: num_field_wrestler_max = 100

  ! variables for this <module>
  integer, private :: num_field_wrestler
  integer, private :: power_Takahashi
  integer, private :: power_Aoki
  integer, private :: power_field_wrestler(1:num_field_wrestler_max)

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_day1_d

    ! STEP.01
    ! read out the number of field wrestlers
    ! read out the power  of Takahashi
    ! read out the power  of Aoki
    read(unit=INPUT_UNIT, fmt=*) num_field_wrestler, power_Takahashi, power_Aoki

    ! STEP.02
    ! read out the power of field wrestlers
    read(unit=INPUT_UNIT, fmt=*) power_field_wrestler(1:num_field_wrestler)

    ! STEP.03
    ! calculate the total power of Takahashi side
    ! calculate the total power of Aoki      side
    call sort_bubble
    power_Takahashi = power_Takahashi + sum( power_field_wrestler(1:num_field_wrestler:2), dim=1 )
    power_Aoki      = power_Aoki      + sum( power_field_wrestler(2:num_field_wrestler:2), dim=1 )

    ! STEP.04
    ! output the winner/draw
    if (power_Takahashi .gt. power_Aoki) then
      write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') 'Takahashi'
    else if (power_Takahashi .lt. power_Aoki) then
      write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') 'Aoki'
    else
      write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') 'Draw'
    end if

    ! STEP.END
    return

  end subroutine task_day1_d

  subroutine sort_bubble

    ! support variables for this <subroutine>
    integer :: iter_end, iter

    ! STEP.01
    ! sorting
    do iter_end = num_field_wrestler-1, 1, -1
      do iter = 1, iter_end, 1
        if( is_less(iter, iter + 1) ) then
          call swap (iter, iter + 1)
        end if
      end do
    end do

    ! for debug
    ! write(unit=OUTPUT_UNIT, fmt='(100(1X,I0))', advance='yes') power_field_wrestler(1:num_field_wrestler)

    ! STEP.END
    return

  end subroutine sort_bubble

  subroutine swap(iter1, iter2)

    ! arguments for this <subroutine>
    integer, intent(in) :: iter1, iter2

    ! variables for this <function>
    integer :: tmp

    tmp                         = power_field_wrestler(iter1)
    power_field_wrestler(iter1) = power_field_wrestler(iter2)
    power_field_wrestler(iter2) = tmp
    return

  end subroutine swap

  pure function is_less(iter_trgt, iter_ref) result(stat)

    ! arguments for this <function>
    integer, intent(in) :: iter_trgt, iter_ref

    ! return value of this <function>
    logical :: stat

    stat = power_field_wrestler(iter_trgt) .lt. power_field_wrestler(iter_ref)
    return

  end function is_less

end module iroha2019

program main

  ! <module>s to import
  use, non_intrinsic :: iroha2019

  ! require all variables to be explicitly declared
  implicit none

  call task_day1_d

end program main
