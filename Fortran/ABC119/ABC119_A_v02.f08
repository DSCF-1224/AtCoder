! AtCoder Beginner Contest 119 A
! [URL]      https://atcoder.jp/contests/abc119/tasks/abc119_a
! [compiler] fortran (gfortran v4.8.4)
! 
module ABC119

	! <module>s to import
	use, intrinsic :: iso_fortran_env


	! require all variables to be explicitly declared
	implicit none


	! accessibility of <subroutine>s and <function>s in this <module>
	public :: ABC119_A


	! constants for this <module>
	character(len=10, kind=1), parameter, private :: word_border = '2019/04/30'
	character(len= 6, kind=1), parameter, private :: word_before = 'Heisei'
	character(len= 3, kind=1), parameter, private :: word_after  = 'TBD'


	! contained <subroutine>s and <function>s are below
	contains


	subroutine ABC119_A

		! variables for this <subroutine>
		character( len=10, kind=1 ) :: buffer

		! STEP.01
		! read out the the date
		read( unit=INPUT_UNIT, fmt='(A)' ) buffer

		! STEP.02
		! output the result
		if( lle(string_a=buffer, string_b=word_border) ) then
			write( unit=OUTPUT_UNIT, fmt='(A)', advance='yes' ) word_before
		else
			write( unit=OUTPUT_UNIT, fmt='(A)', advance='yes' ) word_after
		end if

		! STEP.END
		return

	end subroutine ABC119_A

end module ABC119


program main

	! <module>s to import
	use, non_intrinsic :: ABC119

	! require all variables to be explicitly declared
	implicit none

	call ABC119_A

end program main
