! contest  ABC 166
! task     B
! URL      https://atcoder.jp/contests/abc166/tasks/abc166_b
! compiler Fortran (GNU Fortran 9.2.1)
! status   https://atcoder.jp/contests/abc166/submissions/12765035 : AC

program main

    ! <module>s to import
    use, intrinsic :: iso_fortran_env

    ! require all variables to be explicitly declared
    implicit none


    ! <type>s for this <program>
    type type_observatory
        logical,        public:: connected
        integer(INT32) ,public:: height
    end type type_observatory

    type type_road
        integer(INT32), public :: start
        integer(INT32), public :: goal
    end type type_road

    ! variables for this <program>
    integer(INT32)               :: num_observatory_total
    integer(INT32)               :: num_observatory_good
    integer(INT32)               :: num_road
    integer(INT32),  allocatable :: data_observatory(:)
    type(type_road), allocatable :: data_road(:)

    ! support variables for this <program>
    integer(INT32) :: itr_road, itr_obs


    read(unit= INPUT_UNIT, fmt= *) num_observatory_total, num_road

    allocate( data_observatory(1:num_observatory_total) )
    allocate( data_road       (1:num_road             ) )

    read(unit= INPUT_UNIT, fmt=*) data_observatory%height(:)
    data_observatory(:)%connected = .false.

    do itr_road = 1_INT32, num_road, 1_INT32
        read(unit= INPUT_UNIT, fmt= *) data_road(itr_road)%start, data_road(itr_road)%goal
        data_observatory(data_road(itr_road)%start)%connected = .true.
        data_observatory(data_road(itr_road)%goal )%connected = .true.
    end do

    do itr_obs = 1_INT32, num_observatory_total, 1_INT32
        print *, data_observatory(itr_obs)
    end do

    num_victims = num_people

    write(unit= OUTPUT_UNIT, fmt='(I0)') num_observatory_good

end program main

! --- EOF --- !
