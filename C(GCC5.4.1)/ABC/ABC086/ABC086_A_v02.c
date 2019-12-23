// contest  : ABC 086
// task     : A
// URL      : https://atcoder.jp/contests/abc086/tasks/abc086_a
//          : https://atcoder.jp/contests/abs/tasks/abc086_a
// compiler : C (GCC 5.4.1)
// status   : https://atcoder.jp/contests/abc086/submissions/9094005

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

typedef struct
{
	int a;
	int b;
} abc086a_t;

int product (const abc086a_t * given_data)
{
	return (* given_data).a * (* given_data).b;
}

bool isProdEven (const abc086a_t * given_data)
{
	return ( ( product(given_data) % 2 ) == 0 );
}

void ABC086A (const abc086a_t * given_data)
{
	if ( isProdEven(given_data) ) printf( "Even\n" );
	else                          printf( "Odd\n"  );
}

int main (void)
{
	// variables for `main`
	abc086a_t given_data;
	int       retval_scanf;

	// STEP.01
	// read out the given data
	retval_scanf = scanf("%d %d", &given_data.a, &given_data.b);

	// STEP.02
	// calculate & output the answer
	ABC086A(& given_data);

	// STEP.END
	return EXIT_SUCCESS;
}

/* EOF */
