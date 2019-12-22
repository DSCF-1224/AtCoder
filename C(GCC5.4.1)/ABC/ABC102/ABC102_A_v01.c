// contest  : ABC 102
// task     : A
// URL      : https://atcoder.jp/contests/abc102/tasks/abc102_a
// compiler : C (GCC 5.4.1)
// status   : https://atcoder.jp/contests/abc102/submissions/7300181 : AC

#include <stdio.h>
#include <stdlib.h>

unsigned int calculate_solution (unsigned int target)
{
	if (target % 2U == 0U) { return target;      }
	else                   { return target * 2U; }
}

int main (void)
{
	// variables for `main`
	unsigned int N;
	int          retval_scanf;

	// STEP.01
	// read out the given data
	retval_scanf = scanf("%d", &N);

	// STEP.02
	// calcualte & output the points
	printf("%d\n", calculate_solution(N));

	// STEP.END
	return EXIT_SUCCESS;
}

/* EOF */
