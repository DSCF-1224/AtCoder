// [contest]  ABC 134
// [task]     B
// [URL]      https://atcoder.jp/contests/abc134/tasks/abc134_b
// [compiler] C (GCC 5.4.1)
// [status]   https://atcoder.jp/contests/abc134/submissions/6485910 : AC

#include <stdio.h>
#include <stdlib.h>

unsigned short calculate_num_monitor (const unsigned short* const num_tree_all, const unsigned short* const num_range)
{
	// variable for this function
	register unsigned short num_tree_monitored;
	register unsigned short num_monitor;

	num_tree_monitored = (unsigned short)(2) * *num_range + (unsigned short)(1);
	num_monitor        = *num_tree_all / num_tree_monitored;

	if ( *num_tree_all % num_tree_monitored != (unsigned short)(0) ) { num_monitor += (unsigned short)(1); }

	return num_monitor;
}

int main (void)
{
	// variables for main process
	unsigned short N;
	unsigned short D;
	int            rtvl_scanf;

	// STEP.01
	// read out the given data
	rtvl_scanf = scanf("%d %d", &N, &D);

	// STEP.02
	// output the answer of this task
	printf("%d\n", calculate_num_monitor(&N, &D));

	// STEP.END
	return EXIT_SUCCESS;
}

/* EOF */
