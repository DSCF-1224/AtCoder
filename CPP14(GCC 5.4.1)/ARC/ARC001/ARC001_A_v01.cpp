/* AtCoder Regular Contest 119 A */
/*

[URL]
https://atcoder.jp/contests/arc001/tasks/arc001_1

[compiler]
C++14 (GCC 5.4.1)

[reference]

*/

/* classes to include */
#include <iostream>
#include <string>

/* macros */
#define num_choices 4

int main (void)
{
	/* variables for main process */
	int         num_problems;
	int         num_correct_answers[num_choices];
	int         num_correct_answers_max, num_correct_answers_min;
	std::string buf_correct_answers;


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
		for(int itr = 0; itr < num_choices; itr++) { num_correct_answers[itr] = 0; }
		
		// STEP.03.02
		// count up the number of choices
		for(int itr = 0; itr < num_problems; itr++)
		{
			num_correct_answers[ std::stoi( buf_correct_answers.substr(itr,1) )-1 ]++;
		}

	// STEP.04
	// find the maximum/minimum number of correct answers

		// STEP.04.01
		// initialize the buffer
		num_correct_answers_max = 0;
		num_correct_answers_min = num_choices+1;

		// STEP.04.02
		// find the target value
		for(int itr = 0; itr < num_choices; itr++)
		{
			if( num_correct_answers_max < num_correct_answers[itr] ) num_correct_answers_max = num_correct_answers[itr];
			if( num_correct_answers_min > num_correct_answers[itr] ) num_correct_answers_min = num_correct_answers[itr];
		}


	// STEP.04
	// output the result
	std::cout << num_correct_answers_max << " " << num_correct_answers_min << std::endl;
	
	
	// STEP.END
	return 0;
}
