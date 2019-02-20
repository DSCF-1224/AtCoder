! AtCoder Beginner Contest 001 A
! [URL]      https://atcoder.jp/contests/abc001/tasks/abc001_1
! [compiler] fortran (gfortran v4.8.4)
! 
program ABC001_1

	! <module>s to import
	use, intrinsic :: iso_fortran_env

	! require all variables to be explicitly declared
	implicit none

	! variables for this <program>
	integer( kind=INT32 ) :: height_1st
	integer( kind=INT32 ) :: height_2nd

	! STEP.01
	! read the values of height of snow
	read *, height_1st
	read *, height_2nd

	! STEP.02
	! write the change of the height of snow
	write( unit=*, fmt='(I0)', advance='yes' ) height_1st - height_2nd

end program ABC001_1
