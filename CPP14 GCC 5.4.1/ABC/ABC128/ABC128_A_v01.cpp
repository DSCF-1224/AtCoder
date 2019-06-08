// [contest]  ABC 128
// [task]     A
// [URL]      https://atcoder.jp/contests/abc128/tasks/abc128_a
// [compiler] C++ 14 (GCC 5.4.1)
// [status]   https://atcoder.jp/contests/abc128/submissions/5808211 : AC

#include <iostream>

int calculate_num_pies (int num_apples_whole, int num_apples_chip)
{
	// local variables for this function
	int num_apples_chips_total;
	int num_pies;

	// STEP.01
	// calculate the number of chips we can make
	num_apples_chips_total = num_apples_chip + num_apples_whole * 3;

	// STEP.02
	// calculate the number of pies we can make
	num_pies = num_apples_chips_total / 2;

	// declare the 
	return num_pies;
}

int main (void)
{
	// variables for main process
	int num_apples_whole;
	int num_apples_chip;

	// STEP.01
	// read out the number of the apples
	std::cin >> num_apples_whole;
	std::cin >> num_apples_chip;

	// STEP.02
	// calculate & output the maximum number of apple pies we can make
	std::cout << calculate_num_pies (num_apples_whole, num_apples_chip) << std::endl;

	// STEP.END
	return 0;
}
