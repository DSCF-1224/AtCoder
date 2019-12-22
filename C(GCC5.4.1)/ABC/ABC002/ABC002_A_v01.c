// AtCoder Beginner Contest 002 A
// [URL]        https://atcoder.jp/contests/abc002/tasks/abc002_1
// [compiler]   C (GCC 5.4.1)
// [submission] https://atcoder.jp/contests/abc002/submissions/4599210 : AC

#include <stdio.h>

int main (void)
{
	/* variables for main process */
	int X, Y;

	// STEP.01
	// read out the target integers
	scanf ("%d %d", &X, &Y);

	// STEP.02
	// output the bigger integer
	if (X > Y) { printf("%d\n", X); }
	else       { printf("%d\n", Y); }

	// STEP.TRUE_END
	return 0;
}