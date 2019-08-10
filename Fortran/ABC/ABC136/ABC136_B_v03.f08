! [contest]  ABC 136
! [task]     B
! [URL]      https://atcoder.jp/contests/abc136/tasks/abc136_b
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc136/submissions/6793176

module ABC136

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_B
  private :: count_uneven
  private :: is_uneven_num
  private :: is_even

  ! contained <subroutine>s and <function>s are below
  contains
  
  subroutine task_B (val_range)

    ! arguments for this <subroutine>
    integer(INT32), intent(in) :: val_range

    ! variables for this <subroutine>
    integer(INT32) :: val_order
    integer(INT32) :: val_range_bffr

    val_range_bffr = val_range
    val_order      = 0_INT32

    do while (val_range_bffr .ge. 10_INT32)
      val_range_bffr = val_range_bffr / 10_INT32
      val_order      = val_order + 1_INT32
    end do

    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') count_uneven(val_range, val_order)
    
    ! STEP.END
    return

  end subroutine task_B

  pure function count_uneven (val_range, val_order) result (num_uneven_integers)

    ! arguments for this <function>
    integer(INT32), intent(in) :: val_range
    integer(INT32), intent(in) :: val_order

    ! return value of this <function>
    integer(INT32) :: num_uneven_integers

    ! support variables for this <function>
    integer(INT32) :: itr

    ! STEP.01
    ! initialize the return value of this <function>
    num_uneven_integers = 0_INT32

    ! STEP.02
    ! count up the number of uneven integers
    do itr = 1_INT32, val_range
      if ( is_uneven_num(val_target = itr, len_str = val_order + 1_INT32) ) then
        num_uneven_integers = num_uneven_integers + 1_INT32
      end if
    end do

    ! STEP.END
    return

  end function count_uneven

  pure function is_uneven_num (val_target, len_str) result(stat)

    ! arguments for this <function>
    integer(INT32), intent(in) :: val_target
    integer(INT32), intent(in) :: len_str

    ! return value of this <function>
    logical :: stat

    ! variables for this <function>
    character(len=len_str, kind=1) :: str_target

    write(unit=str_target, fmt='(I0)') val_target
    stat = .not. is_even( len_trim(str_target) )
    return

  end function is_uneven_num

  pure function is_even (val_target) result(stat)

    ! arguments for this <function>
    integer(INT32), intent(in) :: val_target

    ! return value of this <function>
    logical :: stat

    stat = mod(val_target, 2_INT32) .eq. 0_INT32
    return

  end function is_even

end module ABC136

program main

  ! <module>s to import
  use,     intrinsic :: iso_fortran_env
  use, non_intrinsic :: ABC136

  ! variables for this <program>
  integer(INT32) :: N

  read(unit=INPUT_UNIT, fmt=*) N
  
  call task_B (N)

end program main

! End of File
