// AtCoder Beginner Contest 002 C
// [URL]        https://atcoder.jp/contests/abc002/tasks/abc002_3
// [compiler]   C (GCC 5.4.1)
// [submission] https://atcoder.jp/contests/abc002/submissions/4611528 : AC

// [compile　error]
// ./Main.c: In function ‘main’:
// ./Main.c:24:2: warning: ignoring return value of ‘scanf’, declared with attribute warn_unused_result [-Wunused-result]
//   scanf ("%lf %lf %lf %lf %lf %lf", &xa, &ya, &xb, &yb, &xc, &yc);
//   ^

#include <stdio.h>
#include <math.h>

int main (void)
{
	/* variables for main process */
	double xa, ya;
	double xb, yb;
	double xc, yc;

	// STEP.01
	// read out the data of coordinates
	scanf ("%lf %lf %lf %lf %lf %lf", &xa, &ya, &xb, &yb, &xc, &yc);

	// STEP.02
	// calculate & output the area of the triangle
	printf("%lf\n", fabs ( (xb - xa) * (yc -ya) - (xc - xa) * (yb - ya) ) * 5.0e-01 );

	// STEP.TRUE_END
	return 0;
}