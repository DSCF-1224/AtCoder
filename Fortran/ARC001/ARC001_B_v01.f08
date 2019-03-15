! AtCoder Regular Contest 001 B
! [URL]      https://atcoder.jp/contests/arc001/tasks/arc001_2
! [compiler] fortran (gfortran v4.8.4)
! [status]   AC
! 
module ARC001

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none


  ! contained <subroutine>s and <function>s are below
  contains

  subroutine ARC001_B

    ! variables for this <subroutine>
    integer (kind=INT8) :: temp_crnt      ! current temperature
    integer (kind=INT8) :: temp_trgt      ! target  temperature
    integer (kind=INT8) :: temp_chng_crnt ! change of the temperature
    integer (kind=INT8) :: temp_chng_unit ! change of the temperature
    integer (kind=INT8) :: num_operations ! the number of operation

    ! STEP.01
    ! read out the data
    read( unit=INPUT_UNIT, fmt=* ) temp_crnt, temp_trgt

    ! STEP.02
    ! calculate the maximum times of operation

      ! STEP.02.01
      ! initialize the variables
      num_operations = 0_INT8
      temp_chng_crnt = temp_trgt - temp_crnt

      if (temp_chng_crnt .ne. 0_INT8) then

        ! STEP.02.02
        ! count the number of operation of 10 degree
        temp_chng_unit = 10_INT8

        do while ( abs (temp_chng_crnt) .ge. 8_INT8 )
          temp_chng_crnt = temp_chng_crnt - sign (temp_chng_unit, temp_chng_crnt)
          num_operations = num_operations + 1_INT8
        end do

        ! STEP.02.03
        ! count the number of operation of 5 degree
        temp_chng_unit = 5_INT8

        do while ( abs (temp_chng_crnt) .ge. 3_INT8 )
          temp_chng_crnt = temp_chng_crnt - sign (temp_chng_unit, temp_chng_crnt)
          num_operations = num_operations + 1_INT8
        end do

        ! STEP.02.04
        ! count the number of operation of 1 degree
        num_operations = num_operations + abs (temp_chng_crnt)

      end if

    ! STEP.03
    ! output the result
    write (unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') num_operations

    ! STEP.END
    return

  end subroutine ARC001_B

end module ARC001

program main

  ! <module>s to import
  use, non_intrinsic :: ARC001

  ! require all variables to be explicitly declared
  implicit none

  call ARC001_B

end program main
