// contest  : ABC 086
// task     : B
// URL      : https://atcoder.jp/contests/abc086/tasks/abc086_b
// compiler : C++ 14 (GCC 5.4.1)
// status   : https://atcoder.jp/contests/abc086/submissions/9104394 : AC

#include <iostream>

using namespace std::literals;

namespace abc086
{
	namespace task_B
	{
		struct PairIntegers
		{
			private: unsigned int a;
			private: unsigned int b;

			public:
				void cin (/* No argument */)
				{
					std::cin >> this->a >> this->b;
				}

			public:
				unsigned int Connected (/* No argument */)
				{
					if      (this->b <  10U) return   10U * (this->a) + (this->b);
					else if (this->b < 100U) return  100U * (this->a) + (this->b);
					else                     return 1000U * (this->a) + (this->b);
				}

			private:
				bool IsSquare (/* No argument */)
				{
					unsigned int prod = this->Connected();

					for (unsigned int iter = 1U; iter * iter <= prod; ++iter)
					{
						if (prod == iter * iter) return true;
					}

					return false;
				}

			public: void Answerer (/* No argument */)
			{
				if   ( this->IsSquare() ) std::cout << "Yes"s;
				else                      std::cout <<  "No"s;

				std::cout << "\n"s;
			}
		};
	} // namespace task_B
	
} // namespace abc086


int main (void)
{
	// variables for main process
	abc086::task_B::PairIntegers given_data;

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
