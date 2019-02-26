/* AtCoder Beginner Contest 002 B */
/*

[URL]
https://atcoder.jp/contests/abc001/tasks/abc002_2

[compiler]
C++14 (GCC 5.4.1)

[reference]

*/

#include <iostream>
#include <string>

int main (void)
{
	/* variables for main process */
	std::string word;


	// STEP.01
	// read out the given data
	std::cin >> word;

	// STEP.02
	// output the result
	for(size_t itr = 0; itr < word.length(); itr++)
	{
		if      ( word[itr] == 'a' ) { continue; }
		else if ( word[itr] == 'i' ) { continue; }
		else if ( word[itr] == 'u' ) { continue; }
		else if ( word[itr] == 'e' ) { continue; }
		else if ( word[itr] == 'o' ) { continue; }
		else                         { std::cout << word[itr]; }
	}
	std::cout << std::endl;

	// STEP.END
	return 0;
}
