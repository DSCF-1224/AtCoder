// AtCoder Beginner Contest 003 A
// [URL]        https://atcoder.jp/contests/abc003/tasks/abc003_1
// [compiler]   C (GCC 5.4.1)
// [submission] https://atcoder.jp/contests/abc003/submissions/4618390 : AC

#include <stdio.h>

int calc_salary (int num_tasks)
{
	return 5000 * (num_tasks + 1); // ( num_tasks * (num_tasks + 1) / 2 ) / num_tasks * 10000
}

int main (void)
{
	/* variables for main process */
	int num_tasks;

	/* support variables for main process */
	int rtvl_scanf;

	// STEP.01
	// read out the target integers
	rtvl_scanf = scanf ("%d", &num_tasks);

	// STEP.02
	// calculate & output the salary
	printf ("%d\n", calc_salary (num_tasks));

	// STEP.TRUE_END
	return 0;
}
