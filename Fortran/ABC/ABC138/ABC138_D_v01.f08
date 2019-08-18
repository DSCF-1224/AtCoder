! [contest]  ABC 138
! [task]     D
! [URL]      https://atcoder.jp/contests/abc138/tasks/abc138_d
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc138/submissions/7016725 : RE
!            https://atcoder.jp/contests/abc138/submissions/7016748 : TLE

module ABC138

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public :: task_D

  ! <type>s for this <module>
  type data_count
    integer(INT64), public :: total
    integer(INT64), public :: turn
  end type data_count
  type data_node
    integer(INT32),   public :: root
    logical,          public :: is_updated
    type(data_count), public :: count
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

    ! STEP.03
    ! initialize & read out given data about the tree
    given_tree(1)%root        = 0_INT32
    given_tree(:)%count%total = 0_INT64

    do itr_nd = 2, num_node, 1
      read(unit=INPUT_UNIT, fmt=*) node_root, node_branch
      given_tree(node_branch)%root = node_root
    end do

    ! STEP.04
    ! read out the data of each operation
    ! update the each count of the node
    do itr_op = 1, num_operation, 1

      given_tree(:)%is_updated = .false.
      given_tree(:)%count%turn = 0_INT64

      read(unit=INPUT_UNIT, fmt=*) node_target, val_increment
      ! print *, node_target, val_increment

      given_tree(node_target)%count%turn = val_increment
      given_tree(node_target)%is_updated = .true.

      do while( .not. all(given_tree(:)%is_updated, dim=1) )

        do itr_nd = 1, num_node, 1

          if ( given_tree(itr_nd)%root .ne. 0_INT32 ) then
            if ( given_tree(itr_nd)%is_updated ) then
              given_tree( given_tree(itr_nd)%root )%count%turn = 0_INT64
              given_tree( given_tree(itr_nd)%root )%is_updated = .true.
            else
              if ( given_tree( given_tree(itr_nd)%root )%is_updated ) then
                given_tree(itr_nd)%count%turn = given_tree(itr_nd)%count%turn + given_tree( given_tree(itr_nd)%root )%count%turn
                given_tree(itr_nd)%is_updated = .true.
              end if
            end if
          end if

        end do

      end do

      given_tree(:)%count%total = given_tree(:)%count%total + given_tree(:)%count%turn

      ! do itr_nd = 1, num_node, 1
      !   print '(I2,1X,L1,2I6)', itr_nd, given_tree(itr_nd)%is_updated, given_tree(itr_nd)%count%turn, given_tree(itr_nd)%count%total
      ! end do

    end do

    ! STEP.06
    ! output the answer of this task
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='no') given_tree(1)%count%total

    do itr_nd = 2, num_node - 1, 1
      write(unit=OUTPUT_UNIT, fmt='(1X,I0)', advance='no') given_tree(itr_nd)%count%total
    end do

    write(unit=OUTPUT_UNIT, fmt='(1X,I0)', advance='yes') given_tree(num_node)%count%total

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
