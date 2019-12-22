// [contest]  ABC 134
// [task]     C
// [URL]      https://atcoder.jp/contests/abc134/tasks/abc134_c
// [compiler] C++ 14 (GCC 5.4.1)
// [status]   https://atcoder.jp/contests/abc134/submissions/6508312 : AC

#include <iostream>
#include <vector>

int task_C (std::vector<unsigned int>& sequence)
{
	// variables for this function
	register unsigned int maxval_1st;
	register unsigned int maxval_2nd;
	register unsigned int maxval_answer;

	// STEP.01
	// initialize the variables to store the maximum values of given sequence
	maxval_1st = 0U;
	maxval_2nd = 0U;

	// STEP.02
	// search the maximum values of given sequence
	for (register auto itr = sequence.begin(); itr != sequence.end(); itr++)
	{
		if (maxval_1st < *itr)
		{
			maxval_2nd = maxval_1st;
			maxval_1st = *itr;
		}
		else if (maxval_2nd < *itr)
		{ maxval_2nd = *itr; }
		else
		{ continue; }
	}

	// STEP.02
	// output the answer of this task
	for (register auto itr = sequence.begin(); itr != sequence.end(); itr++)
	{
		if (*itr != maxval_1st) { maxval_answer = maxval_1st; }
		else                    { maxval_answer = maxval_2nd; }

		std::cout << maxval_answer << std::endl;
	}

	// STEP.END
	return EXIT_SUCCESS;
}

int main (void)
{
	// variables for main process
	register unsigned int buffer_input;
	static   unsigned int N;

	// instances for this function
	std::vector<unsigned int> A;

	// STEP.01
	// read out the given data
	// (the length of the given sequence)
	std::cin >> N;

	// STEP.02
	// read out the given data
	// (the values of the given sequence)
	for (register size_t itr = 0; itr < N; itr++)
	{
		std::cin >> buffer_input;
		A.push_back(buffer_input);
	}

	// STEP.03
	// calculate & output the answer of this task
	task_C (A);

	// STEP.END
	return EXIT_SUCCESS;
}

/* EOF */
