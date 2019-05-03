! AtCoder Beginner Contest 095 A
! [URL]      https://atcoder.jp/contests/abc095/tasks/abc095_a
! [compiler] fortran (gfortran v4.8.4)
! 
module ABC095

	! <module>s to import
	use, intrinsic :: iso_fortran_env


	! require all variables to be explicitly declared
	implicit none


	! accessibility of <subroutine>s and <function>s in this <module>
	public :: ABC095_A


	! constants for this <module>
	character(len=1, kind=1), parameter, private :: chr_added  = 'o'
	integer( kind=INT32 ),    parameter, private :: num_topped = 3
	integer( kind=INT32 ),    parameter, private :: val_base   = 700
	integer( kind=INT32 ),    parameter, private :: val_topped = 100


	! contained <subroutine>s and <function>s are below
	contains


	subroutine ABC095_A

		! variables for this <subroutine>
		character(len=num_topped, kind=1) :: buffer
		integer( kind=INT16 )             :: itr, val_total

		! STEP.01
		! read out the target positive integers
		read *, buffer

		! STEP.02
		! count the number of the `1`
		val_total = val_base

		do itr = 1, num_topped, 1
			if( ichar( buffer(itr:itr) ) .eq. ichar(chr_added) ) val_total = val_total+val_topped
		end do

		! STEP.03
		! output the result
		write( unit=OUTPUT_UNIT, fmt='(I0)', advance='yes' ) val_total

		! STEP.END
		return

	end subroutine ABC095_A

end module ABC095


program main

	! <module>s to import
	use, non_intrinsic :: ABC095

	! require all variables to be explicitly declared
	implicit none

	call ABC095_A

end program main
