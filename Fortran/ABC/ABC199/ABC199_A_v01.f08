! ==================================================================================================================================
! [contest]  ABC 199
! [task]     A
! [URL]      https://atcoder.jp/contests/abc199/tasks/abc199_a
! [compiler] Fortran (GNU Fortran 9.2.1)
! [status]   https://atcoder.jp/contests/abc199/submissions/22466556 : AC
! ==================================================================================================================================

module ABC199A

    ! <module>s to import
    use, intrinsic :: iso_fortran_env

    ! require all variables to be explicitly declared
    implicit none

    ! accessibility of the <subroutine>s and <function>s in this <module>
    public  :: typ_task_data
    private :: eval_task_data
    public  :: load_data
    public  :: answer_task

    ! <type>s for this <module>
    type typ_task_data
        integer(INT32) , private :: A
        integer(INT32) , private :: B
        integer(INT32) , private :: C
    end type typ_task_data

    ! contained <subroutine>s and <function>s are below
    contains

    pure function eval_task_data(task_data) result(stat)

        ! argument(s) for this <function>
        type(typ_task_data) , intent(in) :: task_data

        ! return value of this <function>
        logical :: stat

        stat = ( (task_data%A ** 2) + (task_data%B ** 2) ) .lt. (task_data%C ** 2)

    end function eval_task_data

    subroutine load_data (unit, task_data)

        ! argument(s) for this <subroutine>
        integer             , intent(in   ) :: unit
        type(typ_task_data) , intent(inout) :: task_data

        ! STEP.01
        ! Read the given data.
        read(unit= unit, fmt=*) task_data%A , task_data%B , task_data%C

        ! STEP.END
        return

    end subroutine load_data

    subroutine answer_task (unit, task_data)

        ! argument(s) for this <subroutine>
        integer             , intent(in)    :: unit
        type(typ_task_data) , intent(inout) :: task_data

        ! STEP.01
        ! Print the solution of this task.
        if ( eval_task_data(task_data) ) then
            write(unit= unit, fmt='(A)', advance='yes') 'Yes'
        else
            write(unit= unit, fmt='(A)', advance='yes') 'No'
        end if

        ! STEP.END
        return

    end subroutine answer_task

end module ABC199A

program main

    ! <module>s to import
    use,     intrinsic :: iso_fortran_env
    use, non_intrinsic :: ABC199A         , only: typ_task_data
    use, non_intrinsic :: ABC199A         , only: answer_task
    use, non_intrinsic :: ABC199A         , only: load_data

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
