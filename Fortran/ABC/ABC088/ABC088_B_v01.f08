! ==================================================================================================================================
! [contest]  ABC 088
! [task]     B
! [URL]      https://atcoder.jp/contests/abc088/tasks/abc088_b
!            https://atcoder.jp/contests/abs/tasks/abc088_b
! [compiler] fortran (GNU Fortran 9.2.1)
! [status]   https://atcoder.jp/contests/abs/submissions/22427690 : AC
! ==================================================================================================================================

module ABC088B

    ! <module>s to import
    use, intrinsic :: iso_fortran_env

    ! require all variables to be explicitly declared
    implicit none

    ! accessibility of the <subroutine>s and <function>s in this <module>
    public  :: typ_task_data
    private :: fetch_point_maxval
    public  :: load_data
    public  :: solve_task

    ! <type>s for this <module>
    type typ_task_data
        integer(INT32) , private               :: number
        integer(INT32) , private , allocatable :: point(:)
    end type typ_task_data

    ! constant(s) for this <module>
    integer(INT32) , parameter , private :: point_lwb = 0_INT32

    ! contained <subroutine>s and <function>s are below
    contains

    subroutine fetch_point_maxval(array, maxval)

        ! argument(s) for this <subroutine>
        integer(INT32) , intent(inout) :: array(:)
        integer(INT32) , intent(  out) :: maxval

        ! variable(s) for this <subroutine>
        integer(INT32) :: buffer_maxloc

        buffer_maxloc        = maxloc( array(:) , dim= 1 )
        maxval               = array(buffer_maxloc)
        array(buffer_maxloc) = point_lwb

        return

    end subroutine fetch_point_maxval

    subroutine load_data (unit, task_data)

        ! argument(s) for this <subroutine>
        integer             , intent(in   ) :: unit
        type(typ_task_data) , intent(inout) :: task_data

        ! STEP.01
        ! Read the number of cards.
        read(unit= unit, fmt=*) task_data%number

        ! STEP.02
        ! Allocate the member array to store card points.
        allocate( task_data%point( task_data%number ) )

        ! STEP.03
        ! Read the each card point
        read(unit= unit, fmt=*) task_data%point(1:task_data%number)

        ! STEP.END
        return

    end subroutine load_data

    subroutine solve_task (unit, task_data)

        ! argument(s) for this <subroutine>
        integer             , intent(in)    :: unit
        type(typ_task_data) , intent(inout) :: task_data

        ! variable(s) for this <block>
        integer(INT32) :: count_card
        integer(INT32) :: sum_point_Alice
        integer(INT32) :: sum_point_Bob
        integer(INT32) :: point_maxval

        ! STEP.01
        ! Initialize the variables.
        count_card      = 0_INT32
        sum_point_Alice = 0_INT32
        sum_point_Bob   = 0_INT32

        ! STEP.02
        ! Calculate the target summation.
        loop_card: do

            ! STEP.01
            ! Update the Alice's point.
            if ( count_card .le. task_data%number ) then
                call fetch_point_maxval( array= task_data%point(:) , maxval= point_maxval )
                sum_point_Alice = sum_point_Alice + point_maxval
                count_card      = count_card      + 1_INT32
            else
                exit loop_card
            end if

            ! STEP.02
            ! Update the Bob's point.
            if ( count_card .le. task_data%number ) then
                call fetch_point_maxval( array= task_data%point(:) , maxval= point_maxval )
                sum_point_Bob = sum_point_Bob + point_maxval
                count_card    = count_card    + 1_INT32
            else
                exit loop_card
            end if

        end do loop_card

        ! STEP.03
        ! Print the solution
        write(unit= unit, fmt='(I0)', advance='yes') sum_point_Alice - sum_point_Bob

        ! STEP.END
        return

    end subroutine solve_task

end module ABC088B

program main

    ! <module>s to import
    use,     intrinsic :: iso_fortran_env
    use, non_intrinsic :: ABC088B

    ! require all variables to be explicitly declared
    implicit none

    type(typ_task_data) :: task_data

    ! STEP.01
    ! Read the given data
    call load_data(unit= INPUT_UNIT, task_data= task_data)

    ! STEP.02
    ! compute & output the solution of this task.
    call solve_task(unit= OUTPUT_UNIT, task_data= task_data)

end program main

! ==================================================================================================================================
! EOF
! ==================================================================================================================================
