! ==================================================================================================================================
! [contest]  ABC 199
! [task]     B
! [URL]      https://atcoder.jp/contests/abc199/tasks/abc199_b
! [compiler] Fortran (GNU Fortran 9.2.1)
! [status]   https://atcoder.jp/contests/abc199/submissions/22467178 : AC
! ==================================================================================================================================

module ABC199B

    ! <module>s to import
    use, intrinsic :: iso_fortran_env

    ! require all variables to be explicitly declared
    implicit none

    ! accessibility of the <subroutine>s and <function>s in this <module>
    private :: typ_sequence
    public  :: typ_task_data
    private :: solve_task
    public  :: load_data
    public  :: answer_task

    ! <type>s for this <module>
    type typ_sequence
        integer(INT32) , private , allocatable :: A(:)
        integer(INT32) , private , allocatable :: B(:)
    end type typ_sequence

    type typ_task_data
        integer(INT32)     , private :: len
        type(typ_sequence) , private :: val
    end type typ_task_data

    ! contained <subroutine>s and <function>s are below
    contains

    pure function solve_task (task_data) result(solution)

        ! argument(s) for this <function>
        type(typ_task_data) , intent(in) :: task_data

        ! return value of this <function>
        integer(INT32) :: solution

        solution = max( minval(task_data%val%B(:)) - maxval(task_data%val%A(:)) + 1_INT32 , 0_INT32 )

    end function solve_task

    subroutine load_data (unit, task_data)

        ! argument(s) for this <subroutine>
        integer             , intent(in   ) :: unit
        type(typ_task_data) , intent(inout) :: task_data

        ! STEP.01
        ! Read the length of the given sequence
        read(unit= unit, fmt=*) task_data%len

        ! STEP.02
        ! Allocate the member array to store the given data.
        allocate( task_data%val%A( task_data%len ) )
        allocate( task_data%val%B( task_data%len ) )

        ! STEP.03
        ! Read the values of the given sequences
        read(unit= unit, fmt=*) task_data%val%A(:)
        read(unit= unit, fmt=*) task_data%val%B(:)

        ! STEP.END
        return

    end subroutine load_data

    subroutine answer_task (unit, task_data)

        ! argument(s) for this <subroutine>
        integer             , intent(in)    :: unit
        type(typ_task_data) , intent(inout) :: task_data

        ! STEP.01
        ! Print the solution of this task.
        write(unit= unit, fmt='(I0)', advance='yes') solve_task(task_data)

        ! STEP.END
        return

    end subroutine answer_task

end module ABC199B

program main

    ! <module>s to import
    use,     intrinsic :: iso_fortran_env
    use, non_intrinsic :: ABC199B         , only: typ_task_data
    use, non_intrinsic :: ABC199B         , only: answer_task
    use, non_intrinsic :: ABC199B         , only: load_data

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
