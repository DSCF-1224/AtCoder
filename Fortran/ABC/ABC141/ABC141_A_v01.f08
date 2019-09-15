! [contest]  ABC 141
! [task]     A
! [URL]      https://atcoder.jp/contests/abc141/tasks/abc141_a
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc141/submissions/7517631 : AC

module ABC141

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_A

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_A

    ! variables for this <subroutine>
    character(len=10, kind=1) :: buffer

    if (trim(buffer) .eq. 'Sunny') then
      write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') 'Cloudy'
    else if (trim(buffer) .eq. 'Cloudy') then
      write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') 'Rainy'
    else
      write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') 'Sunny'
    end if

    ! STEP.END
    return

  end subroutine task_A

end module ABC141


program main

  ! <module>s to import
  use, non_intrinsic :: ABC141

  ! require all variables to be explicitly declared
  implicit none

  call task_A

end program main

! --- EOF --- !
