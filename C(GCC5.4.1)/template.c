// contest  : ???
// task     : ?
// URL      : ???
// compiler : C (GCC 5.4.1)
// status   : NOT Submitted

#include <stdio.h>
#include <stdlib.h>

int main (void)
{
	// variables for `main`
	int N;
	int retval_scanf;

	// STEP.01
	// read out the given data
	retval_scanf = scanf("%d", &N);

	// STEP.02
	// calculate & output the points
	printf("%d\n", calculate_solution(N));

	// STEP.END
	return EXIT_SUCCESS;
}

/* EOF */
