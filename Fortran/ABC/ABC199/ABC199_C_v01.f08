! ==================================================================================================================================
! [contest]  ABC 199
! [task]     C
! [URL]      https://atcoder.jp/contests/abc199/tasks/abc199_c
! [compiler] Fortran (GNU Fortran 9.2.1)
! [status]   https://atcoder.jp/contests/abc199/submissions/22480862 : AC
! ==================================================================================================================================

module utility

    ! <module>s to import
    use, intrinsic :: iso_fortran_env

    ! require all variables to be explicitly declared
    implicit none

    ! accessibility of the <subroutine>s and <function>s in this <module>
    public  :: swap_char

    ! contained <subroutine>s and <function>s are below
    contains

    subroutine swap_char (string, index1, index2)

        ! argument(s) for this <subroutine>
        character(len=*) , intent(inout) :: string
        integer(INT32)   , intent(in   ) :: index1
        integer(INT32)   , intent(in   ) :: index2

        ! variable(s) for this <subroutine>
        character(len=1) :: buffer

        buffer                  = string( index1:index1 )
        string( index1:index1 ) = string( index2:index2 )
        string( index2:index2 ) = buffer

        return

    end subroutine swap_char

end module utility

module ABC199C

    ! <module>s to import
    use,     intrinsic :: iso_fortran_env
    use, non_intrinsic :: utility         , only: swap_char

    ! require all variables to be explicitly declared
    implicit none

    ! accessibility of the <subroutine>s and <function>s in this <module>
    private :: typ_query
    private :: typ_query_index
    private :: fix_index
    public  :: typ_task_data
    public  :: answer_task
    private :: apply_query
    public  :: load_data
    private :: solve_task
    private :: swap_each_half

    ! <type>s for this <module>
    type typ_query_index
        integer(INT32) , private :: A
        integer(INT32) , private :: B
    end type typ_query_index

    type typ_query
        integer(INT32)        , private :: type
        type(typ_query_index) , private :: index
    end type typ_query

    type typ_task_data
        integer(INT32)   , private               :: len_string_half
        integer(INT32)   , private               :: len_string
        integer(INT32)   , private               :: num_query
        character(len=:) , private , allocatable :: string
        type(typ_query)  , private , allocatable :: query(:)
    end type typ_task_data

    ! constant(s) for this <module>
    integer(INT32) , parameter , private :: len_string_max_half = 2_INT32 * 10_INT32 ** 5_INT32
    integer(INT32) , parameter , private :: len_string_max      = 2_INT32 * len_string_max_half

    ! contained <subroutine>s and <function>s are below
    contains

    pure function fix_index (index, length_half)

        ! argument(s) for this <function>
        integer(INT32) , intent(in) :: index
        integer(INT32) , intent(in) :: length_half

        ! return value of this <function>
        integer(INT32) :: fix_index

        select case (length_half - index)
            case(0_INT32:) ; fix_index = index + length_half
            case default   ; fix_index = index - length_half
        end select

    end function fix_index

    subroutine answer_task (unit, task_data)

        ! argument(s) for this <subroutine>
        integer             , intent(in   ) :: unit
        type(typ_task_data) , intent(inout) :: task_data

        ! STEP.01
        ! Calcualte the solution of this task.
        call solve_task(task_data)

        ! STEP.02
        ! Print the solution of this task.
        write(unit= unit, fmt='(A)', advance='yes') task_data%string

        ! STEP.END
        return

    end subroutine answer_task

    subroutine apply_query (string, length_half, query, stat)

        ! argument(s) for this <subroutine>
        character(len=*) , intent(inout) :: string
        integer(INT32)   , intent(in   ) :: length_half
        type(typ_query)  , intent(in   ) :: query
        logical          , intent(inout) :: stat

        ! variable(s) for this <subroutine>
        type(typ_query_index) :: index_fixed

        select case ( query%type )
            case(1_INT32)

                ! STEP.01
                ! Fix the given index to swap if it was required.
                if ( stat ) then
                    index_fixed%A = fix_index(index= query%index%A, length_half= length_half)
                    index_fixed%B = fix_index(index= query%index%B, length_half= length_half)
                else
                    index_fixed = query%index
                end if
                
                ! STEP.02
                ! Apply the query using fixed one.
                call swap_char( string= string, index1= index_fixed%A, index2= index_fixed%B )

            case(2_INT32)
                stat = .not. stat
        end select

        return

    end subroutine apply_query

    subroutine load_data (unit, task_data)

        ! argument(s) for this <subroutine>
        integer             , intent(in   ) :: unit
        type(typ_task_data) , intent(inout) :: task_data

        ! support variable(s) for this <subroutine>
        integer(INT32) :: iter_query

        ! STEP.01
        ! Read the length of the given sequence
        read(unit= unit, fmt=*) task_data%len_string_half
        task_data%len_string = task_data%len_string_half * 2_INT32

        ! STEP.02
        ! Allocate the member string to store the given one.
        allocate( character(len= task_data%len_string) :: task_data%string )

        ! STEP.03
        ! Read the given string
        read(unit= unit, fmt='(A)') task_data%string

        ! STEP.03
        ! Read the number of queries.
        read(unit= unit, fmt=*) task_data%num_query

        ! STEP.04
        ! Allocate the member array to store the given queries
        allocate( task_data%query( task_data%num_query ) )

        ! STEP.05
        ! Read the given queries.
        do iter_query = 1_INT32 , task_data%num_query , 1_INT32
            read(unit= unit, fmt=*)                   &!
                task_data%query(iter_query)%type    , &!
                task_data%query(iter_query)%index%A , &!
                task_data%query(iter_query)%index%B
        end do

        ! STEP.END
        return

    end subroutine load_data

    subroutine solve_task (task_data)

        ! argument(s) for this <subroutine>
        type(typ_task_data) , intent(inout) :: task_data
        
        ! variable(s) for this <subroutine>
        logical        :: stat_exchange
        integer(INT32) :: iter_query

        ! variable(s) for this <subroutine>
        character(len= task_data%len_string_half) :: buffer

        ! STEP.01
        ! Initialize the variables for this <subroutine>
        stat_exchange = .false.

        ! STEP.02
        ! Apply the given query to the given string.
        do iter_query = 1_INT32 , task_data%num_query , 1_INT32
            call apply_query (&!
                string      = task_data%string            , &!
                length_half = task_data%len_string_half   , &!
                query       = task_data%query(iter_query) , &!
                stat        = stat_exchange                 &!
            )
        end do

        ! STEP.03
        ! Apply the type-2 query if it is required.
        if ( stat_exchange ) then
            call swap_each_half(string= task_data%string, length= task_data%len_string)
        end if

        ! STEP.END
        return

    end subroutine solve_task

    subroutine swap_each_half (string, length)

        ! argument(s) for this <subroutine>
        character(len=*) , intent(inout) :: string
        integer(INT32)   , intent(in   ) :: length

        ! variable(s) for this <subroutine>
        character(len= length / 2_INT32) :: buffer
        integer(INT32)                   :: index_former_lst
        integer(INT32)                   :: index_latter_fst

        index_former_lst = length / 2_INT32
        index_latter_fst = index_former_lst + 1_INT32

        buffer(               1:index_former_lst) = string(               1:index_former_lst)
        string(               1:index_former_lst) = string(index_latter_fst:length          )
        string(index_latter_fst:length          ) = buffer(               1:index_former_lst)

        return

    end subroutine swap_each_half

end module ABC199C

program main

    ! <module>s to import
    use,     intrinsic :: iso_fortran_env
    use, non_intrinsic :: ABC199C         , only: typ_task_data
    use, non_intrinsic :: ABC199C         , only: answer_task
    use, non_intrinsic :: ABC199C         , only: load_data

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
