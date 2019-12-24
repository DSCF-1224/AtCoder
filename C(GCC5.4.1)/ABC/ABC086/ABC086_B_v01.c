// contest  : ABC 086
// task     : B
// URL      : https://atcoder.jp/contests/abc086/tasks/abc086_b
// compiler : C (GCC 5.4.1)
// status   : https://atcoder.jp/contests/abc086/submissions/9108407 : AC

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

typedef struct
{
	unsigned int a;
	unsigned int b;
} abc086b_t;

int concatenate (const abc086b_t * given_data)
{
	if      ( (* given_data).b <  10 ) return   10 * (* given_data).a + (* given_data).b;
	else if ( (* given_data).b < 100 ) return  100 * (* given_data).a + (* given_data).b;
	else                               return 1000 * (* given_data).a + (* given_data).b;
}

bool IsSquare (const abc086b_t * given_data)
{
	const unsigned int concatenated = concatenate( given_data );

	unsigned int iter        = 1;
	unsigned int iter_square = iter * iter;

	while (iter_square <= concatenated)
	{
		if (iter_square == concatenated)
		{ return true; }
		else
		{
			++iter;
			iter_square = iter * iter;
		}
	}

	return false;
}

void ABC086B (const abc086b_t * given_data)
{
	if   ( IsSquare(given_data) ) printf( "Yes\n" );
	else                          printf(  "No\n" );
}

int main (void)
{
	// variables for `main`
	abc086b_t given_data;
	int       retval_scanf;

	// STEP.01
	// read out the given data
	retval_scanf = scanf("%d %d", &given_data.a, &given_data.b);

	// STEP.02
	// calculate & output the answer
	ABC086B(& given_data);

	// STEP.END
	return EXIT_SUCCESS;
}

/* EOF */
