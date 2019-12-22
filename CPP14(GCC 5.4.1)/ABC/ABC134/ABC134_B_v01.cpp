// [contest]  ABC 134
// [task]     B
// [URL]      https://atcoder.jp/contests/abc134/tasks/abc134_b
// [compiler] C++ 14 (GCC 5.4.1)
// [status]   https://atcoder.jp/contests/abc134/submissions/6484060 : AC, inappropriate code is included
//            https://atcoder.jp/contests/abc134/submissions/6485709 : AC

#include <iostream>

unsigned short calculate_num_monitor (unsigned short num_tree_all, unsigned short num_range)
{
	// variable for this function
	register unsigned short num_tree_monitored;
	register unsigned short num_monitor;

	num_tree_monitored = (unsigned short)(2) * num_range + (unsigned short)(1);
	num_monitor        = num_tree_all / num_tree_monitored;

	if ( num_tree_all % num_tree_monitored != (unsigned short)(0) ) { num_monitor += (unsigned short)(1); }

	return num_monitor;
}

int main (void)
{
	// variables for main process
	register unsigned short N;
	register unsigned short D;

	// STEP.01
	// read out the given data
	std::cin >> N >> D;

	// STEP.02
	// output the answer of this task
	std::cout << calculate_num_monitor (N, D) << std::endl;

	// STEP.END
	return EXIT_SUCCESS;
}

/* EOF */
