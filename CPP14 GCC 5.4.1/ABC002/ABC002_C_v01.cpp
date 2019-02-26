/* AtCoder Beginner Contest 002 C */
/*

[URL]
https://atcoder.jp/contests/abc001/tasks/abc002_3

[compiler]
C++14 (GCC 5.4.1)

[reference]
<1> https://cpprefjp.github.io/reference/cmath/abs.html

*/

#include <cmath>
#include <ios>
#include <iostream>

double calc_area( double xa, double ya, double xb, double yb, double xc, double yc )
{
	return std::abs( (xb-xa)*(yc-ya)-(yb-ya)*(xc-xa) )/2.0e+00;
}

int main (void)
{
	/* variables for main process */
	double xa, ya, xb, yb, xc, yc;


	// STEP.01
	// read out the given data of coordinates
	std::cin >> xa >> ya >> xb >> yb >> xc >> yc;

	// STEP.02
	// output the result
	std::cout << std::scientific << calc_area( xa, ya, xb, yb, xc, yc ) << std::endl;

	// STEP.END
	return 0;
}
