// [contest]  ABC 134
// [task]     B
// [URL]      https://atcoder.jp/contests/abc134/tasks/abc134_b
// [compiler] C++ 14 (GCC 5.4.1)
// [status]   https://atcoder.jp/contests/abc134/submissions/6486074 : AC

#include <iostream>

unsigned int calculate_num_monitor (const unsigned int* num_tree_all, const unsigned int* num_range)
{
	return (*num_tree_all + *num_range * 2U) / (*num_range * 2U + 1U);
}

int main (void)
{
	// variables for main process
	register unsigned int N;
	register unsigned int D;

	// STEP.01
	// read out the given data
	std::cin >> N >> D;

	// STEP.02
	// output the answer of this task
	std::cout << calculate_num_monitor (&N, &D) << std::endl;

	// STEP.END
	return EXIT_SUCCESS;
}

/* EOF */
