! ==================================================================================================================================
! [contest]  ABC 087
! [task]     B
! [URL]      https://atcoder.jp/contests/abc087/tasks/abc087_b
!            https://atcoder.jp/contests/abs/tasks/abc087_b
! [compiler] fortran (GNU Fortran 9.2.1)
! [status]   https://atcoder.jp/contests/abs/submissions/22357960 : AC
! ==================================================================================================================================

module ABC087B

    ! <module>s to import
    use, intrinsic :: iso_fortran_env

    ! require all variables to be explicitly declared
    implicit none

    ! accessibility of the <subroutine>s and <function>s in this <module>
    private :: typ_coin
    public  :: typ_task_data
    public  :: load_data
    public  :: solve_task

    ! <type>s for this <module>
    type typ_coin
        integer(INT32) :: yen500
        integer(INT32) :: yen100
        integer(INT32) :: yen050
    end type typ_coin

    type typ_task_data
        type(typ_coin) , private :: coin
        integer(INT32) , private :: total
    end type typ_task_data

    ! contained <subroutine>s and <function>s are below
    contains

    pure function calc_total_yen (n050, n100, n500) result(yen)

        ! argument(s) for this <function>
        integer(INT32) , intent(in) :: n050, n100, n500

        ! return value of this <function>
        integer(INT32) :: yen

        yen = 50_INT32 * n050 + 100_INT32 * n100 + 500_INT32 * n500

    end function calc_total_yen

    subroutine load_data (unit, instance)

        ! argument(s) for this <subroutine>
        integer             , intent(in)    :: unit
        type(typ_task_data) , intent(inout) :: instance

        ! STEP.01
        ! Load the given data.
        read(unit= unit, fmt=*) instance%coin%yen500
        read(unit= unit, fmt=*) instance%coin%yen100
        read(unit= unit, fmt=*) instance%coin%yen050
        read(unit= unit, fmt=*) instance%total

        ! STEP.END
        return

    end subroutine load_data

    subroutine solve_task (unit, instance)

        ! argument(s) for this <subroutine>
        integer             , intent(in) :: unit
        type(typ_task_data) , intent(in) :: instance

        ! variable(s) for this <subroutine>
        integer(INT32) :: count
        integer(INT32) :: price

        ! support variable(s) for this <subroutine>
        integer(INT32) :: iter050
        integer(INT32) :: iter100
        integer(INT32) :: iter500

        ! STEP.01
        ! Initialize the counter.
        count = 0_INT32

        ! STEP.02
        ! Count how many ways can we select some of these coins so that they are `X` yen in total.
        do iter050 = 0_INT32 , instance%coin%yen050 , 1_INT32
        do iter100 = 0_INT32 , instance%coin%yen100 , 1_INT32
        do iter500 = 0_INT32 , instance%coin%yen500 , 1_INT32
            if ( calc_total_yen(n050= iter050, n100= iter100, n500= iter500) .eq. instance%total ) then
                count = count + 1_INT32
            end if
        end do
        end do
        end do

        ! STEP.03
        ! Print the solution of this task.
        write(unit= unit, fmt='(I0)', advance='yes') count

        ! STEP.END
        return

    end subroutine solve_task

end module ABC087B

program main

    ! <module>s to import
    use,     intrinsic :: iso_fortran_env
    use, non_intrinsic :: ABC087B

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
