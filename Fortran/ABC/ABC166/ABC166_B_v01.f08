! contest  ABC 166
! task     B
! URL      https://atcoder.jp/contests/abc166/tasks/abc166_b
! compiler Fortran (GNU Fortran 9.2.1)
! status   https://atcoder.jp/contests/abc166/submissions/12749280 : WA

module ABC166

    ! <module>s to import
    use, intrinsic :: iso_fortran_env

    ! require all variables to be explicitly declared
    implicit none

    ! accessibility of <subroutine>s and <function>s in this <module>
    public :: read_data
    public :: solve_task_B


    ! <type>s for this <module>


    type type_task_B
        integer(INT32),              public :: num_people
        integer(INT32),              public :: num_kinds_snack
        logical,        allocatable, public :: status_snack(:,:)
    end type type_task_B


    ! contained <subroutine>s and <function>s are below
    contains
  

    subroutine read_data (obj_task_B)

        ! arguments for this <subroutine>
        type(type_task_B), intent(inout) :: obj_task_B

        ! variables for this <subroutine>
        integer(INT32)              :: itr_id, itr_snack
        integer(INT32)              :: bffr_num
        integer(INT32), allocatable :: bffr_id(:)


        read(unit= INPUT_UNIT, fmt= *) obj_task_B%num_people, obj_task_B%num_kinds_snack

        allocate( bffr_id(1:obj_task_B%num_kinds_snack) )
        allocate( obj_task_B%status_snack(1:obj_task_B%num_kinds_snack, 1:obj_task_B%num_people), mold= .false. )

        do itr_snack = 1_INT32, obj_task_B%num_kinds_snack, 1_INT32

            read(unit= INPUT_UNIT, fmt= *) bffr_num
            read(unit= INPUT_UNIT, fmt= *) bffr_id(1:bffr_num)

            do itr_id = 1_INT32, bffr_num, 1_INT32
                obj_task_B%status_snack( itr_snack, bffr_id(itr_id) ) = .true.
            end do

        end do

    end subroutine read_data


    subroutine solve_task_B (obj_task_B)

        ! arguments for this <subroutine>
        type(type_task_B), intent(in) :: obj_task_B

        ! variables for this <subroutine>
        integer(INT32) :: num_victims
        integer(INT32) :: itr_id, itr_snack
        logical        :: buffer_status_snack

        num_victims = obj_task_B%num_people


        loop_id: do itr_id    = 1_INT32, obj_task_B%num_people,      1_INT32
        loop_sk: do itr_snack = 1_INT32, obj_task_B%num_kinds_snack, 1_INT32
            if ( obj_task_B%status_snack(itr_snack, itr_id) ) then
                num_victims = num_victims - 1_INT32
                exit loop_sk
            end if
        end do loop_sk
        end do loop_id

        write(unit= OUTPUT_UNIT, fmt='(I0)') num_victims

    end subroutine solve_task_B

end module ABC166


program main

    ! <module>s to import
    use, non_intrinsic :: ABC166

    ! require all variables to be explicitly declared
    implicit none

    ! variables for this <program>
    type(type_task_B) :: obj_task_B


    call read_data(obj_task_B)
    call solve_task_B(obj_task_B)

end program main

! --- EOF --- !
