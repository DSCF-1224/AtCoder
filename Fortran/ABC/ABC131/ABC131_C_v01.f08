! [contest]  ABC 131
! [task]     C
! [URL]      https://atcoder.jp/contests/abc131/tasks/abc131_c
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc131/submissions/6076881 : AC

module ABC131

  ! <module>s to import
  use, intrinsic :: iso_fortran_env

  ! require all variables to be explicitly declared
  implicit none

  ! accessibility of <subroutine>s and <function>s in this <module>
  public  :: task_C
  private :: calculate_answer
  private :: calculate_gcd
  private :: calculate_lcm
  private :: calculate_num_multiples
  private :: calculate_num_multiples_between

  ! arrays for this <module>

  ! contained <subroutine>s and <function>s are below
  contains

  pure function calculate_answer (A, B, C, D) result(answer)

    ! arguments for this <function>
    integer(INT64), intent(in) :: A, B, C, D

    ! return value of this <function>
    integer(INT64) :: answer

    answer &!
    = (B - A + 1_INT64) &!
    - calculate_num_multiples_between (A, B, C) &!
    - calculate_num_multiples_between (A, B, D) &!
    + calculate_num_multiples_between (A, B, calculate_lcm(C, D))

    return

  end function calculate_answer

  pure function calculate_num_multiples (target_max, divisor) result(num_multiples)

    ! arguments for this <function>
    integer(INT64), intent(in) :: target_max
    integer(INT64), intent(in) :: divisor

    ! return value of this <function>
    integer(INT64) :: num_multiples

    num_multiples = (target_max - mod(target_max, divisor)) / divisor

  end function calculate_num_multiples

  pure function calculate_num_multiples_between (target_min, target_max, divisor) result(num_multiples)

    ! arguments for this <function>
    integer(INT64), intent(in) :: target_min
    integer(INT64), intent(in) :: target_max
    integer(INT64), intent(in) :: divisor

    ! return value of this <function>
    integer(INT64) :: num_multiples

    num_multiples &!
    = calculate_num_multiples (target_max, divisor) &!
    - calculate_num_multiples (target_min, divisor)

    if (mod(target_min, divisor) .eq. 0_INT64) num_multiples = num_multiples + 1_INT64

  end function calculate_num_multiples_between

  pure function calculate_gcd (n1, n2) result(gcd)

    ! arguments for this <function>
    integer(INT64), intent(in) :: n1, n2

    ! variables for this <function>
    integer(INT64) :: buf1, buf2, buf

    ! return value of this <function>
    integer(INT64) :: gcd

    buf1 = n1
    buf2 = n2

    do while (buf2 .ne. 0_INT64)
      buf  = mod(buf1, buf2)
      buf1 = buf2
      buf2 = buf
    end do

    gcd = buf1

  end function calculate_gcd

  pure function calculate_lcm (n1, n2) result(lcm)

    ! arguments for this <function>
    integer(INT64), intent(in) :: n1, n2

    ! return value of this <function>
    integer(INT64) :: lcm

    lcm = n1 * n2 / calculate_gcd(n1, n2)

  end function calculate_lcm

  subroutine task_C

    ! variables for this <subroutine>
    integer(INT64) :: A, B, C, D

    ! STEP.01
    ! read out the given data
    read(unit=INPUT_UNIT, fmt=*) A, B, C, D

    ! STEP.02
    ! calculate & output the answer
    write(unit=OUTPUT_UNIT, fmt='(I0)', advance='yes') calculate_answer (A, B, C, D)

    ! STEP.END
    return

  end subroutine task_C

end module ABC131


program main

  ! <module>s to import
  use, non_intrinsic :: ABC131

  ! require all variables to be explicitly declared
  implicit none

  call task_C

end program main
