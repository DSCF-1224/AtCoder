// contest  : ABC 050
// task     : B
// URL      : https://atcoder.jp/contests/abc050/tasks/abc050_b
// compiler : C (GCC 5.4.1)
// status   : https://atcoder.jp/contests/abc050/submissions/9228638 : AC
//          : https://atcoder.jp/contests/abc050/submissions/9229056 : AC

#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#define NUM_PROBLEMS_MAX 100
#define NUM_DRINKS_MAX   100

typedef struct
{
	unsigned int num_problems;
	unsigned int num_drinks;
	unsigned int took_time_normal [NUM_PROBLEMS_MAX];
	unsigned int index_doped      [NUM_DRINKS_MAX  ];
	unsigned int took_time_doped  [NUM_DRINKS_MAX  ];
} abc050b_t;

void abc050b_get_data (      abc050b_t const * test_data);
void abc050b_answer   (const abc050b_t const * test_data);

int main (void)
{
	// variables for `main`
	abc050b_t test_data;

	// STEP.01
	// read out the given data
	abc050b_get_data(&test_data);

	// STEP.02
	// calculate & output the points
	abc050b_answer(&test_data);

	// STEP.END
	return EXIT_SUCCESS;
}

void abc050b_get_data (abc050b_t const * test_data)
{
	// local variables for this function
	int retval_scanf;

	retval_scanf = scanf( "%d", &(*test_data).num_problems );

	for (unsigned int iter = 0; iter < (*test_data).num_problems; ++iter)
	{
		retval_scanf =
			scanf(
				"%d",
				&(*test_data).took_time_normal[iter]
			);
	}

	retval_scanf = scanf( "%d", &(*test_data).num_drinks );

	for (unsigned int iter = 0; iter < (*test_data).num_drinks; ++iter)
	{
		retval_scanf =
			scanf(
				"%d %d",
				&(*test_data).index_doped    [iter],
				&(*test_data).took_time_doped[iter]
			);
	}
}

void abc050b_answer (const abc050b_t const * test_data)
{
	// local variables for this function
	unsigned int sum_took_time = (unsigned int)0;

	// STEP.01
	// calculate the summation of the time it task to solve individual problems
	for (unsigned int iter = 0; iter < (*test_data).num_problems; ++iter)
	{
		sum_took_time += (*test_data).took_time_normal[iter];
	}

	// STEP.02
	// print the answer of this task to the console
	for (unsigned int iter = 0; iter < (*test_data).num_drinks; ++iter)
	{
		printf( "%d\n", sum_took_time - (*test_data).took_time_normal[ (*test_data).index_doped[iter] - 1 ] + (*test_data).took_time_doped[iter] );
	}
}


/* EOF */
