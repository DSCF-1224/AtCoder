! AtCoder Beginner Contest 006 B
! [URL]      https://atcoder.jp/contests/abc006/tasks/abc006_2
! [compiler] fortran (gfortran v4.8.4)
! [reference]
! 
module ABC006

	! <module>s to import
	use, intrinsic :: iso_fortran_env


	! require all variables to be explicitly declared
	implicit none


	! accessibility of <subroutine>s and <function>s in this <module>
	public  :: ABC006_B
	private :: calc_mod_tribonacci


	! constants for this <module>
	integer( kind=INT32 ), parameter, private :: DIVISOR        =   10007
	integer( kind=INT32 ), parameter, private :: TERM_MAX       = 1000000
	integer( kind=INT32 ), parameter, private :: TRIBONACCI_1st =       0
	integer( kind=INT32 ), parameter, private :: TRIBONACCI_2nd =       0
	integer( kind=INT32 ), parameter, private :: TRIBONACCI_3rd =       1


	! contained <subroutine>s and <function>s are below
	contains


	subroutine ABC006_B

		! variables for this <subroutine>
		integer( kind=INT32 ) :: n

		! STEP.01
		! read out the target term to calculate
		read( unit=INPUT_UNIT, fmt=* ) n

		! STEP.02
		! output the result
		write( unit=OUTPUT_UNIT, fmt='(I0)', advance='yes' ) calc_mod_tribonacci(n)

		! STEP.END
		return

	end subroutine ABC006_B


	function calc_mod_tribonacci( term )

		! arguments for this <function>
		integer( kind=INT32 ) :: term

		! variables for this <function>
		integer( kind=INT32 ) :: buf(1:TERM_MAX)
		integer( kind=INT32 ) :: itr

		! return value of this <function>
		integer( kind=INT32 ) :: calc_mod_tribonacci

		! STEP.01
		! set the initial values of the tribonacci sequence
		buf(1) = TRIBONACCI_1st
		buf(2) = TRIBONACCI_2nd
		buf(3) = TRIBONACCI_3rd

		! STEP.02
		! calculate the target mod
		select case( term )
			case( 1:3 )

				! if the target term was one of the initial values
				calc_mod_tribonacci = buf(term)

			case default

				! if the target term was NOT one of the initial values
				do itr=4, term, 1
					buf(itr) = mod( buf(itr-1), DIVISOR ) + mod( buf(itr-2), DIVISOR ) + mod( buf(itr-3), DIVISOR )
				end do

				calc_mod_tribonacci = mod( buf(term), DIVISOR )

		end select

		! STEP.END
		return

	end function calc_mod_tribonacci

end module ABC006


program main

	! <module>s to import
	use, non_intrinsic :: ABC006

	! require all variables to be explicitly declared
	implicit none

	call ABC006_B

end program main
