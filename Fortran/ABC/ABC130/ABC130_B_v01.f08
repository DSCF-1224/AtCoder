! [contest]  ABC 130
! [task]     B
! [URL]      https://atcoder.jp/contests/abc130/tasks/abc130_?
! [compiler] fortran (gfortran v4.8.4)
! [status]   NOT Submitted

module ABC130

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_B

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_B

    ! variables for this <subroutine>
    integer(INT32)                            :: num_bound_total
    integer(INT32)                            :: coordinate_limit
    integer(INT32), allocatable, dimension(:) :: coordinate_bound_ref
    integer(INT32), allocatable, dimension(:) :: coordinate_bound
    integer(INT32)                            :: coordinate_current

    ! support variables for this <subroutine>
    integer(INT32) :: counter

    ! STEP.01
    ! read out the number of bound
    ! read out the limit of coordinate
    read(unit=INPUT_UNIT, fmt=*) num_bound_total, coordinate_limit

    ! STEP.02
    ! allocate the arrays
    allocate(coordinate_bound_ref(1:num_bound_total  ))
    allocate(coordinate_bound    (1:num_bound_total+1))

    ! STEP.03
    ! read out the coordinate where to bound
    read(unit=INPUT_UNIT, fmt=*) coordinate_bound_ref(1:num_bound_total)

    ! STEP.04
    ! calculate the coordinate at the each bound
    coordinate_bound(1) = 0_INT32
    do counter = 2, num_bound_total+1, 1
      coordinate_bound(counter) = coordinate_bound(counter-1) + coordinate_bound_ref(counter-1)
    end do

    ! STEP.04
    ! output the result
    do counter = 1, num_bound_total, 1
      if (coordinate_bound(counter) .le. coordinate_limit .and. coordinate_bound(counter+1) .gt. coordinate_limit) then
        write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') counter
        exit
      end if
    end do

    if (counter .gt. num_bound_total) then
      write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') num_bound_total+1
    end if

    ! STEP.END
    return

  end subroutine task_B

end module ABC130


program main

  ! <module>s to import
  use, non_intrinsic :: ABC130

  ! require all variables to be explicitly declared
  implicit none

  call task_B

end program main
