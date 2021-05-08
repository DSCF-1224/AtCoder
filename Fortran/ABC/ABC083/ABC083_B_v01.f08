! ==================================================================================================================================
! [contest]  ABC 083
! [task]     B
! [URL]      https://atcoder.jp/contests/abc083/tasks/abc083_b
!            https://atcoder.jp/contests/abs/tasks/abc083_b
! [compiler] fortran (GNU Fortran 9.2.1)
! [status]   https://atcoder.jp/contests/abs/submissions/22419018 : AC
! ==================================================================================================================================

module ABC083B

    ! <module>s to import
    use, intrinsic :: iso_fortran_env

    ! require all variables to be explicitly declared
    implicit none

    ! accessibility of the <subroutine>s and <function>s in this <module>
    public  :: typ_task_data
    private :: typ_task_data_sum
    private :: is_inclusive
    private :: sum_digit
    public  :: load_data
    public  :: solve_task

    ! <type>s for this <module>

    type typ_task_data_sum
        integer(INT32) , private :: min
        integer(INT32) , private :: max
    end type typ_task_data_sum

    type typ_task_data
        integer(INT32)          , private :: range
        type(typ_task_data_sum) , private :: sum
    end type typ_task_data

    ! contained <subroutine>s and <function>s are below
    contains

    pure function is_inclusive(i, instance)

        ! argument(s) for this <function>
        integer(INT32)      , intent(in) :: i
        type(typ_task_data) , intent(in) :: instance

        ! return value of this <function>
        logical :: is_inclusive

        is_inclusive = (i .ge. instance%sum%min) .and. (i .le. instance%sum%max)

    end function is_inclusive

    pure function sum_digit(i)

        ! argument(s) for this <function>
        integer(INT32) , intent(in) :: i

        ! return value of this <function>
        integer(INT32) :: sum_digit

        ! variable(s) for this <function>
        integer(INT32) :: buffer

        ! STEP.01
        ! Initialize the buffer/summation.
        buffer    = i
        sum_digit = 0_INT32

        ! STEP.02
        ! Calculate the targe summation.
        do while (buffer .gt. 0_INT32)
            sum_digit = sum_digit + mod(a= buffer, p= 10_INT32)
            buffer    = buffer    / 10_INT32
        end do

    end function sum_digit

    subroutine load_data (unit, instance)

        ! argument(s) for this <subroutine>
        integer             , intent(in)    :: unit
        type(typ_task_data) , intent(inout) :: instance

        ! STEP.01
        ! Load the given data.
        read(unit= unit, fmt=*)   &!
            instance%range      , &!
            instance%sum%min    , &!
            instance%sum%max

        ! STEP.END
        return

    end subroutine load_data

    subroutine solve_task (unit, instance)

        ! argument(s) for this <subroutine>
        integer             , intent(in) :: unit
        type(typ_task_data) , intent(in) :: instance

        ! variable(s) for this <block>
        integer(INT32) :: sum_inclusive
        integer(INT32) :: iter

        ! STEP.01
        ! Initialize the variables.
        sum_inclusive = 0_INT32

        ! STEP.02
        ! Calculate the target summation.
        do iter = 1_INT32, instance%range, 1_INT32
            if ( is_inclusive(i= sum_digit(iter), instance= instance) ) then
                sum_inclusive = sum_inclusive + iter
            end if
        end do

        ! STEP.03
        ! Print the solution
        write(unit= unit, fmt='(I0)', advance='yes') sum_inclusive

        ! STEP.END
        return

    end subroutine solve_task

end module ABC083B

program main

    ! <module>s to import
    use,     intrinsic :: iso_fortran_env
    use, non_intrinsic :: ABC083B

    ! require all variables to be explicitly declared
    implicit none

    type(typ_task_data) :: task_data

    ! STEP.01
    ! Read the given data
    call load_data(unit= INPUT_UNIT, instance= task_data)

    ! STEP.02
    ! compute & output the solution of this task.
    call solve_task(unit= OUTPUT_UNIT, instance= task_data)

end program main

! ==================================================================================================================================
! EOF
! ==================================================================================================================================
