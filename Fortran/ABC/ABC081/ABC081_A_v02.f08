! AtCoder Beginner Contest 081 A
! [URL]      https://atcoder.jp/contests/abc081/tasks/abc081_a
! [compiler] fortran (gfortran v4.8.4)
! 
module ABC081

	! <module>s to import
	use, intrinsic :: iso_fortran_env


	! require all variables to be explicitly declared
	implicit none


	! accessibility of <subroutine>s and <function>s in this <module>
	public  :: ABC081_A


	! constants for this <module>
	character(len=1, kind=1), parameter, private :: chr_target = '1'
	integer( kind=INT32 ),    parameter, private :: num_char   = 3


	! contained <subroutine>s and <function>s are below
	contains


	subroutine ABC081_A

		! variables for this <subroutine>
		character(len=num_char, kind=1) :: buffer
		integer( kind=INT16 )           :: itr, count

		! STEP.01
		! read out the target positive integers
		read *, buffer

		! STEP.02
		! count the number of the `1`
		count = 0

		if( ichar( buffer(1:1) ) .eq. ichar( chr_target ) ) count = count+1
		if( ichar( buffer(2:2) ) .eq. ichar( chr_target ) ) count = count+1
		if( ichar( buffer(3:3) ) .eq. ichar( chr_target ) ) count = count+1

		! STEP.03
		! output the result
		write( unit=OUTPUT_UNIT, fmt='(I0)', advance='yes' ) count

		! STEP.END
		return

	end subroutine ABC081_A

end module ABC081


program main

	! <module>s to import
	use, non_intrinsic :: ABC081

	! require all variables to be explicitly declared
	implicit none

	call ABC081_A

end program main
