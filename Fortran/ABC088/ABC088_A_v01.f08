! AtCoder Beginner Contest 088 A
! [URL]      https://atcoder.jp/contests/abc088/tasks/abc088_a
! [compiler] fortran (gfortran v4.8.4)
! 
module ABC088

	! <module>s to import
	use, intrinsic :: iso_fortran_env


	! require all variables to be explicitly declared
	implicit none


	! accessibility of <subroutine>s and <function>s in this <module>
	public  :: ABC088_A


	! contained <subroutine>s and <function>s are below
	contains


	subroutine ABC088_A

		! variables for this <subroutine>
		character( len=3, kind=1 ) :: stat
		integer( kind= INT16 )     :: N, A

		! STEP.01
		! read out the target positive integers
		read *, N
		read *, A

		! STEP.02
		! judge whether the target integer is the multiplie of 4 or not
		if( mod( N, 500 ) .le. A ) then
			stat = 'Yes'
		else
			stat = 'No'
		end if

		! STEP.03
		! output the result
		write( unit=OUTPUT_UNIT, fmt='(A)', advance='yes' ) trim( stat )

		! STEP.END
		return

	end subroutine ABC088_A

end module ABC088


program main

	! <module>s to import
	use, non_intrinsic :: ABC088

	! require all variables to be explicitly declared
	implicit none

	call ABC088_A


end program main
