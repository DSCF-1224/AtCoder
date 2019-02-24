// AtCoder Beginner Contest 006 B
// [URL]      https://atcoder.jp/contests/abc006/tasks/abc006_2
// [compiler] C (GCC 5.4.1)
// 
#include <stdio.h>

#define n_MAX   1e+06
#define DIVISOR 10007

unsigned long calc_mod_tribonacci( unsigned long term )
{
	unsigned long buffer[(unsigned long)n_MAX];
	unsigned long itr;

	// set the initial values of the tribonacci sequence
	buffer[0] = (unsigned long)0;
	buffer[1] = (unsigned long)0;
	buffer[2] = (unsigned long)1;

	// STEP.01
	// if the target term is one of the initial values
	if( term >= 3 ){
		for(itr=3; itr<term; itr++)
		{
			buffer[itr] = buffer[itr-1]%DIVISOR + buffer[itr-2]%DIVISOR + buffer[itr-3]%DIVISOR;
		}
		
	}

	// STEP.END
	return buffer[term-1];
}

int main (void)
{
	/* variables for main process */
	unsigned long n;

	// STEP.01
	// read the target number
	scanf( "%d", &n );

	// STEP.02
	// output the mod
	printf( "%d\n", calc_mod_tribonacci(n) );

	// STEP.TRUE_END
	return 0;
}
