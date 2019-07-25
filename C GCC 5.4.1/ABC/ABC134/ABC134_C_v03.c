// [contest]  ABC 134
// [task]     C
// [URL]      https://atcoder.jp/contests/abc134/tasks/abc134_c
// [compiler] C (GCC 5.4.1)
// [status]   https://atcoder.jp/contests/abc134/submissions/6528487 : AC

#include <stdio.h>
#include <stdlib.h>

#define len_sequence_max 200000U

#define max(a, b) (((a) > (b)) ? (a) : (b))

int task_C (const unsigned int* len_sequence, unsigned int val_sequence[])
{
	// arrays for this function
	unsigned int maxval_left [len_sequence_max];
	unsigned int maxval_right[len_sequence_max];

	// support variables for this function
	register unsigned int itr;

	// STEP.01
	// initialize the array to store the maximum values of the given seuquence
	maxval_left [                0U] = 0U;
	maxval_right[*len_sequence - 1U] = 0U;

	// STEP.02
	// search the maximum values of the given sequence
	for (itr = 0U;                 itr < *len_sequence - 1U; itr++) { maxval_left [itr + 1U] = max(maxval_left [itr], val_sequence[itr]); }
	for (itr = *len_sequence - 1U; itr > 0U;                 itr--) { maxval_right[itr - 1U] = max(maxval_right[itr], val_sequence[itr]); }

	// STEP.03
	// output the answer of this task
	for (itr = 0U; itr < *len_sequence; itr++) { printf("%d\n", max(maxval_left[itr], maxval_right[itr])); }
	
	// STEP.END
	return EXIT_SUCCESS;
}

int main (void)
{
	// variables for main process
	unsigned int N;

	// arrays for main process
	unsigned int A[len_sequence_max];

	// support variables for main process
	register int rtvl;

	// STEP.01
	// read out the given data
	// (the length of the given sequence)
	rtvl = scanf("%d", &N);

	// STEP.02
	// read out the given data
	// (the value of the given sequence)
	for (register size_t itr = 0; itr < N; itr++) { rtvl = scanf("%d", &A[itr]); }

	// STEP.04
	// calculate & output the answer of this task
	rtvl = task_C(&N, A);

	// STEP.END
	return EXIT_SUCCESS;
}

/* EOF */
