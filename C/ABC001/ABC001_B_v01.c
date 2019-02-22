// AtCoder Beginner Contest 001 B
// [URL]      https://atcoder.jp/contests/abc001/tasks/abc001_2
// [compiler] C (GCC 5.4.1)
// 
#include <stdio.h>

int main (void)
{
	/* variables for main process */
	int visibility_inpt;
	int visibility_otpt;

	// STEP.01
	// read the values of visibility [m]
	scanf( "%d", &visibility_inpt );

	// STEP.02
	// calculate the visibility and output it
	if      (     0 <= visibility_inpt && visibility_inpt <    100 ) { printf( "%2.2d\n", 0 ); }
	else if (   100 <= visibility_inpt && visibility_inpt <=  5000 ) { printf( "%2.2d\n", visibility_inpt / 100 ); }
	else if (  6000 <= visibility_inpt && visibility_inpt <= 30000 ) { printf( "%2.2d\n", visibility_inpt / 1000 + 50 ); }
	else if ( 35000 <= visibility_inpt && visibility_inpt <= 70000 ) { printf( "%2.2d\n", ( visibility_inpt / 1000 -30 ) / 5 + 80 ); }
	else                                                             { printf( "%2.2d\n", 89 ); };

	// STEP.TRUE_END
	return 0;
}
