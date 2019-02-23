! AtCoder Beginner Contest 082 A
! [URL]      https://atcoder.jp/contests/abc082/tasks/abc082_a
! [compiler] fortran (gfortran v4.8.4)
! 
module ABC082

	! <module>s to import
	use, intrinsic :: iso_fortran_env


	! require all variables to be explicitly declared
	implicit none


	! accessibility of <subroutine>s and <function>s in this <module>
	public  :: ABC082_A


	! contained <subroutine>s and <function>s are below
	contains


	subroutine ABC082_A

		! variables for this <subroutine>
		integer( kind= INT16 ) :: a, b

		! STEP.01
		! read out the target positive integers
		read *, a, b

		! STEP.02
		! output the result
		write( unit=OUTPUT_UNIT, fmt='(I0)', advance='yes' ) (a+b)/2 + mod( a+b, 2 )

		! STEP.END
		return

	end subroutine ABC082_A

end module ABC082


program main

	! <module>s to import
	use, non_intrinsic :: ABC082

	! require all variables to be explicitly declared
	implicit none

	call ABC082_A


end program main
