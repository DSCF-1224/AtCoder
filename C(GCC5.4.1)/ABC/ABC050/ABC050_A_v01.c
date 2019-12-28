// contest  : ABC 050
// task     : A
// URL      : https://atcoder.jp/contests/abc050/tasks/abc050_a
// compiler : C (GCC 5.4.1)
// status   : https://atcoder.jp/contests/abc050/submissions/9193340 : AC

#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct
{
	int  a;
	int  b;
	char operator;
} abc050a_t;

int abc050a (const abc050a_t const * test_data);

int main (void)
{
	// variables for `main`
	abc050a_t test_data;
	int       retval_scanf;

	// STEP.01
	// read out the given data
	retval_scanf = scanf("%d %s %d", &test_data.a, &test_data.operator, &test_data.b);

	// STEP.02
	// calculate & output the points
	printf( "%d\n", abc050a(&test_data) );

	// STEP.END
	return EXIT_SUCCESS;
}

int abc050a (const abc050a_t const * test_data)
{
	if   ( (*test_data).operator == '+' ) return (*test_data).a + (*test_data).b;
	else                                  return (*test_data).a - (*test_data).b;
}

/* EOF */
