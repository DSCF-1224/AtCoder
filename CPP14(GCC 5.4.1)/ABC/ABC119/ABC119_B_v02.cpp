/* AtCoder Beginner Contest 119 B */
/*

[URL]
https://atcoder.jp/contests/abc119/tasks/abc119_b

[compiler]
C++14 (GCC 5.4.1)

[reference]
<1> https://atcoder.jp/contests/abc119/submissions/4374568

*/

#include <iostream>
#include <string>

#define JPY_per_BTC   380000.0
#define indicator_BTC "BTC"
#define indicator_JPY "JPY"

int main (void)
{
	/* variables for main process */
	double val_total_JPY;
	int    num_relatives;


	// STEP.01
	// read out the number of relatives
	std::cin >> num_relatives;

	// STEP.02
	// initialize the variables to use
	val_total_JPY = (double)0.0;

	// STEP.03
	// calculate the total value [JPY]
	for(int itr = 0; itr < num_relatives; itr++)
	{
		// STEP.03.00
		// declare the variables which are used in this loop
		double      buf_val;
		std::string buf_str;

		// STEP.03.01
		// read out the written data
		std::cin >> buf_val >> buf_str;

		// STEP.03.02
		// calculate the total value
		if( buf_str == indicator_BTC ) val_total_JPY += buf_val * JPY_per_BTC;
		if( buf_str == indicator_JPY ) val_total_JPY += buf_val;
	}
	
	// STEP.04
	// output the result
	std::cout << val_total_JPY << std::endl;

	// STEP.END
	return 0;
}
