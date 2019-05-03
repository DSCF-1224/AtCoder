! AtCoder Beginner Contest 003 A
! [URL]      https://atcoder.jp/contests/abc003/tasks/abc003_1
! [compiler] fortran (gfortran v4.8.4)
! 
program ABC003_A

	! <module>s to import
	use, intrinsic :: iso_fortran_env

	! require all variables to be explicitly declared
	implicit none

	! variables for this <program>
	integer( kind= INT32 ) :: num_tasks

	! STEP.01
	! read out the number of the tasks
	read( unit=INPUT_UNIT, fmt=* ) num_tasks

	! STEP.02
	! output the answer
	write( unit=OUTPUT_UNIT, fmt='(ES23.15e3)', advance='yes' ) calc_mean_allowance( num_tasks )


	! contained <subroutine>s and <function>s are below
	contains

	function calc_mean_allowance( num ) result( rtvl )

		! arguments for this <function>
		integer( kind= INT32 ), intent(in) :: num ! the number of the tasks

		! return value of this <function>
		real( kind= REAL64 ) :: rtvl

		! STEP.01
		rtvl = real( 10000_INT32*num*(num+1_INT32)/2, kind=REAL64 )/real( num, kind=REAL64 )

		! STEP.END
		return;

	end function calc_mean_allowance

end program ABC003_A
