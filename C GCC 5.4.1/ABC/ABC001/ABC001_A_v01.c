// AtCoder Beginner Contest 001 A
// [URL]      https://atcoder.jp/contests/abc001/tasks/abc001_1
// [compiler] C (GCC 5.4.1)
// 
#include <stdio.h>

int main (void)
{
	/* variables for main process */
	int height_1st;
	int height_2nd;

	// STEP.01
	// read the values of the height of snow
	scanf( "%d", &height_1st );
	scanf( "%d", &height_2nd );

	// STEP.02
	// output the change of the height of snow
	printf( "%d\n", height_1st - height_2nd );

	// STEP.TRUE_END
	return 0;
}
