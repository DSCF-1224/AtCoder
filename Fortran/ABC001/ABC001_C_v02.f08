! AtCoder Beginner Contest 001 C
! [URL]      https://atcoder.jp/contests/abc001/tasks/abc001_3
! [compiler] fortran (gfortran v4.8.4)
! 
module ABC001

	! <module>s to import
	use, intrinsic :: iso_fortran_env

	! require all variables to be explicitly declared
	implicit none

	! parameters for this <module>
	integer( kind=INT16 ), parameter :: wind_direction_step = 2250

	! variables for this <module>
	integer( kind=INT16 )    :: wind_direction_val
	integer( kind=INT16 )    :: wind_run
	integer( kind=INT16 )    :: wind_force
	character(len=3, kind=1) :: wind_direction_str

	! contained <subroutine>s and <function>s are below
	contains

	subroutine ABC001_C

		! STEP.01
		! read the values of degree and dis
		read *, wind_direction_val, wind_run

		! STEP.02
		! calculate the wind force
		select case ( nint( real( wind_run, kind=REAL32 ) / 6.0e+00_REAL32, kind=INT16 ) )
			case (   0:  2 ); wind_force =  0
			case (   3: 15 ); wind_force =  1
			case (  16: 33 ); wind_force =  2
			case (  34: 54 ); wind_force =  3
			case (  55: 79 ); wind_force =  4
			case (  80:107 ); wind_force =  5
			case ( 108:138 ); wind_force =  6
			case ( 139:171 ); wind_force =  7
			case ( 172:207 ); wind_force =  8
			case ( 208:244 ); wind_force =  9
			case ( 245:284 ); wind_force = 10
			case ( 285:326 ); wind_force = 11
			case default;     wind_force = 12
		end select

		! STEP.03
		! determine the wind direction and output it
		if ( wind_force .eq. 0 ) then
			wind_direction_str = 'C'
		else
	
			! STEP.04
			! convert the value of wind direction into 0 to 15
			wind_direction_val = mod ( ( wind_direction_val * 10 + 1125 ) / 2250, 16 )
	
			! STEP.05
			! convert the value of wind direction into string
			select case ( wind_direction_val )
				case(  0 ); wind_direction_str = 'N'
				case(  1 ); wind_direction_str = 'NNE'
				case(  2 ); wind_direction_str = 'NE'
				case(  3 ); wind_direction_str = 'ENE'
				case(  4 ); wind_direction_str = 'E'
				case(  5 ); wind_direction_str = 'ESE'
				case(  6 ); wind_direction_str = 'SE'
				case(  7 ); wind_direction_str = 'SSE'
				case(  8 ); wind_direction_str = 'S'
				case(  9 ); wind_direction_str = 'SSW'
				case( 10 ); wind_direction_str = 'SW'
				case( 11 ); wind_direction_str = 'WSW'
				case( 12 ); wind_direction_str = 'W'
				case( 13 ); wind_direction_str = 'WNW'
				case( 14 ); wind_direction_str = 'NW'
				case( 15 ); wind_direction_str = 'NNW'
			end select
		end if
	
		! STEP.03
		! write the visibility
		write( unit=*, fmt='(A,1X)', advance='no'  ) trim ( wind_direction_str )
		write( unit=*, fmt='(I0)',   advance='yes' ) wind_force

		! STEP.TRUE_END
		return

	end subroutine ABC001_C

end module ABC001

program main

	! <module>s to import
	use, non_intrinsic :: ABC001

	call ABC001_C

end program main
