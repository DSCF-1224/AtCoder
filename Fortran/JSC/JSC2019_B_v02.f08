! [contest]  JSC 2019
! [task]     C
! [URL]      https://atcoder.jp/contests/jsc2019-qual/tasks/jsc2019_qual_c
! [compiler] fortran (gfortran v4.8.4)
! [status]   NOT Submitted

module mod_mod_reinforced

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: mod_pls
  public :: mod_mul

  ! contained <subroutine>s and <function>s are below
  contains

  pure function mod_pls (a, b, n) result(val_mod)

    ! arguments for this <function>
    integer(INT64), intent(in) :: a, b, n

    ! return value of this <function>
    integer(INT64) :: val_mod

    val_mod = mod( mod(a, n) + mod(b, n), n )
    return
  
  end function mod_pls

  pure function mod_mul (a, b, n) result(val_mod)

    ! arguments for this <function>
    integer(INT64), intent(in) :: a, b, n

    ! return value of this <function>
    integer(INT64) :: val_mod

    val_mod = mod( mod(a, n) * mod(b, n), n )
    return
  
  end function mod_mul

end module mod_mod_reinforced

module JSC2019

  ! <module>s to import
  use,     intrinsic :: iso_fortran_env
  use, non_intrinsic :: mod_mod_reinforced

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_B
  private :: sum_natural_nums

  ! constants for this <moduee>
  integer(INT64), parameter, private :: val_divisor = 10_INT64 ** 9_INT64 + 7_INT64

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_B

    ! variables for this <subroutine>
    integer(INT64) :: len_sequence
    integer(INT64) :: num_copy
    integer(INT64) :: num_inversion_total
    integer(INT64) :: num_inversion_sngl
    integer(INT64) :: num_inversion_pair

    ! support variables for this <subroutine>
    integer(INT32) :: itr_elm_mstr
    integer(INT32) :: itr_elm_trgt
    integer(INT32) :: itr_sqc

    ! arrays for this <subroutine>
    integer(INT16), dimension(:), allocatable :: val_sequence

    ! support variables for this <subroutine>

    ! STEP.01
    ! read the given data
    ! 1. length of the given sequence
    ! 2. the number of copies of given sequence
    read(unit=INPUT_UNIT, fmt=*) len_sequence, num_copy

    ! STEP.02
    ! allocate the array to store the values of the given sequence
    allocate( val_sequence(1:len_sequence) )

    ! STEP.03
    ! read the given data
    ! 3. values of the given sequence
    read(unit=INPUT_UNIT, fmt=*) val_sequence(1:len_sequence)

    ! STEP.04
    ! initialize the variables for this task
    num_inversion_total = 0_INT64

    ! STEP.05
    ! count up the number of the target pairs
    do itr_elm_mstr = 1_INT32, len_sequence - 1_INT32, 1_INT32

      num_inversion_sngl  = 0_INT64
      num_inversion_pair  = 0_INT64

      do itr_elm_trgt = itr_elm_mstr + 1_INT32, len_sequence, 1_INT32
        if ( val_sequence(itr_elm_mstr) .gt. val_sequence(itr_elm_trgt) ) then
          num_inversion_sngl = num_inversion_sngl + 1_INT64
        else if ( val_sequence(itr_elm_mstr) .lt. val_sequence(itr_elm_trgt) ) then
          num_inversion_pair = num_inversion_pair + 1_INT64
        end if
      end do

      num_inversion_total &!
      = mod_pls(&!
        num_inversion_total, &!
        mod_pls(&!
          mod_mul( num_inversion_sngl, mod( sum_natural_nums(num_copy          ), val_divisor ), val_divisor ), &!
          mod_mul( num_inversion_pair, mod( sum_natural_nums(num_copy - 1_INT64), val_divisor ), val_divisor ), &!
          val_divisor &!
        ), &!
        val_divisor &!
      )

    end do

    ! STEP.06
    ! deallocate the array to store the values of the given sequence
    deallocate( val_sequence )

    ! STEP.07
    ! output the answer of this task
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') num_inversion_total

    ! STEP.END
    return

  end subroutine task_B

  pure function sum_natural_nums (n) result(sum)

    ! arguments for this <function>
    integer(INT64), intent(in) :: n

    ! return value of this <function>
    integer(INT64) :: sum

    sum = n * (n + 1_INT64) / 2_INT64
    return

  end function sum_natural_nums

end module JSC2019


program main

  ! <module>s to import
  use, non_intrinsic :: JSC2019

  ! require all variables to be explicitly declared
  implicit none

  call task_B

end program main
