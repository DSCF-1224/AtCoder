! AtCoder Beginner Contest 001 A
! [URL]      https://atcoder.jp/contests/abc002/tasks/abc002_1
! [compiler] fortran (gfortran v4.8.4)
! 
program ABC001_B

	! <module>s to import
	use, intrinsic :: iso_fortran_env

	! require all variables to be explicitly declared
	implicit none

	! variables for this <program>
	character( len=30, kind=1 ) :: data
	integer( kind=INT16 )       :: length_data

	! support variables for this <program>
	integer( kind=INT16 ) :: itr

	! STEP.01
	! read the target data
	read *, data

	! STEP.02
	! get the length of the data string
	length_data = len_trim( data )

	! output the bigger one
	do itr = 1, length_data, 1
	end do

end program ABC001_B
