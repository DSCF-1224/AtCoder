// contest  : ABC 081
// task     : A
// URL      : https://atcoder.jp/contests/abc081/tasks/abc081_a
// compiler : C (GCC 5.4.1)
// status   : https://atcoder.jp/contests/abc081/submissions/9171731 : AC

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define num_cells 3

void ABC081A (void)
{
	// local variables for this function
	char         given_data[num_cells];
	int          retval_scanf;
	unsigned int num_marbles;

	// STEP.01
	// read out the given string
	retval_scanf = scanf("%s", given_data);

	// STEP.02
	// find the number of squares on which Sunuke will place a marble
	num_marbles = (unsigned int)(0);

	for (int iter = 0; iter < num_cells; ++iter)
	{
		if ( given_data[iter] == '1' ) ++num_marbles;
	}

	// STEP.03
	// print the answer of this task to the standard output
	printf( "%d\n", num_marbles );

	// STEP.END
	return;
}

int main (void)
{
	// STEP.01
	// calculate & output the answer
	ABC081A();

	// STEP.END
	return EXIT_SUCCESS;
}

/* EOF */
