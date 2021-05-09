! ==================================================================================================================================
! [contest]  ABC ???
! [task]     ?
! [URL]      https://atcoder.jp/
! [compiler] Fortran (GNU Fortran 9.2.1)
! [status]   NOT Submitted
! ==================================================================================================================================

module ABC000?

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of the <subroutine>s and <function>s in this <module>
  public  :: typ_task_data
  public  :: load_data
  public  :: answer_task

  ! <type>s for this <module>
  type typ_task_data
  end type typ_task_data

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine load_data (unit, task_data)

      ! argument(s) for this <subroutine>
      integer             , intent(in   ) :: unit
      type(typ_task_data) , intent(inout) :: task_data

      ! STEP.END
      return

  end subroutine load_data

  subroutine answer_task (unit, task_data)

      ! argument(s) for this <subroutine>
      integer             , intent(in)    :: unit
      type(typ_task_data) , intent(inout) :: task_data

      ! STEP.END
      return

  end subroutine answer_task

end module ABC000?

program main

  ! <module>s to import
  use,     intrinsic :: iso_fortran_env
  use, non_intrinsic :: ABC000?         , only: typ_task_data
  use, non_intrinsic :: ABC000?         , only: answer_task
  use, non_intrinsic :: ABC000?         , only: load_data

  ! require all variables to be explicitly declared
  implicit none

  type(typ_task_data) :: task_data

  ! STEP.01
  ! Read the given data
  call load_data(unit= INPUT_UNIT, task_data= task_data)

  ! STEP.02
  ! compute & output the solution of this task.
  call answer_task(unit= OUTPUT_UNIT, task_data= task_data)

end program main

! ==================================================================================================================================
! EOF
! ==================================================================================================================================
