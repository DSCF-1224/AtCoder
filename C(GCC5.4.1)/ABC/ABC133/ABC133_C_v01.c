// [contest]  ABC 133
// [task]     A
// [URL]      https://atcoder.jp/contests/abc133/tasks/abc133_a
// [compiler] C (GCC 5.4.1)
// [status]   https://atcoder.jp/contests/abc133/submissions/6539663 : WA
//            https://atcoder.jp/contests/abc133/submissions/6539672 : AC

#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

long task_C (long range_min, long range_max, long val_divisor)
{
	// return value of this function
	long val_mod_minimum;
	long val_mod_buffer;

	// STEP.01
	// initialize the return value of this function
	val_mod_minimum = LONG_MAX;

	// STEP.02
	// search the minimum possible value of mod
	for (long itr_sml = range_min;    itr_sml <  range_max; itr_sml++) {
	for (long itr_lrg = itr_sml + 1L; itr_lrg <= range_max; itr_lrg++) {

		val_mod_buffer = (itr_sml * itr_lrg) % val_divisor;

		if (val_mod_buffer == 0L)
		{
			return 0L;
		}
		else if (val_mod_buffer < val_mod_minimum)
		{
			val_mod_minimum = val_mod_buffer;
		}
		else
		{
			continue;
		}
		
	} }

	// STEP.END
	return val_mod_minimum;
}

long main (void)
{
	// variables for main process
	long L, R;
	long rtvl_scanf;
	long val_divisor;

	// STEP.01
	// set the parameter
	val_divisor = 2019;

	// STEP.02
	// read out the given data
	rtvl_scanf = scanf("%ld %ld", &L, &R);

	// STEP.03
	// output the answer of this task
	printf("%ld\n", task_C(L, R, val_divisor));

	// STEP.END
	return EXIT_SUCCESS;
}