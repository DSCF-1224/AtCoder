! [contest]  ABC 138
! [task]     D
! [URL]      https://atcoder.jp/contests/abc138/tasks/abc138_d
! [compiler] fortran (gfortran v4.8.4)
! [status]   NOT Submitted

module ABC138

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_D

  ! <type>s for this <module>
  type data_node
    integer(INT32),              public :: root
    integer(INT64), allocatable, public :: counter(:)
    logical,                     public :: is_updated
  end type data_node

  ! contained <subroutine>s and <function>s are below
  contains

  subroutine task_D

    ! variables for this <subroutine>
    integer(INT32) :: num_node
    integer(INT32) :: num_operation
    integer(INT32) :: node_root
    integer(INT32) :: node_branch
    integer(INT32) :: node_target
    integer(INT64) :: val_increment

    ! arrays for this <subroutine>
    type(data_node), dimension(:), allocatable :: given_tree

    ! support variables for this <subroutine>
    integer :: itr_op, itr_nd

    ! STEP.01
    ! read out the number of given ingredient
    read(unit=INPUT_UNIT, fmt=*) num_node, num_operation

    ! STEP.02
    ! allocate the array to store value of ingredients
    allocate( given_tree(1:num_node) )

    do itr_nd = 1, num_node, 1
      allocate( given_tree(itr_nd)%counter(1:num_operation) )
      print *, allocated( given_tree(itr_nd)%counter )
    end do

    ! STEP.03
    ! initialize & read out given data about the tree
    given_tree(1)%root       = 0_INT32

    do itr_nd = 2, num_node, 1
      read(unit=INPUT_UNIT, fmt=*) node_root, node_branch
      given_tree(node_branch)%root  = node_root
      given_tree(itr_nd)%counter(:) = 0_INT64
    end do

    ! STEP.04
    ! read out the data of each operation
    ! update the each counter of the node
    do itr_op = 1, num_operation, 1

      given_tree(:)%is_updated = .false.

      read(unit=INPUT_UNIT, fmt=*) node_target, val_increment
      print *, node_target, val_increment

      given_tree(node_target)%counter(itr_op) = given_tree(node_target)%counter(itr_op) + val_increment
      given_tree(node_target)%is_updated      = .true.

      do while( .not. all(given_tree(:)%is_updated, dim=1) )

        do itr_nd = 1, num_node, 1
          if ( given_tree(itr_nd)%is_updated .and. given_tree(itr_nd)%root .ne. 0_INT32 ) then
            given_tree( given_tree(itr_nd)%root )%is_updated = .true.
          else
            if ( given_tree( given_tree(itr_nd)%root )%is_updated ) then
              given_tree(itr_nd)%counter(itr_op) &!
                = given_tree(itr_nd)%counter(itr_op) &!
                + given_tree( given_tree(itr_nd)%root )%counter(itr_op)
              given_tree(itr_nd)%is_updated = .true.
            end if
          end if
        end do

      end do

      do itr_nd = 1, num_node, 1
        print *, given_tree(itr_nd)%counter(:)
      end do

    end do

    ! STEP.06
    ! output the answer of this task
    ! write(unit=OUTPUT_UNIT, fmt='(ES23.15e3)', advance='yes') value_maximum

    ! STEP.05
    ! deallocate the array to store the given data
    deallocate( given_tree )

    ! STEP.END
    return

  end subroutine task_D

end module ABC138


program main

  ! <module>s to import
  use, non_intrinsic :: ABC138

  ! require all variables to be explicitly declared
  implicit none

  call task_D

end program main
