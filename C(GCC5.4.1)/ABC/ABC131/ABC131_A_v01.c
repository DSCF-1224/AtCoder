// [contest]  ABC 131
// [task]     A
// [URL]      https://atcoder.jp/contests/abc131/tasks/abc131_a
// [compiler] C (GCC 5.4.1)
// [status]   NOT Submitted

#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#define len_SecurityCode 4U

void sort_insert (void **val_array, unsigned int len_array)
{
	register unsigned int itr;
}

bool task_A (unsigned int val_code)
{
	// variables for this function
	unsigned int val_code_digit[len_SecurityCode];

	for (register unsigned int itr = 0U; itr < len_SecurityCode; itr++)
	{
		val_code_digit[itr]  = val_code % 10U;
		val_code            /= 10U;
	}

}

int main (void)
{
	// variables for main process
	unsigned int S;

	// support variables for main process
	int rtvl_scanf;

	// STEP.01
	// read out the given data
	rtvl_scanf = scanf("%d", &S);

	// STEP.02
	// output the answer of this task
	if ( task_A(S) ) { printf("%s\n", "Good"); }
	else             { printf("%s\n", "Bad");  }

	// STEP.END
	return EXIT_SUCCESS;
}

/* EOF */
