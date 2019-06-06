/* AtCoder Beginner Contest 119 A */
/*

[URL]
https://atcoder.jp/contests/abc119/tasks/abc119_a

[compiler]
C++14 (GCC 5.4.1)

[reference]
<1> https://cpprefjp.github.io/reference/string/basic_string/substr.html

*/

#include <iostream>

int main (void)
{
	// variables for main process
	char buf;
	int  year, month, day;


	// STEP.01
	// read out the target date as integer
	std::cin >> year >> buf >> month >> buf >> day;

	// STEP.02
	// 1. judge the month
	// 2. output the result
	if( month <= 4 ) { std::cout << "Heisei" << std::endl; }
	else             { std::cout << "TBD"    << std::endl; }

	// STEP.END
	return 0;
}
