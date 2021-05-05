! ==================================================================================================================================
! [contest]  ABC 081
! [task]     A
! [URL]      https://atcoder.jp/contests/abc081/tasks/abc081_a
! [compiler] fortran (GNU Fortran 9.2.1)
! [status]   https://atcoder.jp/contests/abs/submissions/22333937 : AC
! ==================================================================================================================================

module utility

    ! <module>s to import
    use, intrinsic :: iso_fortran_env

    ! require all variables to be explicitly declared
    implicit none

    ! accessibility of the <subroutine>s and <function>s in this <module>
    public  :: is_even
    private :: is_multiple

    ! contained <subroutine>s and <function>s are below
    contains

    pure function is_even (i) result(stat)

        ! argument(s) for this <function>
        integer(INT32) , intent(in) :: i

        ! return value of this <function>
        logical :: stat

        stat = is_multiple(a= i, p= 2_INT32)

    end function is_even

    pure function is_multiple (a, p) result(stat)

        ! argument(s) for this <function>
        integer(INT32) , intent(in) :: a, p

        ! return value of this <function>
        logical :: stat

        stat = (mod(a= a, p= p) .lt. 1_INT32)

    end function is_multiple

end module utility


module ABC086

    ! <module>s to import
    use,     intrinsic :: iso_fortran_env
    use, non_intrinsic :: utility

    ! require all variables to be explicitly declared
    implicit none

    ! accessibility of the <subroutine>s and <function>s in this <module>
    public  :: typ_task_a
    public  :: load_data_task_a
    public  :: solve_task_a

    ! <type>s for this <module>
    type typ_task_a
        integer(INT32) , private :: a
        integer(INT32) , private :: b
    end type typ_task_a

    ! contained <subroutine>s and <function>s are below
    contains

    pure function calc_prod (instance) result(prod)

        ! argument(s) for this <subroutine>
        type(typ_task_a) , intent(in) :: instance

        ! return value of this <function>
        integer(INT32) :: prod

        prod = instance%a * instance%b

    end function calc_prod

    subroutine load_data_task_a (unit, instance)

        ! argument(s) for this <subroutine>
        integer          , intent(in)    :: unit
        type(typ_task_a) , intent(inout) :: instance

        read(unit= unit, fmt=*) instance%a, instance%b
        return

    end subroutine load_data_task_a

    subroutine solve_task_a (unit, instance)

        ! argument(s) for this <subroutine>
        integer          , intent(in) :: unit
        type(typ_task_a) , intent(in) :: instance

        if ( is_even( calc_prod(instance) ) ) then
            write(unit= OUTPUT_UNIT, fmt='(A)', advance='yes') 'Even'
        else
            write(unit= OUTPUT_UNIT, fmt='(A)', advance='yes') 'Odd'
        end if

        return

    end subroutine solve_task_a

end module ABC086


program main

    ! <module>s to import
    use,     intrinsic :: iso_fortran_env
    use, non_intrinsic :: ABC086

    ! require all variables to be explicitly declared
    implicit none

    type(typ_task_a) :: data_task

    ! STEP.01
    ! Read the given data
    call load_data_task_a(unit= INPUT_UNIT, instance= data_task)

    ! STEP.02
    ! compute & output the answer of ABC086 A
    call solve_task_a (unit= OUTPUT_UNIT, instance= data_task)

end program main

! ==================================================================================================================================
! EOF
! ==================================================================================================================================
