! AtCoder Beginner Contest 001 A
! [URL]      https://atcoder.jp/contests/abc002/tasks/abc002_1
! [compiler] fortran (gfortran v4.8.4)
! 
program ABC001_A

	! <module>s to import
	use, intrinsic :: iso_fortran_env

	! require all variables to be explicitly declared
	implicit none

	! variables for this <program>
	integer( kind=INT32 ) :: A, B

	! STEP.01
	! read the target data
	read *, A, B

	! STEP.02
	! output the bigger one
	write( unit=*, fmt='(I0)', advance='yes' ) max( A, B )

end program ABC001_A
