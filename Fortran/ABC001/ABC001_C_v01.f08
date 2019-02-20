! AtCoder Beginner Contest 001 C
! [URL]      https://atcoder.jp/contests/abc001/tasks/abc001_3
! [compiler] fortran (gfortran v4.8.4)
! 
program ABC001_C

	! <module>s to import
	use, intrinsic :: iso_fortran_env

	! require all variables to be explicitly declared
	implicit none

	! variables for this <program>
	integer( kind=INT16 ) :: wind_direction
	integer( kind=INT16 ) :: wind_force
	integer( kind=INT16 ) :: wind_run

	! STEP.01
	! read the values of degree and dis
	read *, wind_direction, wind_run

	! STEP.02
	! calculate the wind force
	wind_force = nint( real( wind_run, kind=REAL32 ) / 6.0e+01_REAL32, kind=INT16 ) * 10

	! STEP.03
	! write the visibility
	write( unit=*, fmt='(I0)', advance='yes' ) wind_force

end program ABC001_C
