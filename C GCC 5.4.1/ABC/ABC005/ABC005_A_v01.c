// [contest]    AtCoder Beginner Contest 005
// [task]       A
// [URL]        https://atcoder.jp/contests/abc005/tasks/abc005_1
// [compiler]   C (GCC 5.4.1)
// [submission] https://atcoder.jp/contests/abc005/submissions/4652426 : AC

#include <stdio.h>

int main (void)
{
	/* variables for main process */
	int x, y;

	// STEP.01
	// read out the data
	int rtvl_scanf = scanf ("%d %d", &x, &y);

	// STEP.02
	// compute & output the result
	printf ("%d\n", y / x);

	// STEP.END
	return 0;
}
