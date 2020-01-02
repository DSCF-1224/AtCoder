// contest  : ABC 001
// task     : D
// URL      : https://atcoder.jp/contests/abc001/tasks/abc001_4
// compiler : C++14 (GCC 5.4.1)
// status   : https://atcoder.jp/contests/abc001/submissions/9280243 : AC

#include <algorithm>
#include <iostream>
#include <iomanip>
#include <string>
#include <vector>

using namespace std::literals;



int round_time_down (int const & time);
int round_time_up   (int const & time);



int round_time_down (int const & time)
{
	// local variable for this function
	int minute01;

	minute01 = time % 10;

	if      (minute01 == 0 || minute01 == 5) { return time;                }
	else if (minute01 <  5)                  { return time - minute01;     }
	else                                     { return time - minute01 + 5; }
}



int round_time_up (int const & time)
{
	// local variable for this function
	int minute01;
	int minute10;

	minute01 = time % 10;

	if      (minute01 == 0 || minute01 == 5) { return time;                }
	else if (minute01 <  5 )                 { return time - minute01 + 5; }

	minute10 = time % 100;

	if   (minute10 < 50) { return time - minute01 +  10; }
	else                 { return time - minute10 + 100; }
}



struct Period
{
	public:
		int start;
		int stop;

	public:
		void cin (void)
		{
			// local variables for this function
			std::string buffer;

			// STEP.01
			// get the given data from the standard input
			std::cin >> buffer;

			// STEP.02
			// get the start time of the rainy period
			try
			{
				this->start = std::stoi( buffer.substr(0, 4).c_str(), nullptr, 10 );
			}
			catch(const std::exception& e)
			{
				std::cerr
					<< e.what()
					<< "Failed to get the start time of the rainy period.\n"s
				;
			}

			// STEP.03
			// get the start time of the rainy period
			try
			{
				this->stop = std::stoi( buffer.substr(5, 4).c_str(), nullptr, 10 );
			}
			catch(const std::exception& e)
			{
				std::cerr
					<< e.what()
					<< "Failed to get the end time of the rainy period.\n"s
				;
			}

			// STEP.TRUE_END
			return;
		}

	public:
		void cin_rounded (void)
		{
			this->cin();

			this->start = round_time_down( this->start );
			this->stop  = round_time_up  ( this->stop  );

			return;
		}

	public:
		void cout (void)
		{
			std::cout
				<< std::setw(4) << std::setfill('0') << this->start
				<< "-"s
				<< std::setw(4) << std::setfill('0') << this->stop
				<< "\n"s
			;
		}

	public:
		bool operator < (Period const & obj_rhs)
		{
			if ( this->start < obj_rhs.start )
			{
				return true;
			}
			else if ( this->start > obj_rhs.start )
			{
				return false;
			}
			else
			{
				return (this->stop < obj_rhs.stop);
			}
		}
};



namespace abc001
{
	namespace task_D
	{
		struct Data
		{
			// data member
			private:
				std::size_t         num_periods;
				std::vector<Period> period;

			public:
				void cin (void)
				{
					// STEP.01
					// get the number of periods from the standard input
					std::cin >> this->num_periods;

					// STEP.02
					// resize the `vector` instance to store the rainy periods  data
					period.resize( this->num_periods );

					// STEP.03
					// get the start / end time of periods
					for ( auto iter = std::begin(this->period), iter_end = std::end(this->period); iter != iter_end; ++iter )
					{
						(*iter).cin_rounded();
					}

					// STEP.END
					return;
				}

			public:
				void cout (void)
				{
					for ( auto iter = std::begin(this->period), iter_end = std::end(this->period); iter != iter_end; ++iter )
					{
						(*iter).cout();
					}

					return;
				}

			public:
				void sort_periods (void)
				{
					std::sort( std::begin(this->period), std::end(this->period) );

					return;
				}

			public:
				void compress_periods (void)
				{
					// variables for this function
					Period period_compressed = this->period.at(0);

					for ( auto iter = std::begin(this->period), iter_end = std::end(this->period); iter != iter_end; ++iter)
					{
						if ( period_compressed.stop < (*iter).start )
						{
							period_compressed.cout();
							period_compressed = *iter;
						}
						else if ( period_compressed.stop < (*iter).stop )
						{
							period_compressed.stop = (*iter).stop;
						}
						else
						{
							continue;
						}
						
					}

					period_compressed.cout();
				}
		};
	} // namespace task_D
	
} // namespace abc001



int main (void)
{
	// variables for this function
	abc001::task_D::Data test_data;

	// STEP.01
	// get the test data
	test_data.cin();

	// STEP.02
	// compute & output the answer of this task
	test_data.sort_periods();
	test_data.compress_periods();

	// STEP.TRUE_END
	return EXIT_SUCCESS;
}

/* EOF */
