// [contest]  ABC 134
// [task]     C
// [URL]      https://atcoder.jp/contests/abc134/tasks/abc134_c
// [compiler] C++ 14 (GCC 5.4.1)
// [status]   https://atcoder.jp/contests/abc134/submissions/6501038 : AC

#include <iostream>
#include <vector>

int main (void)
{
	// variables for main process
	unsigned int register buffer_input;
	unsigned int register maxval_1st;
	unsigned int register maxval_2nd;
	unsigned int register maxval_answer;
	unsigned int          N;
	std::vector<unsigned int>A;

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
	// initialize the variables to store the maximum values of given sequence
	maxval_1st = 0U;
	maxval_2nd = 0U;

	// STEP.04
	// search the maximum values of given sequence
	for (auto itr = A.begin(); itr != A.end(); itr++)
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

	// STEP.05
	// output the answer of this task
	for (auto itr = A.begin(); itr != A.end(); itr++)
	{
		if (*itr != maxval_1st) { maxval_answer = maxval_1st; }
		else                    { maxval_answer = maxval_2nd; }

		std::cout << maxval_answer << std::endl;
	}

	// STEP.END
	return EXIT_SUCCESS;
}

/* EOF */
