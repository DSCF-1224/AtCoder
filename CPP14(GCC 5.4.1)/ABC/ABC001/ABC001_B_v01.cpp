/* AtCoder Beginner Contest 001 B */
/*

[URL]
https://atcoder.jp/contests/abc001/tasks/abc001_2

[compiler]
C++14 (GCC 5.4.1)

[reference]
<1> https://cpprefjp.github.io/reference/iomanip/setfill.html
<2> https://cpprefjp.github.io/reference/iomanip/setw.html

*/

#include <iomanip>
#include <iostream>

int main (void)
{
	// variables for main process
	unsigned visibility_inpt, visibility_otpt;


	// STEP.01
	// read out the data of visibility
	std::cin >> visibility_inpt;

	// STEP.02
	// output the result
	if      ( visibility_inpt <    100 ) { visibility_otpt = 0; }
	else if ( visibility_inpt <=  5000 ) { visibility_otpt = visibility_inpt/100; }
	else if ( visibility_inpt <= 30000 ) { visibility_otpt = visibility_inpt/1000+50; }
	else if ( visibility_inpt <= 70000 ) { visibility_otpt = (visibility_inpt/1000-30)/5+80; }
	else                                 { visibility_otpt = 89; }

	// STEP.03
	// output the result
	std::cout << std::setw(2) << std::setfill('0') << visibility_otpt << std::endl;

	// STEP.END
	return 0;
}
