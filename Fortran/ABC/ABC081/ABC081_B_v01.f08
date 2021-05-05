! ==================================================================================================================================
! [contest]  ABC 081
! [task]     A
! [URL]      https://atcoder.jp/contests/abc081/tasks/abc081_b
! [compiler] fortran (GNU Fortran 9.2.1)
! [status]   https://atcoder.jp/contests/abs/submissions/22338110 : AC
! ==================================================================================================================================

module utility
 
    ! <module>s to import
    use, intrinsic :: iso_fortran_env
 
    ! require all variables to be explicitly declared
    implicit none
 
    ! accessibility of the <subroutine>s and <function>s in this <module>
    public  :: is_even
 
    ! contained <subroutine>s and <function>s are below
    contains
 
    pure function is_even (i) result(stat)
 
        ! argument(s) for this <function>
        integer(INT32) , intent(in) :: i
 
        ! return value of this <function>
        logical :: stat
 
        stat = .not. btest(i= i, pos= 0)
 
    end function is_even
 
end module utility

module ABC081B

    ! <module>s to import
    use,     intrinsic :: iso_fortran_env
    use, non_intrinsic :: utility

    ! require all variables to be explicitly declared
    implicit none

    ! accessibility of the <subroutine>s and <function>s in this <module>
    public  :: typ_task_data
    public  :: load_data
    public  :: solve_task

    ! <type>s for this <module>
    type typ_task_data
        integer(INT32) , private               :: size
        integer(INT32) , private , allocatable :: count(:)
        integer(INT32) , private , allocatable :: value(:)
    end type typ_task_data

    ! constant(s) for this <module>
    integer(INT32) , parameter , private :: count_limit = bit_size(count_limit)

    ! contained <subroutine>s and <function>s are below
    contains

    subroutine load_data (unit, instance)

        ! argument(s) for this <subroutine>
        integer             , intent(in)    :: unit
        type(typ_task_data) , intent(inout) :: instance

        ! variable(s) for this <subroutine>
        integer(INT32) :: iter

        ! STEP.01
        ! Load the number of given integers.
        read(unit= unit, fmt=*) instance%size

        ! STEP.02
        ! Allocate the array to store given data.
        allocate( instance%count(instance%size) , mold= count_limit )
        allocate( instance%value(instance%size) )

        ! STEP.03
        ! Load given integers.
        read(unit= unit, fmt=*) instance%value(:)

        ! STEP.END
        return

    end subroutine load_data

    subroutine solve_task (unit, instance)

        ! argument(s) for this <subroutine>
        integer             , intent(in)    :: unit
        type(typ_task_data) , intent(inout) :: instance

        ! variable(s) for this <subroutine>
        integer(INT32) :: iter

        ! STEP.01
        ! Calculate the answer of this task
        loop_elm: do iter = 1_INT32 , instance%size , 1_INT32
            do while ( is_even( instance%value(iter) ) )
                instance%value(iter) = instance%value(iter) / 2_INT32
                instance%count(iter) = instance%count(iter) + 1_INT32
            end do
        end do loop_elm

        ! STEP.02
        ! Print the answer of this task to console.
        write(unit= unit, fmt='(I0)', advance='yes') minval( instance%count(:) )

    end subroutine solve_task

end module ABC081B

program main

    ! <module>s to import
    use,     intrinsic :: iso_fortran_env
    use, non_intrinsic :: ABC081B

    ! require all variables to be explicitly declared
    implicit none

    type(typ_task_data) :: task_data

    ! STEP.01
    ! Read the given data
    call load_data(unit= INPUT_UNIT, instance= task_data)

    ! STEP.02
    ! compute & output the answer of ABC081 A
    call solve_task (unit= OUTPUT_UNIT, instance= task_data)

end program main

! ==================================================================================================================================
! EOF
! ==================================================================================================================================
