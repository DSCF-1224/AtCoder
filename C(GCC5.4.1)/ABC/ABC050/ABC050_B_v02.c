// contest  : ABC 050
// task     : B
// URL      : https://atcoder.jp/contests/abc050/tasks/abc050_b
// compiler : C (GCC 5.4.1)
// status   : https://atcoder.jp/contests/abc050/submissions/9230867 : AC

#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#define NUM_PROBLEMS_MAX 100
#define NUM_DRINKS_MAX   100

typedef struct
{
	unsigned int num_problems;
	unsigned int num_drinks;
	unsigned int sum_took_time_normal;
	unsigned int took_time_normal [NUM_PROBLEMS_MAX];
	unsigned int index_doped      [NUM_DRINKS_MAX  ];
	unsigned int took_time_doped  [NUM_DRINKS_MAX  ];
} abc050b_t;

void         abc050b_get_data                 (      abc050b_t       * test_data);
void         abc050b_answer                   (const abc050b_t const * test_data);
unsigned int abc050b_calc_sum_took_time_doped (const abc050b_t const * test_data, const unsigned int const index);

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

void abc050b_get_data (abc050b_t * test_data)
{
	// local variables for this function
	int retval_scanf;

	(*test_data).sum_took_time_normal = (unsigned int)(0);

	retval_scanf = scanf( "%d", &(*test_data).num_problems );

	for (unsigned int iter = 0; iter < (*test_data).num_problems; ++iter)
	{
		retval_scanf =
			scanf(
				"%d",
				&(*test_data).took_time_normal[iter]
			);

		(*test_data).sum_took_time_normal += (*test_data).took_time_normal[iter];
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
	// STEP.01
	// print the answer of this task to the console
	for (unsigned int iter = 0; iter < (*test_data).num_drinks; ++iter)
	{
		printf(
			"%d\n",
			abc050b_calc_sum_took_time_doped ( test_data, iter )
		);
	}
}

unsigned int abc050b_calc_sum_took_time_doped (const abc050b_t const * test_data, const unsigned int const index)
{
	return
		(*test_data).sum_took_time_normal -
		(*test_data).took_time_normal [ (*test_data).index_doped[index] - 1 ] +
		(*test_data).took_time_doped  [ index ]
	;
}

/* EOF */
