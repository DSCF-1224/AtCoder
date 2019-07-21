// [contest]  ABC 134
// [task]     A
// [URL]      https://atcoder.jp/contests/abc134/tasks/abc134_a
// [compiler] C++ 14 (GCC 5.4.1)
// [status]   https://atcoder.jp/contests/abc134/submissions/6483910 : AC

#include <iostream>

unsigned short calculate_area (const unsigned short const radius)
{
	return (unsigned short)(3) * radius * radius;
}

int main (void)
{
	// variables for main process
	register unsigned short r;

	// STEP.01
	// read out the given data
	std::cin >> r;

	// STEP.02
	// output the answer of this task
	std::cout << calculate_area (r) << std::endl;

	// STEP.END
	return EXIT_SUCCESS;
}

/* EOF */
