// [contest]  ABC 133
// [task]     A
// [URL]      https://atcoder.jp/contests/abc133/tasks/abc133_a
// [compiler] C++ 14 (GCC 5.4.1)
// [status]   https://atcoder.jp/contests/abc133/submissions/6302225 : AC

#include <algorithm>
#include <iostream>

int calculate_cost (int num_traveler, int cost_train, int cost_taxi)
{
	// return value of this function
	int cost;

	cost = std::min(num_traveler * cost_train, cost_taxi);

	// declare the return value of this function
	return cost;
}

int main (void)
{
	// variables for main process
	int N, A, B;

	// STEP.01
	// read out the given data
	std::cin >> N >> A >> B;

	// STEP.02
	// output the answer of this task
	std::cout << calculate_cost (N, A, B) << std::endl;

	// STEP.END
	return 0;
}
