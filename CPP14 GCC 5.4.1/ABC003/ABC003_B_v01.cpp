/* AtCoder Beginner Contest 003 B */
/*

[URL]
https://atcoder.jp/contests/abc001/tasks/abc003_2

[compiler]
C++14 (GCC 5.4.1)

[reference]
<1> https://cpprefjp.github.io/reference/string/basic_string/at.html

*/

#include <iostream>
#include <string>

// 文字 `target` が置換可能な文字であるか否かを返す
bool judge_exchangeable( char target )
{
	if ( target == 'a' || target == 't' || target == 'c' || target == 'o' || target == 'd' || target == 'e' || target == 'r' )
	{ return true; }
	else
	{ return false; }
}

// 文字 `target` が `@` であるか否かを返す
bool judge_IsAtmark( char target )
{
	if ( target == '@' ) { return true; }
	else                 { return false; }
}

// 文字列 `str1`, `str2` の組が勝利可能か否かを返す
// 勝利 -> true
// 敗北 -> false
bool judge_targets( std::string str1, std::string str2 )
{
	for(size_t itr = 0; itr < str1.length(); itr++)
	{
		// STEP.01
		// judge whether the `itr`-th character is equal or not simply
		if ( str1.at(itr) == str2.at(itr) ) { continue; }
		else
		{
			if ( ( judge_IsAtmark( str1.at(itr) ) && judge_exchangeable( str2.at(itr) ) ) || ( judge_IsAtmark( str2.at(itr) ) && judge_exchangeable( str1.at(itr) ) ) )
			{ continue; }
			else
			{ return false; }
		}
	}

	return true;
}

int main (void)
{
	/* variables for main process */
	bool        stat;
	std::string str1, str2;

	// STEP.01
	// read out the number of tasks
	std::cin >> str1 >> str2;

	// STEP.02
	// output the result
	if ( judge_targets(str1, str2) ) { std::cout << "You can win";   }
	else                             { std::cout << "You will lose"; }
	std::cout << std::endl;
	

	// STEP.END
	return 0;
}
