// [contest]  ABC 127
// [task]     B
// [URL]      https://atcoder.jp/contests/abc127/tasks/abc127_b
// [compiler] C++ 14 (GCC 5.4.1)
// [status]   https://atcoder.jp/contests/abc127/submissions/5809777 : AC

#include <iostream>

int main (void)
{
	// variables for main process
	int rate_increase;
	int speed_decrease;
	int weight_algae;

	// STEP.01
	// read out the given data
	std::cin >> rate_increase;
	std::cin >> speed_decrease;
	std::cin >> weight_algae;

	// STEP.02
	// calculate & output the total weight of the algae
	for (size_t itr = 0; itr < 10; itr++)
	{
		// update the total weight of the algae
		weight_algae = rate_increase * weight_algae - speed_decrease;

		// output the total weight of the algae
		std::cout << weight_algae << std::endl;
	}

	// STEP.END
	return 0;
}
