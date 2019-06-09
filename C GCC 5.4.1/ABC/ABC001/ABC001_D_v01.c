// [contest]    AtCoder Beginner Contest 001
// [task]       D
// [URL]        https://atcoder.jp/contests/abc001/tasks/abc001_4
// [compiler]   C (GCC 5.4.1)
// [submission] NOT submitted

#include <stdio.h>

#define num_range_max 30000

short round_time (short *time)
{
	short buf;

	// STEP.01
	buf = *time % 10;
	if (buf < 5) { return *time - buf;      }
	else         { return *time - buf + 10; }
}

// Algorithm in a Nutshell
// Section 4.4.1
// Example 4-1
// pp.63--64
void sort_insertion (short time_start[], short time_end[], size_t *size, short (*compare)(const void *, const void *))
{
	for (size_t itr_start = 1; itr_start < size; itr_start++)
	{
		int  *itr_elem    = itr_start - 1;
		void *value_start = time_start[itr_start];
		void *value_end   = time_end  [itr_start];
	}
}

int main (void)
{
	/* variables for main process */
	int   num_range;
	short time_start[num_range_max];
	short time_end  [num_range_max];

	/* support variables for main process */
	int rtvl_scanf;

	// STEP.01
	// read out the number of rainy range
	rtvl_scanf = scanf ("%d", &num_range);

	// STEP.02
	for (size_t itr = 0; itr < num_range; itr++)
	{
		// read out the start & end time of rainy range
		rtvl_scanf = scanf ("%d-%d\n", &time_start[itr], &time_end[itr]);

		// round the start and end time
		time_start[itr] = round_time (&time_start[itr]);
		time_end  [itr] = round_time (&time_end  [itr]);
	}

	sort_insertion (&num_range, time_start, time_end);

	// STEP.END
	return 0;
}
