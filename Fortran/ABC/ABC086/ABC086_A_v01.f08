! AtCoder Beginner Contest 086 A
! [URL]      https://atcoder.jp/contests/abc086/tasks/abc086_a
! [compiler] fortran (gfortran v4.8.4)
! 
module ABC086

	! <module>s to import
	use, intrinsic :: iso_fortran_env


	! require all variables to be explicitly declared
	implicit none


	! accessibility of <subroutine>s and <function>s in this <module>
	public  :: ABC086_A


	! contained <subroutine>s and <function>s are below
	contains


	subroutine ABC086_A

		! variables for this <subroutine>
		character( len=4, kind=1 ) :: stat
		integer( kind= INT32 )     :: a, b

		! STEP.01
		! read out the target positive integers
		read *, a, b

		! STEP.02
		! judge whether the product of `a` and `b` is even or odd
		if( mod( a*b, 2 ) .eq. 0 ) then
			stat = 'Even'
		else
			stat = 'Odd'
		end if

		! STEP.03
		! output the result
		write( unit=OUTPUT_UNIT, fmt='(A)', advance='yes' ) stat

		! STEP.END
		return

	end subroutine ABC086_A

end module ABC086


program main

	! <module>s to import
	use, non_intrinsic :: ABC086

	! require all variables to be explicitly declared
	implicit none

	call ABC086_A


end program main
