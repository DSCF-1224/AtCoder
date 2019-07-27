! [contest]  ABC 135
! [task]     B
! [URL]      https://atcoder.jp/contests/abc135/tasks/abc135_b
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc135/submissions/6577030 : RE
!            https://atcoder.jp/contests/abc135/submissions/6578125 : RE
!            https://atcoder.jp/contests/abc135/submissions/6578910 : AC

module ABC135

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_B

  ! contained <subroutine>s and <function>s are below
  contains
  
  subroutine task_B

    ! variables for this <subroutine>
    integer(INT32) :: len_sequence
    integer(INT32) :: num_descending
    integer(INT32) :: position_1st
    integer(INT32) :: position_2nd
    integer(INT8 ) :: val_sequence_buf
    logical        :: stat_valid

    ! arrays for this <subroutine>
    integer(INT8), dimension(:), allocatable :: val_sequence

    ! support variables for this <subroutine>
    integer(INT32) :: itr
    
    ! STEP.01
    ! read out the given data
    ! (length of the given sequence)
    read(unit=INPUT_UNIT, fmt=*) len_sequence

    ! STEP.02
    ! allocate the array to store the given data
    allocate( val_sequence(1:len_sequence) )

    ! STEP.03
    ! read out the given data
    ! (values of the given sequence)
    read(unit=INPUT_UNIT, fmt=*) val_sequence(:)

    ! STEP.04
    ! initialization of the variables
    num_descending = 0_INT32
    position_1st   = 0_INT32
    position_2nd   = 0_INT32
    stat_valid     = .true.

    do itr = 2_INT32, len_sequence, 1_INT32
      if ( val_sequence(itr-1) .gt. val_sequence(itr) ) then

        num_descending = num_descending + 1_INT32
        
        if ( num_descending .gt. 3_INT32 ) then
          stat_valid = .false.
          exit
        else if (position_1st .eq. 0_INT32) then
          position_1st = itr - 1
        else if (position_2nd .eq. 0_INT32) then
          position_2nd = itr
        end if

      end if
    end do
    
    ! STEP.05
    ! swap the element of the given sequence
    if ( num_descending .eq. 2_INT32 .and. stat_valid ) then
      val_sequence_buf             = val_sequence( position_1st )
      val_sequence( position_1st ) = val_sequence( position_2nd )
      val_sequence( position_2nd ) = val_sequence_buf
    end if
    
    ! STEP.06
    ! check the order of edited given sequence
    if ( stat_valid ) then
      do itr = 2_INT32, len_sequence, 1_INT32
        if ( val_sequence(itr-1) .gt. val_sequence(itr) ) then
          stat_valid = .false.
          exit
        end if
      end do
    end if

    ! STEP.07
    ! output the answer of this task
    if ( stat_valid ) then
      write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') 'YES'
    else
      write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') 'NO'
    end if

    ! STEP.08
    ! deallocate the array to store the given data
    deallocate( val_sequence )
    
    ! STEP.END
    return

  end subroutine task_B

end module ABC135

program main

  ! <module>s to import
  use, non_intrinsic :: ABC135
  
  call task_B

end program main

! End of File
