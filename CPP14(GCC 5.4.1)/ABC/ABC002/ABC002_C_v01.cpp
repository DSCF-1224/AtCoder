// contest  : ABC 002
// task     : B
// URL      : https://atcoder.jp/contests/abc002/tasks/abc002_3
// compiler : C (GCC 5.4.1)
// status   : https://atcoder.jp/contests/abc002/submissions/4392373 : WA
//          : https://atcoder.jp/contests/abc002/submissions/4392379 : WA
//          : https://atcoder.jp/contests/abc002/submissions/4392403 : WA
//          : https://atcoder.jp/contests/abc002/submissions/4392438 : WA
//          : https://atcoder.jp/contests/abc002/submissions/4393472 : WA
//          : https://atcoder.jp/contests/abc002/submissions/4393539 : WA

#include <cmath>
#include <ios>
#include <iostream>

double calc_area( int xa, int ya, int xb, int yb, int xc, int yc )
{
	return std::abs( (xb-xa)*(yc-ya)-(yb-ya)*(xc-xa) )*5.0e-01;
}

int main (void)
{
	/* variables for main process */
	int xa, ya, xb, yb, xc, yc;


	// STEP.01
	// read out the given data of coordinates
	std::cin >> xa >> ya >> xb >> yb >> xc >> yc;

	// STEP.02
	// output the result
	std::cout << std::scientific << calc_area( xa, ya, xb, yb, xc, yc ) << std::endl;

	// STEP.END
	return 0;
}
