! [contest]    AtCoder Beginner Contest 001
! [task]       D
! [URL]        https://atcoder.jp/contests/abc001/tasks/abc001_4
! [compiler]   fortran (gfortran v4.8.4)
! [submission] https://atcoder.jp/contests/abc001/submissions/4678139 : AC

module ABC001

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! contained <subroutine>s and <function>s are below
  contains

  ! round the value of start time of rainy range
  pure function round_time_start (time_inpt) result(time_otpt)

    ! arguments for this <function>
    integer(kind=INT32), intent(in) :: time_inpt

    ! return value of this <function>
    integer(kind=INT32) :: time_otpt

    ! variables for this <function>
    integer (kind=INT32) :: buf_mod

    buf_mod = mod(time_inpt, 10_INT32)

    select case (buf_mod)
      case(0,5); time_otpt = time_inpt
      case(1:4); time_otpt = time_inpt - buf_mod
      case(6:9); time_otpt = time_inpt - buf_mod + 5_INT32
    end select

    ! STEP.END
    return

  end function round_time_start

  ! round the value of stop time of rainy range
  pure function round_time_stop (time_inpt) result(time_otpt)

    ! arguments for this <function>
    integer(kind=INT32), intent(in) :: time_inpt

    ! return value of this <function>
    integer(kind=INT32) :: time_otpt

    ! variables for this <function>
    integer (kind=INT32) :: buf_mod010, buf_mod100

    buf_mod010 = mod(time_inpt, 10_INT32)

    select case (buf_mod010)
      case(0,5); time_otpt = time_inpt
      case(1:4); time_otpt = time_inpt - buf_mod010 + 5_INT32
      case(6:9)
        buf_mod100 = mod(time_inpt, 100_INT32)
        select case (buf_mod100)
          case( 6:49); time_otpt = time_inpt - buf_mod010 +  10_INT32
          case(56:59); time_otpt = time_inpt - buf_mod100 + 100_INT32
        end select
    end select

    ! STEP.END
    return

  end function round_time_stop

  ! sort the rainy time about start time
  subroutine sort_range (num_records, time_start, time_stop)

    ! arguments for this <subroutine>
    integer(kind=INT32), intent(in)    :: num_records
    integer(kind=INT32), intent(inout) :: time_start(:)
    integer(kind=INT32), intent(inout) :: time_stop (:)

    ! support variables for this <subroutine>
    integer (kind=INT32) :: buf_time_start, buf_time_stop
    integer (kind=INT32) :: itr_trgt, itr_elem

    do itr_trgt = 2_INT32, num_records, 1_INT32

      itr_elem       = itr_trgt - 1_INT32
      buf_time_start = time_start(itr_trgt)
      buf_time_stop  = time_stop (itr_trgt)

      do while (itr_elem .ge. 1_INT32)

        time_start(itr_elem + 1_INT32) = time_start(itr_elem)
        time_stop (itr_elem + 1_INT32) = time_stop (itr_elem)

        if (time_start(itr_elem) .lt. buf_time_start) exit

        itr_elem = itr_elem - 1_INT32

      end do

      time_start(itr_elem + 1_INT32) = buf_time_start
      time_stop (itr_elem + 1_INT32) = buf_time_stop

    end do


  end subroutine sort_range

end module ABC001

program main

  ! <module>s to import
  use,     intrinsic :: iso_fortran_env
  use, non_intrinsic :: ABC001

  ! require all variables to be explicitly declared
  implicit none

  ! variables for this <program>
  character(len=9, kind=1) :: data_str
  integer  (kind=INT32)    :: num_records
  integer  (kind=INT32)    :: time_start_tmp, time_stop_tmp

  ! arrays for this <program>
  integer(kind=INT32), allocatable :: time_start(:), time_stop(:)

  ! support variables for this <program>
  integer(kind=INT32) :: itr

  ! STEP.01
  ! read out the number of the records
  read(unit=INPUT_UNIT, fmt=*) num_records

  ! STEP.02
  ! allocate the arrays to store the read data
  allocate( time_start(1:num_records) )
  allocate( time_stop (1:num_records) )

  ! STEP.03
  ! read out the data of rainy time
  do itr = 1, num_records, 1

    ! STEP.03.01
    ! read out the data as a string
    read(unit=INPUT_UNIT, fmt='(A9)') data_str

    ! STEP.03.02
    ! convert the data of string to the integer
    read(unit=data_str(1:4), fmt='(I4)') time_start(itr)
    read(unit=data_str(6:9), fmt='(I4)') time_stop (itr)

    ! STEP.03.03
    ! round the value of start & stop time
    time_start(itr) = round_time_start( time_start(itr) )
    time_stop (itr) = round_time_stop ( time_stop (itr) )

    ! STEP.03.TEST
    ! print '(I4,3(1X,I4))', time_start(itr), time_stop(itr)

  end do

  ! STEP.04
  ! sort the rainy ranges
  call sort_range (num_records, time_start(:), time_stop(:))

  ! STEP.04.TEST
  ! print *, '---------'
  ! do itr = 1, num_records, 1
  !   print '(I4,3(1X,I4))', time_start(itr), time_stop(itr)
  ! end do

  ! STEP.05
  ! simpilfy the memo of the rainy ranges
  time_start_tmp = time_start(1)
  time_stop_tmp  = time_stop (1)

  do itr = 2, num_records, 1
    if (time_stop_tmp .lt. time_start(itr)) then
      write(unit=OUTPUT_UNIT, fmt='(I4.4,"-",I4.4)', advance='yes') time_start_tmp, time_stop_tmp
      time_start_tmp = time_start(itr)
      time_stop_tmp  = time_stop (itr)
    else if (time_stop_tmp .lt. time_stop(itr)) then
      time_stop_tmp  = time_stop (itr)
    end if
  end do

  write(unit=OUTPUT_UNIT, fmt='(I4.4,"-",I4.4)', advance='yes') time_start_tmp, time_stop_tmp


  ! STEP.06
  ! allocate the arrays to store the read data
  deallocate( time_start )
  deallocate( time_stop  )

end program
