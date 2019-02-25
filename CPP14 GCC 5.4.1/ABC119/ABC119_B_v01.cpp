/* AtCoder Beginner Contest 119 B */
/*

[URL]
https://atcoder.jp/contests/abc119/tasks/abc119_b

[compiler]
C++14 (GCC 5.4.1)

[reference]
<1> https://cpprefjp.github.io/reference/string/basic_string/substr.html

*/

#include <iostream>
#include <string>

#define num_relatives_max 10
#define JPY_per_BTC       380000.0

int main (void)
{
	/* variables for main process */
	
	double      buffer_val;
	double      val_BTC[num_relatives_max];
	double      val_JPY[num_relatives_max];
	double      val_total_JPY;
	int         num_relatives;
	int         num_BTC;
	int         num_JPY;
	std::string buffer_str;

	/* support variables for main process */


	// STEP.01
	// read out the number of relatives
	std::cin >> num_relatives;

	// STEP.02
	// read out the values of the given money

		// STEP.02.01
		// initialize the counter
		num_BTC = (int)0;
		num_JPY = (int)0;

		// STEP.02.02
		for(int itr = 0; itr < num_relatives; itr++)
		{
			// STEP.02.01
			// read out the written data
			std::cin >> buffer_val >> buffer_str;

			// STEP.02.02
			// allot the read data
			if( buffer_str == "BTC" )
			{ val_BTC[num_BTC] = buffer_val; num_BTC++; }
			else
			{ val_JPY[num_JPY] = buffer_val; num_JPY++; }
		}

	// STEP.03
	// calculate the total value [JPY]

		// STEP.03.01
		// initialize the variable to store the total value
		val_total_JPY = 0.0;

		// STEP.03.02
		// calculate the sum of BTC
		for(int itr = 0; itr < num_BTC; itr++)
		{
			val_total_JPY += val_BTC[itr];
		}

		val_total_JPY *= JPY_per_BTC;

		// STEP.03.03
		// calculate the sum of JPY
		for(int itr = 0; itr < num_JPY; itr++)
		{
			val_total_JPY += val_JPY[itr];
		}
		
	// STEP.04
	// output the result
	std::cout << val_total_JPY << std::endl;

	// STEP.END
	return 0;
}
