// contest  : ABC 086
// task     : A
// URL      : https://atcoder.jp/contests/abc086/tasks/abc086_a
//          : https://atcoder.jp/contests/abs/tasks/abc086_a
// compiler : C++ 14 (GCC 5.4.1)
// status   : https://atcoder.jp/contests/abc086/submissions/9103739 : AC
//          : https://atcoder.jp/contests/abc086/submissions/9103909 : AC
//          : https://atcoder.jp/contests/abc086/submissions/9104070 : AC

#include <iostream>

using namespace std::literals;

namespace abc086
{
	namespace task_A
	{
		struct PairIntegers
		{
			private: unsigned int a;
			private: unsigned int b;

			private: unsigned int Product (/* no argument */)
			{
				return (this->a) * (this->b);
			}

			private: bool IsProductEven (/* No argument */)
			{
				return (this->Product() % 2U) == 0U;
			}

			public: void cin (/* No argument */)
			{
				std::cin >> this->a >> this->b;
			}

			public: void Answerer (/* No argument */)
			{
				if   ( this->IsProductEven() ) std::cout << "Even"s;
				else                           std::cout << "Odd"s;

				std::cout << "\n"s;
			}
		};
	} // namespace task_A
	
} // namespace abc086


int main (void)
{
	// variables for main process
	abc086::task_A::PairIntegers given_data;

	// STEP.01
	// read out the given data
	given_data.cin();

	// STEP.02
	// output the answer of this task
	given_data.Answerer();

	// STEP.END
	return EXIT_SUCCESS;
}

/* EOF */
