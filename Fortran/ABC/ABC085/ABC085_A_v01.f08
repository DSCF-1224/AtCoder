! AtCoder Beginner Contest 085 A
! [URL]      https://atcoder.jp/contests/abc085/tasks/abc085_a
! [compiler] fortran (gfortran v4.8.4)
! [reference]
! <1> https://atcoder.jp/contests/abc085/submissions/2485398
! 
module ABC085

	! <module>s to import
	use, intrinsic :: iso_fortran_env


	! require all variables to be explicitly declared
	implicit none


	! accessibility of <subroutine>s and <function>s in this <module>
	public :: ABC085_A


	! constants for this <module>
	integer( kind=INT32 ), parameter, private :: len_TargetString = 10


	! contained <subroutine>s and <function>s are below
	contains


	subroutine ABC085_A

		! variables for this <subroutine>
		character( len=len_TargetString, kind=1 ) :: buffer

		! STEP.01
		! read out the the date
		read( unit=INPUT_UNIT, fmt='(A)' ) buffer

		! STEP.02
		! output the result
		write( unit=OUTPUT_UNIT, fmt='(A10)', advance='yes' ) '2018' // buffer(5:10)

		! STEP.END
		return

	end subroutine ABC085_A

end module ABC085


program main

	! <module>s to import
	use, non_intrinsic :: ABC085

	! require all variables to be explicitly declared
	implicit none

	call ABC085_A

end program main
