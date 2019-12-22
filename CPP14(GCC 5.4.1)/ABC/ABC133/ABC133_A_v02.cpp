// [contest]  ABC 133
// [task]     A
// [URL]      https://atcoder.jp/contests/abc133/tasks/abc133_a
// [compiler] C++ 14 (GCC 5.4.1)
// [status]   https://atcoder.jp/contests/abc133/submissions/6530611 : AC

#include <algorithm>
#include <iostream>

unsigned int calculate_cost (const unsigned int* const num_traveler, const unsigned int* const cost_train, const unsigned int* const cost_taxi)
{
	return std::min(*num_traveler * *cost_train, *cost_taxi);
}

int main (void)
{
	// variables for main process
	unsigned int N, A, B;

	// STEP.01
	// read out the given data
	std::cin >> N >> A >> B;

	// STEP.02
	// output the answer of this task
	std::cout << calculate_cost (&N, &A, &B) << std::endl;

	// STEP.END
	return 0;
}
