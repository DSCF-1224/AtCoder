! contest  : ABC 086
! task     : B
! URL      : https://atcoder.jp/contests/abc086/tasks/abc086_b
! compiler : fortran (gfortran v4.8.4)
! status   : https://atcoder.jp/contests/abc086/submissions/9119027 : AC

module ABC086

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none
  
  type obj_taskB

    ! data field
    integer(INT32), private :: a
    integer(INT32), private :: b
  
    ! contained <subroutine>s and <function>s are below
    contains

    procedure :: Concatenate           => taskB_Concatenate
    procedure :: IsConcatenatedSquare  => taskB_IsConcatenatedSquare
  
  end type obj_taskB

  ! constructor
  interface obj_taskB
    module procedure taskB_constructor
  end interface obj_taskB

  ! contained <subroutine>s and <function>s are below
  contains

  function taskB_constructor () result(obj)

    ! return value of this <function>
    type(obj_taskB) :: obj

    read(unit=INPUT_UNIT, fmt=*) obj%a, obj%b

    return

  end function taskB_constructor

  pure function taskB_Concatenate (obj_self) result(concatenated)

    ! arguments for this <function>
    class(obj_taskB), intent(in) :: obj_self

    ! return value of this <function>
    integer(INT32) :: concatenated

    select case (obj_self%b)
      case(        : 9_INT32); concatenated =   10_INT32 * obj_self%a
      case(10_INT32:99_INT32); concatenated =  100_INT32 * obj_self%a
      case default;            concatenated = 1000_INT32 * obj_self%a
    end select

    concatenated = concatenated + obj_self%b

    return

  end function taskB_Concatenate

  pure function taskB_IsConcatenatedSquare (obj_self) result(isSquare)

    ! arguments for this <function>
    class(obj_taskB), intent(in) :: obj_self

    ! return value of this <function>
    logical :: isSquare

    ! variables for this <function>
    integer(INT32) :: iter
    integer(INT32) :: iterSquare

    iter       = 1_INT32
    iterSquare = 1_INT32
    isSquare   = .false.

    do while ( iterSquare .le. obj_self%Concatenate() )

      if ( iterSquare .eq. obj_self%Concatenate() ) then
        isSquare = .true.
        exit
      else
        iter       = iter + 1_INT32
        iterSquare = iter * iter
      end if

    end do

    return

  end function taskB_IsConcatenatedSquare

end module ABC086

program main

  ! <module>s to import
  use, non_intrinsic :: ABC086

  ! require all variables to be explicitly declared
  implicit none

  type(obj_taskB) :: obj_given_data

  ! STEP.01
  ! initialize the instace
  obj_given_data = obj_taskB()

  ! STEP.02
  ! compute & output the answer of ABC086 A
  if ( obj_given_data%IsConcatenatedSquare() ) then
    write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') 'Yes'
  else
    write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') 'No'
  end if

end program main

! --- EOF --- !
