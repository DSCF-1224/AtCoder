! [contest]  ABC 133
! [task]     C
! [URL]      https://atcoder.jp/contests/abc133/tasks/abc133_c
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc133/submissions/6297202 : TLE

module ABC133

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_C

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_C

    ! variables for this <subroutine>
    integer(INT64) :: range_min
    integer(INT64) :: range_max
    integer(INT64) :: buffer
    integer(INT64) :: answer

    ! support variables for this <subroutine>
    integer(INT64) :: itr_sml, itr_lrg

    ! STEP.01
    ! read out given data
    read(unit=INPUT_UNIT, fmt=*) range_min, range_max

    ! STEP.02
    ! calculate the answer of this task
    answer = huge(answer)

    do itr_sml = range_min,         range_max - 1_INT64, 1_INT64
    do itr_lrg = itr_sml + 1_INT64, range_max,           1_INT64
      buffer = mod(itr_sml * itr_lrg, 2019_INT64)
      if (buffer .lt. answer) answer = buffer
    end do
    end do

    ! STEP.03
    ! output the answer of this task
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') answer

    ! STEP.END
    return

  end subroutine task_C

end module ABC133


program main

  ! <module>s to import
  use, non_intrinsic :: ABC133

  ! require all variables to be explicitly declared
  implicit none

  call task_C

end program main
