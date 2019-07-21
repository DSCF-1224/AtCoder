// [contest]  ABC 134
// [task]     A
// [URL]      https://atcoder.jp/contests/abc134/tasks/abc134_a
// [compiler] C (GCC 5.4.1)
// [status]   https://atcoder.jp/contests/abc134/submissions/6482931 : AC

#include <stdio.h>
#include <stdlib.h>

unsigned short task_A (unsigned short radius)
{
	return (unsigned short)(3) * radius * radius;
}

int main (void)
{
	// variables for main process
	unsigned short r;
	int            rtvl_scanf;

	// STEP.01
	// read out the given data
	rtvl_scanf = scanf("%d", &r);

	// STEP.02
	// output the answer of this task
	printf("%d\n", task_A(r));

	// STEP.END
	return EXIT_SUCCESS;
}

/* EOF */
