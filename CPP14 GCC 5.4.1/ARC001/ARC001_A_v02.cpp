/* AtCoder Regular Contest 119 A */
/*

[URL]
https://atcoder.jp/contests/arc001/tasks/arc001_1

[compiler]
C++14 (GCC 5.4.1)

[reference]
<1> https://cpprefjp.github.io/reference/algorithm/fill.html
<2> https://cpprefjp.github.io/reference/algorithm/max_element.html
<3> https://qiita.com/shirakawa4756/items/f4cc65c6b2b412b10c0c

*/

/* classes to include */
#include <algorithm>
#include <iostream>
#include <string>
#include <vector>

/* macros */
#define num_choices 4

int main (void)
{
	/* variables for main process */
	int              num_problems;
	std::string      buf_correct_answers;
	std::vector<int> num_correct_answers(num_choices);


	// STEP.01
	// read out the number of problems
	std::cin >> num_problems;

	// STEP.02
	// read out the data of correct answers as `std::string`
	std::cin >> buf_correct_answers;

	// STEP.03
	// count up the number of the each choice if it was correct choice

		// STEP.03.01
		// initialize the buffer
		std::fill( num_correct_answers.begin(), num_correct_answers.end(), 0 );
		
		// STEP.03.02
		// count up the number of choices
		for(int itr = 0; itr < num_problems; itr++)
		{
			num_correct_answers[ std::stoi( buf_correct_answers.substr(itr,1) )-1 ]++;
		}

	// STEP.04
	// output the result
	std::cout
	<< *std::max_element( num_correct_answers.begin(), num_correct_answers.end() ) << " "
	<< *std::min_element( num_correct_answers.begin(), num_correct_answers.end() )
	<< std::endl;

	// STEP.END
	return 0;
}
