! [contest]  ABC 123
! [task]     C
! [URL]      https://atcoder.jp/contests/abc123/tasks/ABC123_c
! [compiler] fortran (gfortran v4.8.4)
! [status]   NOT submitted
! 
module ABC123

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: ABC123_C

  ! constants for this <module>
  integer(kind=INT32), parameter, private :: num_cities         = 6_INT32
  integer(kind=INT32), parameter, private :: num_transportation = 5_INT32

  ! variables for this <module>
  integer(kind=INT64), private :: time_passed
  integer(kind=INT64), private :: num_people_total
  integer(kind=INT64), private :: num_people_city     (1:num_cities)
  integer(kind=INT64), private :: num_people_city_memo(1:num_cities)
  integer(kind=INT64), private :: num_people_limit(1:num_transportation)

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine ABC123_C

    ! variables for this <subroutine>

    ! support variables for this <subroutine>
    integer(kind=INT32) :: itr

    ! STEP.01
    ! read out the number of people in the city A
    read(unit=INPUT_UNIT, fmt='(I16)') num_people_total
    num_people_city(1)            = num_people_total
    num_people_city(2:num_cities) = 0_INT64

    ! STEP.02
    ! read out the number of people which each transportation can transport
    do itr = 1_INT32, num_transportation, 1_INT32
      read(unit=INPUT_UNIT, fmt='(I16)') num_people_limit(itr)
    end do

    ! STEP.03
    ! calcualte the time to transport all people

    time_passed = 0_INT64

    do
      if (num_people_city(num_cities) .eq. num_people_total) then
        write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') time_passed
        return
      else

        time_passed = time_passed + 1_INT64

        num_people_city_memo(:) = num_people_city(:)

        do itr = num_cities-1_INT32, -1_INT32, 1_INT32
          if (num_people_city_memo(itr) .lt. num_people_limit(itr)) then
            num_people_city(itr+1) = num_people_city_memo(itr+1) + num_people_city(itr)
            num_people_city(itr)   = 0_INT64
          else
            num_people_city(itr+1) = num_people_city_memo(itr+1) + num_people_limit(itr)
            num_people_city(itr)   = num_people_city_memo(itr)   - num_people_limit(itr)
          end if
        end do

      end if
    end do

  end subroutine ABC123_C

end module ABC123


program main

  ! <module>s to import
  use, non_intrinsic :: ABC123

  ! require all variables to be explicitly declared
  implicit none

  call ABC123_C

end program main
