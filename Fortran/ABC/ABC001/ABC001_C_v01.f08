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
	integer( kind=INT16 )    :: wind_direction_int
	integer( kind=INT16 )    :: wind_run
	integer( kind=INT16 )    :: wind_scale
	character(len=3, kind=1) :: wind_direction_chr

	! STEP.01
	! read the values of degree and dis
	read *, wind_direction_int, wind_run

	! STEP.02
	! calculate the wind scale
	select case ( nint( real( wind_run, kind=REAL32 ) / 6.0e+00_REAL32, kind=INT16 ) )
		case (   0:  2 ); wind_scale =  0
		case (   3: 15 ); wind_scale =  1
		case (  16: 33 ); wind_scale =  2
		case (  34: 54 ); wind_scale =  3
		case (  55: 79 ); wind_scale =  4
		case (  80:107 ); wind_scale =  5
		case ( 108:138 ); wind_scale =  6
		case ( 139:171 ); wind_scale =  7
		case ( 172:207 ); wind_scale =  8
		case ( 208:244 ); wind_scale =  9
		case ( 245:284 ); wind_scale = 10
		case ( 285:326 ); wind_scale = 11
		case default;     wind_scale = 12
	end select

	! STEP.03
	! determine the wind direction and output it
	if ( wind_scale .eq. 0 ) then
		wind_direction_chr = 'C'
	else
		select case ( 10*wind_direction_int )
			case (  1125: 3374 ); wind_direction_chr = 'NNE'
			case (  3375: 5624 ); wind_direction_chr = 'NE'
			case (  5625: 7874 ); wind_direction_chr = 'ENE'
			case (  7875:10124 ); wind_direction_chr = 'E'
			case ( 10125:12374 ); wind_direction_chr = 'ESE'
			case ( 12375:14624 ); wind_direction_chr = 'SE'
			case ( 14625:16874 ); wind_direction_chr = 'SSE'
			case ( 16875:19124 ); wind_direction_chr = 'S'
			case ( 19125:21374 ); wind_direction_chr = 'SSW'
			case ( 21375:23624 ); wind_direction_chr = 'SW'
			case ( 23625:25874 ); wind_direction_chr = 'WSW'
			case ( 25875:28124 ); wind_direction_chr = 'W'
			case ( 28125:30374 ); wind_direction_chr = 'WNW'
			case ( 30375:32624 ); wind_direction_chr = 'NW'
			case ( 32625:34874 ); wind_direction_chr = 'NNW'
			case default;         wind_direction_chr = 'N'
		end select
	end if

	! STEP.03
	! write the visibility
	write( unit=*, fmt='(A,1X)', advance='no'  ) trim ( wind_direction_chr )
	write( unit=*, fmt='(I0)',   advance='yes' ) wind_scale

end program ABC001_C
