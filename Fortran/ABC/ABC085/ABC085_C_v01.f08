! ==================================================================================================================================
! [contest]  ABC 085
! [task]     C
! [URL]      https://atcoder.jp/contests/abc085/tasks/abc085_c
!            https://atcoder.jp/contests/abs/tasks/abc085_c
! [compiler] fortran (GNU Fortran 9.2.1)
! [status]   https://atcoder.jp/contests/abs/submissions/22453184 : AC
! ==================================================================================================================================

module ABC085C

    ! <module>s to import
    use, intrinsic :: iso_fortran_env

    ! require all variables to be explicitly declared
    implicit none

    ! accessibility of the <subroutine>s and <function>s in this <module>
    private :: typ_combination_bill
    public  :: typ_task_data
    private :: is_possible
    private :: solve_task
    private :: total_price
    public  :: answer_task
    public  :: load_data

    ! constant(s) for this <module>
    integer(INT32) , parameter , private :: num_bill_unable = -1_INT32

    ! <type>s for this <module>
    type typ_combination_bill
        integer(INT32) , private :: k01yen = num_bill_unable
        integer(INT32) , private :: k05yen = num_bill_unable
        integer(INT32) , private :: k10yen = num_bill_unable
    end type typ_combination_bill

    type typ_task_data
        integer(INT32) , private :: num_bill_total
        integer(INT32) , private :: val_otoshidama
    end type typ_task_data

    ! contained <subroutine>s and <function>s are below
    contains

    pure function is_possible (task_data, combination)

        ! argument(s) for this <function>
        type(typ_task_data)        , intent(in) :: task_data
        type(typ_combination_bill) , intent(in) :: combination

        ! return value of this <function>
        logical :: is_possible

        is_possible = ( task_data%val_otoshidama .eq. total_price(combination) )

    end function is_possible

    pure function solve_task (task_data) result(combination)

        ! argument(s) for this <function>
        type(typ_task_data) , intent(in) :: task_data

        ! variable(s) for this <block>
        integer(INT32)             :: iter_k01yen
        integer(INT32)             :: iter_k05yen

        ! return value of this <function>
        type(typ_combination_bill) :: combination


        ! STEP.01
        ! Search for a combination that corresponds to the desired amount.
        loop_01k: do iter_k01yen = 0_INT32 , task_data%num_bill_total               , 1_INT32
        loop_05k: do iter_k05yen = 0_INT32 , task_data%num_bill_total - iter_k01yen , 1_INT32

            ! STEP.01
            ! Determine a candidate for a combination.
            combination%k01yen =                            iter_k01yen
            combination%k05yen =                                          iter_k05yen
            combination%k10yen = task_data%num_bill_total - iter_k01yen - iter_k05yen

            ! STEP.02
            ! Judge the combination.
            if ( is_possible (task_data= task_data, combination= combination) ) then
                return
            end if

        end do loop_05k
        end do loop_01k

        ! STEP.02
        ! If there is no appropriate combination, reset the combination.
        combination%k01yen = num_bill_unable
        combination%k05yen = num_bill_unable
        combination%k10yen = num_bill_unable

    end function solve_task

    pure function total_price (combination)

        ! argument(s) for this <function>
        type(typ_combination_bill) , intent(in) :: combination

        ! return value of this <function>
        integer(INT32) :: total_price

        total_price &!
        =  1000_INT32 * combination%k01yen &!
        +  5000_INT32 * combination%k05yen &!
        + 10000_INT32 * combination%k10yen

    end function total_price

    subroutine answer_task (unit, task_data)

        ! argument(s) for this <subroutine>
        integer             , intent(in) :: unit
        type(typ_task_data) , intent(in) :: task_data

        ! variable(s) for this <subroutine>
        type(typ_combination_bill) :: combination

        ! STEP.01
        ! Calculate the answer of this task.
        combination = solve_task(task_data= task_data)

        ! STEP.02
        ! Print the solution.
        write(unit= unit, fmt='(I0,*(1X,I0))', advance='yes') &!
            combination%k10yen , &!
            combination%k05yen , &!
            combination%k01yen

        ! STEP.END
        return

    end subroutine answer_task

    subroutine load_data (unit, task_data)

        ! argument(s) for this <subroutine>
        integer             , intent(in   ) :: unit
        type(typ_task_data) , intent(inout) :: task_data

        ! variable(s) for this <subroutine>
        integer(INT32) :: iter_disk
        integer(INT32) :: buffer_diameter

        ! STEP.01
        ! Read the given data.
        read(unit= unit, fmt=*)        &!
            task_data%num_bill_total , &!
            task_data%val_otoshidama

        ! STEP.END
        return

    end subroutine load_data

end module ABC085C

program main

    ! <module>s to import
    use,     intrinsic :: iso_fortran_env
    use, non_intrinsic :: ABC085C         , only: typ_task_data
    use, non_intrinsic :: ABC085C         , only: answer_task
    use, non_intrinsic :: ABC085C         , only: load_data

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
