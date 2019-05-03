! AtCoder Beginner Contest 006 A
! [URL]      https://atcoder.jp/contests/abc006/tasks/abc006_1
! [compiler] fortran (gfortran v4.8.4)
! [reference]
! 
module ABC006

	! <module>s to import
	use, intrinsic :: iso_fortran_env


	! require all variables to be explicitly declared
	implicit none


	! accessibility of <subroutine>s and <function>s in this <module>
	public  :: ABC006_A
	private :: write_stat


	! contained <subroutine>s and <function>s are below
	contains


	subroutine ABC006_A

		! variables for this <subroutine>
		integer( kind=INT32 ) :: N

		! STEP.01
		! read out the target term to calculate
		read( unit=INPUT_UNIT, fmt=* ) N

		! STEP.02
		! output the result
		if( mod(N,3) .eq. 0 ) then
			call write_stat( 'YES' )
		else
			call write_stat( 'NO' )
		end if

		! STEP.END
		return

	end subroutine ABC006_A


	subroutine write_stat( stat )

		! arguments for this <subroutine>
		character(len=*, kind=1), intent(in) :: stat

		! STEP.01
		write( unit=OUTPUT_UNIT, fmt='(A)', advance='yes' ) stat

		! STEP.END
		return

	end subroutine write_stat

end module ABC006


program main

	! <module>s to import
	use, non_intrinsic :: ABC006

	! require all variables to be explicitly declared
	implicit none

	call ABC006_A

end program main
