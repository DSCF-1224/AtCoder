// AtCoder Beginner Contest 004 B
// [URL]        https://atcoder.jp/contests/abc004/tasks/abc004_2
// [compiler]   C (GCC 5.4.1)
// [submission] https://atcoder.jp/contests/abc004/submissions/4650644 : AC
// [reference]  https://atcoder.jp/contests/abc004/submissions/4319216

#include <stdio.h>

#define size_board 4

int main (void)
{
	/* variables for main process */
	char element[size_board][size_board];

	// STEP.01
	// read out the characters on the board
	for (size_t itr_r = 0; itr_r < size_board; itr_r++)
	{
		for (size_t itr_c = 0; itr_c < size_board; itr_c++)
		{ int rtvl_scanf = scanf ("%c ", &element[itr_r][itr_c]); }
	}

	// STEP.02
	// output the result
	for (int itr_r = size_board - 1; itr_r >= 0; itr_r--)
	{
		for (int itr_c = size_board - 1; itr_c >= 0; itr_c--)
		{ printf ("%c ", element[itr_r][itr_c]); } printf ("\n");
	}

	// STEP.END
	return 0;
}
