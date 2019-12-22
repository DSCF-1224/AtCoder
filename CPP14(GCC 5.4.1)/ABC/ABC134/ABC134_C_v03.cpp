// [contest]  ABC 134
// [task]     C
// [URL]      https://atcoder.jp/contests/abc134/tasks/abc134_c
// [compiler] C++ 14 (GCC 5.4.1)
// [status]   https://atcoder.jp/contests/abc134/submissions/6511334 : AC

#include <iostream>

int main (void)
{
	// variables for main process
	register unsigned int maxloc_1st;
	register unsigned int maxval_1st;
	register unsigned int maxval_2nd;
	register unsigned int val_sequence;
	static   unsigned int len_sequence;

	// STEP.01
	// read out the given data
	// (the length of the given sequence)
	std::cin >> len_sequence;

	// STEP.02
	// initialize the variable to calculate the answer of this task
	maxval_1st = 0U;
	maxval_2nd = 0U;

	// STEP.03
	// read out the given data
	// (the values of the given sequence)
	// calculate the answer of this task
	for (register unsigned int itr = 0; itr < len_sequence; itr++)
	{
		// read out the given data
		std::cin >> val_sequence;

		// calculate the answer of this task
		if (maxval_1st < val_sequence)
		{
			maxval_2nd = maxval_1st;
			maxval_1st = val_sequence;
			maxloc_1st = itr;
		}
		else if (maxval_2nd < val_sequence)
		{ maxval_2nd = val_sequence; }
		else
		{ continue; }
	}

	// STEP.04
	// output the answer of this task
	for (register unsigned int itr = 0; itr < len_sequence; itr++)
	{
		if (itr == maxloc_1st) { std::cout << maxval_2nd << std::endl; }
		else                   { std::cout << maxval_1st << std::endl; }
	}

	// STEP.END
	return EXIT_SUCCESS;
}

/* EOF */
