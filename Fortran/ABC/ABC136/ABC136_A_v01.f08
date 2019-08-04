! [contest]  ABC 136
! [task]     A
! [URL]      https://atcoder.jp/contests/abc136/tasks/abc136_a
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc136/submissions/6688564 : AC

module ABC136

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_A
  
  contains
  
  subroutine task_A (volume_Container1_max, volume_Container1_contained, volume_Container2_contained)

    ! arguments for this <subroutine>
    integer(INT8), intent(in) :: volume_Container1_max
    integer(INT8), intent(in) :: volume_Container1_contained
    integer(INT8), intent(in) :: volume_Container2_contained

    ! variables for this <subroutine>
    integer(INT8) :: volume_Container1_receivable
    integer(INT8) :: volume_remained

    volume_Container1_receivable = volume_Container1_max - volume_Container1_contained

    if (volume_Container1_receivable .ge. volume_Container2_contained) then
      volume_remained = 0_INT8
    else
      volume_remained = volume_Container2_contained - volume_Container1_receivable
    end if

    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') volume_remained
    
    ! STEP.END
    return

  end subroutine task_A

end module ABC136

program main

  ! <module>s to import
  use,     intrinsic :: iso_fortran_env
  use, non_intrinsic :: ABC136

  ! variables for this <program>
  integer(INT8) :: A
  integer(INT8) :: B
  integer(INT8) :: C

  read(unit=INPUT_UNIT, fmt=*) A, B, C
  
  call task_A (A, B, C)

end program main

! End of File
