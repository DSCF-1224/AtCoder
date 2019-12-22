// [contest]  ABC 134
// [task]     B
// [URL]      https://atcoder.jp/contests/abc134/tasks/abc134_b
// [compiler] C (GCC 5.4.1)
// [status]   https://atcoder.jp/contests/abc134/submissions/6486033 : AC

#include <stdio.h>
#include <stdlib.h>

unsigned int calculate_num_monitor (const unsigned int* const num_tree_all, const unsigned int* const num_range)
{
	return (*num_tree_all + *num_range * 2U) / (*num_range * 2U + 1U);
}

int main (void)
{
	// variables for main process
	unsigned int N;
	unsigned int D;
	int          rtvl_scanf;

	// STEP.01
	// read out the given data
	rtvl_scanf = scanf("%d %d", &N, &D);

	// STEP.02
	// output the answer of this task
	printf("%d\n", calculate_num_monitor(&N, &D));

	// STEP.END
	return EXIT_SUCCESS;
}

/* EOF */
