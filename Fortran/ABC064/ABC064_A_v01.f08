! AtCoder Beginner Contest 064 A
! [URL]      https://atcoder.jp/contests/abc064/tasks/abc064_a
! [compiler] fortran (gfortran v4.8.4)
! 
module ABC064

	! <module>s to import
	use, intrinsic :: iso_fortran_env


	! require all variables to be explicitly declared
	implicit none


	! accessibility of <subroutine>s and <function>s in this <module>
	public  :: ABC064_A


	! contained <subroutine>s and <function>s are below
	contains


	subroutine ABC064_A

		! variables for this <subroutine>
		character( len=3, kind=1 ) :: stat
		integer( kind= INT16 )     :: r, g, b, target

		! STEP.01
		! read out the target positive integers
		read *, r, g, b

		! STEP.02
		! judge whether the target integer is the multiplie of 4 or not
		if( mod( 10*((10*r)+g)+b, 4 ) .eq. 0 ) then
			stat = 'YES'
		else
			stat = 'NO'
		end if

		! STEP.03
		! output the result
		write( unit=OUTPUT_UNIT, fmt='(A)', advance='yes' ) trim( stat )

		! STEP.END
		return

	end subroutine ABC064_A

end module ABC064


program main

	! <module>s to import
	use, non_intrinsic :: ABC064

	! require all variables to be explicitly declared
	implicit none

	call ABC064_A


end program main
