! [contest]  ABC 142
! [task]     D
! [URL]      https://atcoder.jp/contests/abc142/tasks/abc142_c
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc142/submissions/7766816 : RE
!            https://atcoder.jp/contests/abc142/submissions/7768303 : RE
!            https://atcoder.jp/contests/abc142/submissions/7769265 : RE

module ABC142

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_D
  private :: gcd
  private :: info_num

  ! <type>s for this <module>
  type info_num
    logical, public :: is_cd
    logical, public :: is_prime
  end type

  ! contained <subroutine>s and <function>s are below
  contains

  pure function gcd (a, b) result (val_gcd)

    ! arguments for this <function>
    integer(INT64), intent(in) :: a, b

    ! variables for this <function>
    integer(INT64) :: buf_a, buf_b, buf

    ! return value of this <function>
    integer(INT64) :: val_gcd

    buf_a = a
    buf_b = b

    do while (buf_b .ne. 0_INT64)
      buf   = mod(buf_a, buf_b)
      buf_a = buf_b
      buf_b = buf
    end do

    val_gcd = buf_a

    return

  end function gcd

  subroutine task_D (A, B)

    ! arguments for this <subroutine>
    integer(INT64), intent(in) :: A, B

    ! variables for this <subroutine>
    integer(INT64) :: gcd_AB

    ! arrays for this <subroutine>
    type(info_num), allocatable :: list_candidates(:)

    ! support variables for this <subroutine>
    integer(INT64) :: itr_n
    integer(INT64) :: itr
    integer(INT64) :: size_target

    ! STEP.01
    ! calculate the greatest common divisor of A & B
    gcd_AB = gcd(A, B)

    ! STEP.02
    ! judge the greatest common divisor of A & B
    if (gcd_AB .eq. 1_INT64) then
      print '(I0)', 1_INT64
      return
    end if

    ! STEP.03
    ! allocate the array to store the given data
    allocate( list_candidates(2:gcd_AB) )

    ! STEP.04
    ! count up the number of the common divisors which are also prime numbers
    do itr_n = 2_INT64, gcd_AB, 1_INT64
      list_candidates(itr_n)%is_cd = (mod(A, itr_n) .eq. 0_INT64) .and. (mod(B, itr_n) .eq. 0_INT64)
    end do

    ! STEP.05
    ! judge whether the number is a prime number
    ! count up the numberr of the target common divisors
    size_target                       = 1_INT64
    list_candidates(2_INT64)%is_prime = .true.

    do itr_n = 3_INT64, gcd_AB, 1_INT64

      itr                             = 2_INT64
      list_candidates(itr_n)%is_prime = .true.

      do while (itr * itr .le. itr_n)

        if ( list_candidates(itr)%is_prime ) then
          if ( mod(itr_n, itr) .eq. 0_INT64 ) then
            list_candidates(itr_n)%is_prime = .false.
            exit
          else
          end if
        end if

        itr = itr + 1_INT64

      end do

      if ( list_candidates(itr_n)%is_cd .and. list_candidates(itr_n)%is_prime ) size_target = size_target + 1_INT64
      
    end do

    ! STEP.06
    ! output the answer of this task
    print '(I0)', size_target

    ! STEP.07
    ! deallocate the array to store the given data
    deallocate( list_candidates )

    ! STEP.END
    return

  end subroutine task_D

end module ABC142


program main

  ! <module>s to import
  use, non_intrinsic :: ABC142

  ! require all variables to be explicitly declared
  implicit none

  ! variables for this <program>
  integer(INT64) :: A, B

  ! STEP.01
  ! read out the given data
  read(unit=INPUT_UNIT, fmt=*) A, B

  ! STEP.02
  ! calculate & output the answer of this task
  call task_D (A, B)

end program main

! --- EOF --- !
