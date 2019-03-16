// AtCoder Beginner Contest 002 A
// [URL]        https://atcoder.jp/contests/abc002/tasks/abc002_1
// [compiler]   C (GCC 5.4.1)
// [submission] https://atcoder.jp/contests/abc002/submissions/4600191 : AC

#include <stdio.h>

int max (int X, int Y)
{
	if (X > Y) { return X; }
	else       { return Y; }
}

int main (void)
{
	/* variables for main process */
	int X, Y, buf_rtvl_int;

	// STEP.01
	// read out the target integers
	buf_rtvl_int = scanf ("%d %d", &X, &Y);

	// STEP.02
	// output the bigger integer
	printf("%d\n", max(X, Y));

	// STEP.TRUE_END
	return 0;
}
