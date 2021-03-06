! [contest]  ABC 081
! [task]     A
! [URL]      https://atcoder.jp/contests/abc081/tasks/abc081_a
! [compiler] fortran (gfortran v4.8.4)
! [status]   https://atcoder.jp/contests/abc081/submissions/4351450 : AC
! 
module ABC081

	! <module>s to import
	use, intrinsic :: iso_fortran_env


	! require all variables to be explicitly declared
	implicit none


	! accessibility of <subroutine>s and <function>s in this <module>
	public  :: ABC081_A


	! constants for this <module>
	integer( kind=INT32 ), parameter, private :: num_char = 3


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

		do itr = 1, num_char, 1
			if( ichar( buffer(itr:itr) ) .eq. ichar('1') ) count = count+1
		end do

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
