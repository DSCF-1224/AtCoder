/* AtCoder Beginner Contest 001 C */
/*

[URL]
https://atcoder.jp/contests/abc001/tasks/abc001_3

[compiler]
C++14 (GCC 5.4.1)

[reference]
<1> https://cpprefjp.github.io/reference/cmath/round.html

*/

#include <cmath>
#include <iostream>
#include <string>

// 風程(wind run)から風力(wind scale)を算出する
unsigned int calc_wind_scale( unsigned int wind_run )
{
	/* local variables for this function */
	unsigned int wind_speed;

	// STEP.01
	// convert the `wind run` to `wind speed`
	wind_speed = std::round( ((double)wind_run)/6.0e+00 );

	// STEP.02
	// determine the `wind scale` to output
	if      ( wind_speed <=   2 ) { return  0; }
	else if ( wind_speed <=  15 ) { return  1; }
	else if ( wind_speed <=  33 ) { return  2; }
	else if ( wind_speed <=  54 ) { return  3; }
	else if ( wind_speed <=  79 ) { return  4; }
	else if ( wind_speed <= 107 ) { return  5; }
	else if ( wind_speed <= 138 ) { return  6; }
	else if ( wind_speed <= 171 ) { return  7; }
	else if ( wind_speed <= 207 ) { return  8; }
	else if ( wind_speed <= 244 ) { return  9; }
	else if ( wind_speed <= 284 ) { return 10; }
	else if ( wind_speed <= 326 ) { return 11; }
	else                          { return 12; }
}

// 風力(wind scale)を考慮した風向（文字列）を返す
std::string determine_wind_direction( unsigned int wind_scale, unsigned int wind_direction_num )
{
	/* local variables for this function */
	unsigned int wind_direction_num_scaled;

	// STEP.01
	// scale the wind direction
	wind_direction_num_scaled = wind_direction_num * 10;

	// STEP.02
	// determine the `wind direction` to output
	if ( wind_scale == 0 ) { return "C"; }

	if ( wind_direction_num_scaled < 1125 ) { return "N"; }
	else
	{
		if      ( wind_direction_num_scaled <  3375 ) { return "NNE"; }
		else if ( wind_direction_num_scaled <  5625 ) { return "NE";  }
		else if ( wind_direction_num_scaled <  7875 ) { return "ENE"; }
		else if ( wind_direction_num_scaled < 10125 ) { return "E";   }
		else if ( wind_direction_num_scaled < 12375 ) { return "ESE"; }
		else if ( wind_direction_num_scaled < 14625 ) { return "SE";  }
		else if ( wind_direction_num_scaled < 16875 ) { return "SSE"; }
		else if ( wind_direction_num_scaled < 19125 ) { return "S";   }
		else if ( wind_direction_num_scaled < 21375 ) { return "SSW"; }
		else if ( wind_direction_num_scaled < 23625 ) { return "SW";  }
		else if ( wind_direction_num_scaled < 25875 ) { return "WSW"; }
		else if ( wind_direction_num_scaled < 28125 ) { return "W";   }
		else if ( wind_direction_num_scaled < 30375 ) { return "WNW"; }
		else if ( wind_direction_num_scaled < 32625 ) { return "NW";  }
		else if ( wind_direction_num_scaled < 34875 ) { return "NNW"; }
		else                                          { return "N";   }
	}
}

int main (void)
{
	/* constants for main process */
	
	/* variables for main process */
	char     wind_direction_chr;
	unsigned int wind_direction_num;
	unsigned int wind_run;
	unsigned int wind_scale;


	// STEP.01
	// read out the given data
	std::cin >> wind_direction_num; // 風向
	std::cin >> wind_run;           // 風程

	// STEP.02
	// calculate the `wind scale`
	wind_scale = calc_wind_scale( wind_run );

	// STEP.03
	// output the result
	std::cout << determine_wind_direction( wind_scale, wind_direction_num ) << " " << wind_scale << std::endl;

	// STEP.END
	return 0;
}
