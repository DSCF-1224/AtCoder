// [contest]  ABC 133
// [task]     C
// [URL]      https://atcoder.jp/contests/abc133/tasks/abc133_c
// [compiler] C++ 14 (GCC 5.4.1)
// [status]   NOT Submitted

#include <algorithm>
#include <iostream>
#include <limits.h>

unsigned int task_C
(
	const unsigned int* const range_min,
	const unsigned int* const range_max,
	const unsigned int* const val_divisor
)
{
	// variables for this function
	register unsigned int mod_minimum;
	register unsigned int mod_buffer;
	
	// support variables for this function
	register unsigned int itr_L;
	register unsigned int itr_R;

	// STEP.01
	// initialize the variable
	mod_minimum = UINT_MAX;

	// STEP.02
	// calculate the answer of this task
	for (itr_L = *range_min; itr_L < *range_max; itr_L++) {//
	for (itr_R = itr_L + 1U; itr_R < *range_max; itr_R++) {//

		mod_buffer = (itr_L * itr_R) % *val_divisor;

		if (mod_buffer == 0U) { return 0U; }
		else                  { mod_minimum = std::min(mod_minimum, mod_buffer); }

	} }

	return mod_minimum;
	
}

int main (void)
{
	// variables for main process
	unsigned int L, R;
	unsigned int divisor = 2019U;

	// STEP.01
	// read out the given data
	std::cin >> L >> R;

	// STEP.02
	// output the answer of this task
	std::cout << task_C (&L, &R, &divisor) << std::endl;

	// STEP.END
	return EXIT_SUCCESS;
}

/* EOF */
