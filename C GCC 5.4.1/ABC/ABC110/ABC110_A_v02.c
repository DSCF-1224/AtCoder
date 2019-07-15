// [contest]  ABC 110
// [task]     A
// [URL]      https://atcoder.jp/contests/abc110/tasks/abc110_a
// [compiler] C (GCC 5.4.1)
// [status]   https://atcoder.jp/contests/abc110/submissions/6398859 : AC

#include <stdio.h>
#include <stdlib.h>

#define max(a, b) (((a) > (b)) ? (a) : (b))

unsigned char calculate_maximum_allowance (unsigned char const *A, unsigned char const *B, unsigned char const *C)
{
	return max(max(*A, *B), *C) * (unsigned char)(9) + *A + *B + *C;
}

int main (void)
{
	// variables for main process
	unsigned char A, B, C;
	int           rtvl_scanf;

	// STEP.01
	// read out the given string
	rtvl_scanf = scanf("%hhu %hhu %hhu", &A, &B, &C);

	// STEP.02
	// calcualte & output the points
	printf("%u\n", calculate_maximum_allowance(&A, &B, &C));

	// STEP.END
	return EXIT_SUCCESS;
}

/* EOF */
