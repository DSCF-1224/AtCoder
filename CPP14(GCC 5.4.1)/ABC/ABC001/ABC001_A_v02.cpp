// [contest]  ABC 001
// [task]     A
// [URL]      https://atcoder.jp/contests/abc001/tasks/abc001_1
// [compiler] C++ 14 (GCC 5.4.1)
// [status]   https://atcoder.jp/contests/abc001/submissions/9090135 : WA
//            https://atcoder.jp/contests/abc001/submissions/9090167 : AC

#include <iostream>

namespace abc001
{
	namespace task_A
	{
		struct SnowDepth
		{
			public: int fst;
			public: int snd;

			public: int change ()
			{
				return this->fst - this->snd;
			}
		};
		
	} // namespace task_A
	
} // namespace abc001


int main (void)
{
	// variables for main process
	abc001::task_A::SnowDepth given_data;

	// STEP.01
	// read out the height of the snow
	std::cin >> given_data.fst >> given_data.snd;

	// STEP.02
	// output the result
	std::cout << given_data.change() << std::endl;

	// STEP.END
	return EXIT_SUCCESS;
}

/* EOF */
