! ==================================================================================================================================
! [contest]  ABC 049
! [task]     C
! [URL]      https://atcoder.jp/contests/abc049/tasks/arc065_a
!            https://atcoder.jp/contests/abs/tasks/abc049_c
! [compiler] Fortran (GNU Fortran 9.2.1)
! [status]   NOT submitted
! ==================================================================================================================================

module utility

    ! <module>s to import
    use, intrinsic :: iso_fortran_env

    ! require all variables to be explicitly declared
    implicit none

    ! accessibility of the <subroutine>s and <function>s in this <module>
    public  :: reverse

    ! contained <subroutine>s and <function>s are below
    contains

    pure elemental function reverse (string) result(reversed)

        ! argument(s) for this <function>
        character(len=*) , intent(in) :: string

        ! return value of this <function>
        character(len= len_trim(string)) :: reversed

        ! variable(s) for this <function>
        character(len=1) :: buffer( len(reversed) )

        ! STEP.01
        ! Assign the target string to the buffer.
        buffer(:) = transfer( source= trim(string), mold= buffer(:) )

        ! STEP.04
        ! Reverse the target string.
        reversed = transfer( source= buffer(len(reversed):1:-1), mold= reversed )

    end function reverse

end module utility

module ABC049C

    ! <module>s to import
    use,     intrinsic :: iso_fortran_env
    use, non_intrinsic :: utility         , only: reverse

    ! require all variables to be explicitly declared
    implicit none

    ! accessibility of the <subroutine>s and <function>s in this <module>
    public  :: typ_task_data
    private :: solve_task
    public  :: answer_task
    public  :: load_data

    ! constant(s) for this <module>
    integer(INT32)                  , parameter , private :: len_str_max          = 10_INT32 ** 5_INT32
    integer(INT32)                  , parameter , private :: len_divisor_max      =  7_INT32
    integer(INT32)                  , parameter , private :: num_divisor          =  4_INT32
    character(len= len_divisor_max) , parameter , private :: divisor(num_divisor) = [ "dream  ", "dreamer", "erase  ", "eraser " ]

    ! <type>s for this <module>
    type typ_task_data
        character(len=len_str_max) , private :: string
    end type typ_task_data

    ! contained <subroutine>s and <function>s are below
    contains

    pure function solve_task (task_data, divisor) result(possibility)

        ! argument(s) for this <function>
        type(typ_task_data)             , intent(in) :: task_data
        character(len= len_divisor_max) , intent(in) :: divisor(num_divisor)

        ! return value of this <function>
        logical :: possibility

        ! STEP.01
        ! initialize the return value of this <function>
        possibility = .true.

    end function solve_task

    subroutine answer_task (unit, task_data)

        ! argument(s) for this <subroutine>
        integer             , intent(in) :: unit
        type(typ_task_data) , intent(in) :: task_data

        ! STEP.01
        ! Print the solution.
        if ( solve_task(task_data= task_data, divisor= reverse(divisor) ) ) then
            write(unit= unit, fmt='(A)', advance='yes') 'YES'
        else
            write(unit= unit, fmt='(A)', advance='yes') 'NO'
        end if

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
        read(unit= unit, fmt=*) task_data%string

        ! STEP.02
        ! Rever the read string.
        task_data%string = reverse(task_data%string)

        ! STEP.END
        return

    end subroutine load_data

end module ABC049C

program main

    ! <module>s to import
    use,     intrinsic :: iso_fortran_env
    use, non_intrinsic :: ABC049C         , only: typ_task_data
    use, non_intrinsic :: ABC049C         , only: answer_task
    use, non_intrinsic :: ABC049C         , only: load_data

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
