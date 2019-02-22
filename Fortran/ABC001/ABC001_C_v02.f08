! AtCoder Beginner Contest 001 C
! [URL]      https://atcoder.jp/contests/abc001/tasks/abc001_3
! [compiler] fortran (gfortran v4.8.4)
! 
module ABC001

	! <module>s to import
	use, intrinsic :: iso_fortran_env

	
	! require all variables to be explicitly declared
	implicit none


	! accessibility of <subroutine>s and <function>s in this <module>
	public  :: ABC001_C


	! constants for this <module>
	character(len=3, kind=1), parameter, private :: name_direction(-1:15) = [&!
		"C  ",                      &!
		"N  ", "NNE", "NE ", "ENE", &!
		"E  ", "ESE", "SE ", "SSE", &!
		"S  ", "SSW", "SW ", "WSW", &!
		"W  ", "WNW", "NW ", "NNW"  &!
	]

	integer( kind= INT32 ), parameter, private :: num_wind_scale = 12

	integer( kind=INT32 ), parameter, private :: wind_scale_range_upr(1:num_wind_scale) = [&!
		integer( kind=INT32 ) :: 2, 15, 33, 54, 79, 107, 138, 171, 207, 244, 284, 326 &!
	]

	! variables for this <module>
	character(len=3, kind=1) :: wind_direction_str
	integer( kind=INT32 )    :: wind_direction_int
	integer( kind=INT32 )    :: wind_run
	integer( kind=INT32 )    :: wind_speed
	integer( kind=INT32 )    :: wind_scale


	! contained <subroutine>s and <function>s are below
	contains

	subroutine ABC001_C

		! support variables for this <module>
		integer( kind=INT32 ) :: itr

		! STEP.01
		! read the values of degree and dis
		read *, wind_direction_int, wind_run

		! STEP.02
		! calculate the wind scale
		wind_speed = nint( real( wind_run, kind=REAL32 ) / 6.0e+00_REAL32, kind=INT32 )
		wind_scale = 0

		do itr = num_wind_scale, 1, -1
			if( wind_speed .gt. wind_scale_range_upr(itr) ) then
				wind_scale = itr; exit
			end if
		end do

		! STEP.03
		! determine the wind direction and output it
		if ( wind_scale .eq. 0 ) then
			wind_direction_str = name_direction(-1)
		else
			wind_direction_str = name_direction( mod ( ( wind_direction_int * 10 + 1125 ) / 2250, 16 ) )
		end if
	
		! STEP.03
		! write the visibility
		write( unit=*, fmt='(A,1X)', advance='no'  ) trim ( wind_direction_str )
		write( unit=*, fmt='(I0)',   advance='yes' ) wind_scale

		! STEP.TRUE_END
		return

	end subroutine ABC001_C

end module ABC001

program main

	! <module>s to import
	use, non_intrinsic :: ABC001

	call ABC001_C

end program main
