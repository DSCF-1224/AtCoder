// [contest]  ABC 001
// [task]     A
// [URL]      https://atcoder.jp/contests/abc001/tasks/abc001_1
// [compiler] C (GCC 5.4.1)
// [status]   https://atcoder.jp/contests/abc001/submissions/9089185 : AC

#include <stdio.h>

typedef struct
{
	unsigned int first;
	unsigned int second;
} snow_depth;

unsigned int ABC001A (const snow_depth * given_data)
{
	return (* given_data).first - (* given_data).second;
}

int main (void)
{
	/* variables for main process */
	snow_depth given_data;

	// STEP.01
	// read the values of the height of snow
	scanf( "%d", &given_data.first );
	scanf( "%d", &given_data.second );

	// STEP.02
	// output the change of the height of snow
	printf( "%d\n", ABC001A( & given_data ) );

	// STEP.TRUE_END
	return 0;
}

/* EOF */
