! ==================================================================================================================================
! [contest]  ABC 081
! [task]     B
! [URL]      https://atcoder.jp/contests/abc081/tasks/abc081_b
!            https://atcoder.jp/contests/abs/tasks/abc081_b
! [compiler] Fortran (GNU Fortran 9.2.1)
! [status]   https://atcoder.jp/contests/abs/submissions/22454752 : AC
! ==================================================================================================================================

module ABC081B

    ! <module>s to import
    use, intrinsic :: iso_fortran_env

    ! require all variables to be explicitly declared
    implicit none

    ! accessibility of the <subroutine>s and <function>s in this <module>
    public  :: typ_task_data
    private :: solve_task
    public  :: answer_task
    public  :: load_data

    ! <type>s for this <module>
    type typ_task_data
        integer(INT32) , private               :: size
        integer(INT32) , private , allocatable :: value(:)
    end type typ_task_data

    ! contained <subroutine>s and <function>s are below
    contains

    pure function solve_task (task_data) result(solution)

        ! argument(s) for this <function>
        type(typ_task_data) , intent(in) :: task_data

        ! return value of this <function>
        integer(INT32) :: solution

        solution = minval( trailz( task_data%value(:) ) )

    end function solve_task

    subroutine answer_task (unit, task_data)

        ! argument(s) for this <subroutine>
        integer             , intent(in) :: unit
        type(typ_task_data) , intent(in) :: task_data

        write(unit= unit, fmt='(I0)', advance='yes') solve_task(task_data)
        return

    end subroutine answer_task

    subroutine load_data (unit, task_data)

        ! argument(s) for this <subroutine>
        integer             , intent(in)    :: unit
        type(typ_task_data) , intent(inout) :: task_data

        ! variable(s) for this <subroutine>
        integer(INT32) :: iter

        ! STEP.01
        ! Load the number of given integers.
        read(unit= unit, fmt=*) task_data%size

        ! STEP.02
        ! Allocate the array to store given data.
        allocate( task_data%value(task_data%size) )

        ! STEP.03
        ! Load given integers.
        read(unit= unit, fmt=*) task_data%value(:)

        ! STEP.END
        return

    end subroutine load_data

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
    call load_data(unit= INPUT_UNIT, task_data= task_data)

    ! STEP.02
    ! Compute & output the answer of this task.
    call answer_task (unit= OUTPUT_UNIT, task_data= task_data)

end program main

! ==================================================================================================================================
! EOF
! ==================================================================================================================================
