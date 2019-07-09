// [contest]  ABC 133
// [task]     A
// [URL]      https://atcoder.jp/contests/abc133/tasks/abc133_a
// [compiler] C (GCC 5.4.1)
// [status]   https://atcoder.jp/contests/abc133/submissions/6316771 : AC

#include <stdio.h>

int min (a, b)
{
	if (a > b) { return b; }
	else       { return a; }
}

int calculate_cost (int num_traveler, int cost_train, int cost_taxi)
{
	return min(num_traveler * cost_train, cost_taxi);
}

int main (void)
{
	// variables for main process
	int N, A, B;
	int rtvl_scanf;

	// STEP.01
	// read out the given data
	rtvl_scanf = scanf("%d %d %d", &N, &A, &B);

	// STEP.02
	// output the answer of this task
	printf("%d\n", calculate_cost(N, A, B));

	// STEP.END
	return 0;
}

/* EOF */
