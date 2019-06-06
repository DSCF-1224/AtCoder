/* AtCoder Beginner Contest 003 A */
/*

[URL]
https://atcoder.jp/contests/abc001/tasks/abc003_1

[compiler]
C++14 (GCC 5.4.1)

[reference]

*/

#include <iostream>

double calc_allowance( int num_tasks )
{
	return (double)( 10000*num_tasks*(num_tasks+1)/2 )/(double)num_tasks;
}

int main (void)
{
	/* variables for main process */
	int N;

	// STEP.01
	// read out the number of tasks
	std::cin >> N;

	// STEP.02
	// output the result
	std::cout << calc_allowance( N ) << std::endl;

	// STEP.END
	return 0;
}
