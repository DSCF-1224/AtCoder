! AtCoder Beginner Contest 001 B
! [URL]      https://atcoder.jp/contests/abc001/tasks/abc001_2
! [compiler] fortran (gfortran v4.8.4)
! 
program ABC001_B

	! <module>s to import
	use, intrinsic :: iso_fortran_env

	! require all variables to be explicitly declared
	implicit none

	! variables for this <program>
	integer( kind=INT32 ) :: visibility_inpt
	integer( kind=INT32 ) :: visibility_otpt

	! STEP.01
	! read the values of visibility [m]
	read *, visibility_inpt

	! STEP.02
	! calculate the visibility to output
	select case ( visibility_inpt )
		case (     0:   99 ); visibility_otpt = 0
		case (   100: 5000 ); visibility_otpt = visibility_inpt / 100
		case (  6000:30000 ); visibility_otpt = visibility_inpt / 1000 + 50
		case ( 35000:70000 ); visibility_otpt = ( visibility_inpt / 1000 - 30 ) / 5 + 80
		case default;         visibility_otpt = 89
	end select

	! STEP.03
	! write the visibility
	write( unit=*, fmt='(I2.2)', advance='yes' ) visibility_otpt

end program ABC001_B
