! [contest]    CADDi 2018 for Beginners
! [task]       B
! [URL]        https://atcoder.jp/contests/caddi2018b/tasks/caddi2018b_b
! [compiler]   fortran (gfortran v4.8.4)
! [submission] https://atcoder.jp/contests/caddi2018b/submissions/4669066 : AC

program CADDi2018_B

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! variables for this <program>
  integer(kind=INT32) :: num_plates_usable, num_plates_given
  integer(kind=INT32) :: val_width_wanted,  val_height_wanted
  integer(kind=INT32) :: val_width_given,   val_height_given

  ! support variables for this <program>
  integer :: itr

  ! STEP.01
  ! read out the number of usable plates & wanted width and height of plates
  read(unit=INPUT_UNIT, fmt=*) num_plates_given, val_height_wanted, val_width_wanted

  ! STEP.02
  ! initialize the counter
  num_plates_usable = 0

  ! STEP.03
  do itr = 1, num_plates_given, 1
    
    ! STEP.03.01
    ! read out the given width and height of plates
    read(unit=INPUT_UNIT, fmt=*) val_height_given, val_width_given

    ! STEP.03.02
    ! judge whether the given plate is a usable one
    if (val_height_given .ge. val_height_wanted .and. val_width_given .ge. val_width_wanted) then
      num_plates_usable = num_plates_usable + 1
    end if

  end do

  ! STEP.04
  ! output the number of usable plates
  write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') num_plates_usable

end program CADDi2018_B
