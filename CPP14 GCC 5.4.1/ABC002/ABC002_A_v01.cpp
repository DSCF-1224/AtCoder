/* AtCoder Beginner Contest 002 A */
/*

[URL]
https://atcoder.jp/contests/abc001/tasks/abc002_1

[compiler]
C++14 (GCC 5.4.1)

[reference]

*/

#include <algorithm>
#include <iostream>

int main (void)
{
	/* variables for main process */
	unsigned int X, Y;


	// STEP.01
	// read out the given data
	std::cin >> X >> Y;

	// STEP.02
	// output the result
	std::cout << std::max(X, Y) << std::endl;

	// STEP.END
	return 0;
}
