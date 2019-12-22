// AtCoder Beginner Contest 001 C
// [URL]      https://atcoder.jp/contests/abc001/tasks/abc001_3
// [compiler] C (GCC 5.4.1)
// 
#include <stdio.h>
#include <math.h>

unsigned int calc_windscale( unsigned int wind_run )
{
	/* local variables for this function */
	unsigned int wind_speed_rounded;

	// STEP.01
	// convert the wind run to wind speed
	wind_speed_rounded = (unsigned int) round( wind_run/6.0e+00 );

	// STEP.END
	// determine the wind scale to output
	if      ( wind_speed_rounded <=   2 ) { return  0; }
	else if ( wind_speed_rounded <=  15 ) { return  1; }
	else if ( wind_speed_rounded <=  33 ) { return  2; }
	else if ( wind_speed_rounded <=  54 ) { return  3; }
	else if ( wind_speed_rounded <=  79 ) { return  4; }
	else if ( wind_speed_rounded <= 107 ) { return  5; }
	else if ( wind_speed_rounded <= 138 ) { return  6; }
	else if ( wind_speed_rounded <= 171 ) { return  7; }
	else if ( wind_speed_rounded <= 207 ) { return  8; }
	else if ( wind_speed_rounded <= 244 ) { return  9; }
	else if ( wind_speed_rounded <= 284 ) { return 10; }
	else if ( wind_speed_rounded <= 326 ) { return 11; }
	else                                  { return 12; };

}

char *calc_winddirection( unsigned int scale, unsigned int direction, const char **name )
{
	if ( scale == 0 ) { return (*name)[0]; }
	else              { return (*name)[1]; };
}

int main (void)
{
	/* constants for main process */
	const char name_wind_direction[][3] = { "N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW", "C" };

	/* variables for main process */
	unsigned int wind_direction;
	unsigned int wind_run;
	unsigned int wind_scale;

	// STEP.01
	// read the values of degree and dis
	scanf( "%d %d", &wind_direction, &wind_run );

	// STEP.02
	// determine the wind scale
	wind_scale = calc_windscale( wind_run );

	// STEP.03
	// output the result
	printf( "%s %d\n", calc_winddirection( wind_scale, wind_direction, name_wind_direction ), wind_scale );

	// STEP.TRUE_END
	return 0;
}
