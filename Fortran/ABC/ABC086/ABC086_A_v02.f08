! contest  : ABC 086
! task     : A
! URL      : https://atcoder.jp/contests/abc086/tasks/abc086_a
! compiler : fortran (gfortran v4.8.4)
! status   : https://atcoder.jp/contests/abc086/submissions/9118185 : AC

module ABC086

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none
  
  type obj_taskA

    ! data field
    integer(INT16), private :: a
    integer(INT16), private :: b
  
    ! contained <subroutine>s and <function>s are below
    contains

    procedure :: Product    => taskA_Product
    procedure :: IsProdEven => taskA_IsProdEven
  
  end type obj_taskA

  ! constructor
  interface obj_taskA
    module procedure taskA_constructor
  end interface obj_taskA

  ! contained <subroutine>s and <function>s are below
  contains

  function taskA_constructor () result(obj)

    ! return value of this <function>
    type(obj_taskA) :: obj

    read(unit=INPUT_UNIT, fmt=*) obj%a, obj%b

    return

  end function taskA_constructor

  pure function taskA_Product (obj_self) result(Product)

    ! arguments for this <function>
    class(obj_taskA), intent(in) :: obj_self

    ! return value of this <function>
    integer(INT16) :: Product

    Product = obj_self%a * obj_self%b

    return

  end function taskA_Product

  pure function taskA_IsProdEven (obj_self) result(stat)

    ! arguments for this <function>
    class(obj_taskA), intent(in) :: obj_self

    ! return value of this <function>
    logical :: stat

    stat = (mod( a=obj_self%product(), p=2_INT16 ) .eq. 0_INT16)

    return

  end function taskA_IsProdEven

end module ABC086


program main

  ! <module>s to import
  use, non_intrinsic :: ABC086

  ! require all variables to be explicitly declared
  implicit none

  type(obj_taskA) :: obj_given_data

  ! STEP.01
  ! initialize the instace
  obj_given_data = obj_taskA()

  ! STEP.02
  ! compute & output the answer of ABC086 A
  if ( obj_given_data%IsProdEven() ) then
    write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') 'Even'
  else
    write(unit=OUTPUT_UNIT, fmt='(A)', advance='yes') 'Odd'
  end if

end program main

! --- EOF --- !
