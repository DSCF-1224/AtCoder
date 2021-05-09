! ==================================================================================================================================
! [contest]  ABC 085
! [task]     B
! [URL]      https://atcoder.jp/contests/abc085/tasks/abc085_b
!            https://atcoder.jp/contests/abs/tasks/abc085_b
! [compiler] fortran (GNU Fortran 9.2.1)
! [status]   https://atcoder.jp/contests/abs/submissions/22452145 : AC
! ==================================================================================================================================

module ABC085B

    ! <module>s to import
    use, intrinsic :: iso_fortran_env

    ! require all variables to be explicitly declared
    implicit none

    ! accessibility of the <subroutine>s and <function>s in this <module>
    public  :: typ_task_data
    private :: is_available
    public  :: load_data
    public  :: solve_task

    ! constant(s) for this <module>
    integer(INT32) , parameter , private :: num_disk_max = 100_INT32

    ! <type>s for this <module>
    type typ_task_data
        integer(INT32) , private :: total
        integer(INT32) , private :: each(num_disk_max) = 0_INT32
    end type typ_task_data

    ! contained <subroutine>s and <function>s are below
    contains

    pure elemental function is_available (n)

        ! argument(s) for this <function>
        integer(INT32) , intent(in) :: n

        ! return value of this <function>
        logical :: is_available

        is_available = (n .gt. 0_INT32)

    end function is_available

    subroutine load_data (unit, task_data)

        ! argument(s) for this <subroutine>
        integer             , intent(in   ) :: unit
        type(typ_task_data) , intent(inout) :: task_data

        ! variable(s) for this <subroutine>
        integer(INT32) :: iter_disk
        integer(INT32) :: buffer_diameter

        ! STEP.01
        ! Read the number of disk.
        read(unit= unit, fmt=*) task_data%total

        ! STEP.02
        ! Count the number of disks per diameter.
        do iter_disk = 1_INT32 , task_data%total , 1_INT32
            read(unit= unit, fmt=*) buffer_diameter
            task_data%each( buffer_diameter ) = task_data%each( buffer_diameter ) + 1_INT32
        end do

        ! STEP.END
        return

    end subroutine load_data

    subroutine solve_task (unit, task_data)

        ! argument(s) for this <subroutine>
        integer             , intent(in) :: unit
        type(typ_task_data) , intent(in) :: task_data

        ! variable(s) for this <block>
        logical        :: availability(num_disk_max)
        integer(INT32) :: iter

        ! STEP.01
        ! Find out which disks are available.
        availability(:) = is_available( task_data%each(:) )

        ! STEP.02
        ! Print the solution.
        write(unit= unit, fmt='(I0)', advance='yes') count( mask= availability(:) )

        ! STEP.END
        return

    end subroutine solve_task

end module ABC085B

program main

    ! <module>s to import
    use,     intrinsic :: iso_fortran_env
    use, non_intrinsic :: ABC085B         , only: typ_task_data
    use, non_intrinsic :: ABC085B         , only: load_data
    use, non_intrinsic :: ABC085B         , only: solve_task

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
