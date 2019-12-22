// [contest]  ABC 134
// [task]     C
// [URL]      https://atcoder.jp/contests/abc134/tasks/abc134_c
// [compiler] C (GCC 5.4.1)
// [status]   https://atcoder.jp/contests/abc134/submissions/6517873 : AC

#include <stdio.h>
#include <stdlib.h>

int main (void)
{
	// variables for main process
	unsigned int maxloc_1st;
	unsigned int maxval_1st;
	unsigned int maxval_2nd;
	unsigned int len_sequence;
	unsigned int val_sequence;

	// support variables for main process
	register signed int rtvl;

	// STEP.01
	// read out the given data
	// (the length of the given sequence)
	rtvl = scanf("%d", &len_sequence);

	// STEP.02
	// initialize the variables to calculate the answer of this task
	maxval_1st = 0U;
	maxval_2nd = 0U;

	// STEP.03
	// calculate & output the answer of this task
	for (register unsigned int itr = 0; itr < len_sequence; itr++)
	{
		// STEP.03.01
		// read out the value of the given sequence
		rtvl = scanf("%d", &val_sequence);

		// STEP.03.02
		// update the maximum values of the given sequence
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
		if (itr == maxloc_1st) { printf("%d\n", maxval_2nd); }
		else                   { printf("%d\n", maxval_1st); }
	}

	// STEP.END
	return EXIT_SUCCESS;
}

/* EOF */
