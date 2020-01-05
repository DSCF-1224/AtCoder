// contest  : ABC 002
// task     : D
// URL      : https://atcoder.jp/contests/abc002/tasks/abc002_4
// compiler : C++14 (GCC 5.4.1)
// status   : Not Submitted

#include <algorithm>
#include <iostream>
#include <string>
#include <vector>

namespace abc002
{
	using namespace std::literals;

	namespace task_D
	{
		struct Connection
		{
			/* Data Member */
			public:
				int fst;
				int snd;

			/* Constructor */
			public:
				explicit
					Connection (int const & fst, int const & snd)
					{
						this->fst = fst;
						this->snd = snd;
					}

			public:
				explicit
					Connection (int const & val)
					{
						this->fst = val;
						this->snd = val;
					}

			public:
				explicit
					Connection (void):
						Connection(0)
					{/* nothing to do in this block scope */}

			/* Member function */
			public:
				void cin (void)
				{
					std::cin
						>> this->fst
						>> this->snd
					;
				}
		};

		struct Num
		{
			/* Data Member */
			public:
				int representative;
				int connection;

			/* Constructor */
			public:
				explicit
					Num (int const & representative, int const & connection)
					{
						this->representative = representative;
						this->connection     = connection;
					}

			public:
				explicit
					Num (int const & val)
					{
						this->representative = val;
						this->connection     = val;
					}

			public:
				explicit
					Num (void):
						Num(0)
					{/* nothing to do in this block scope */}

			/* Member function */
			public:
				void cin (void)
				{
					std::cin
						>> this->representative
						>> this->connection
					;
				}
		};

		struct Data:
			public Num,
			public Connection
		{
			/* Data Member */
			private:
				Num                     num;
				std::vector<Connection> connection;

			/* Constructor */
			public:
				explicit
					Data (Num const & obj_num, std::vector<Connection> const & obj_connection)
					{
						// STEP.01
						this->num = obj_num;

						// STEP.02.01
						this->connection.resize( std::size(  obj_connection ) );

						// STEP.02.02
						std::copy(
							std::begin ( obj_connection ),
							std::end   ( obj_connection ),
							std::begin ( this->connection )
						);
					}

			public:
				explicit
					Data (void)
					{
						this->num = Num();
					}

			/* Member Function */
			public:
				void cin (void)
				{
					// STEP.01
					this->num.cin();

					// STEP.02.01
					this->connection.resize( this->num.connection );

					// STEP.02.02
					for ( auto iter = std::begin( this->connection ), iter_end = std::end( this->connection ); iter != iter_end; ++iter )
					{
						(*iter).cin();
					}

					// STEP.TRUE_END
					return;
				}

			public:
				void cout_member (void)
				{
					// STEP.01
					std::cout
						<< "representative : "s << this->num.representative << "\n"s
						<< "relation       : "s << this->num.connection     << "\n"s
					;

					// STEP.02
					for ( auto iter = std::begin( this->connection ), iter_end = std::end( this->connection ); iter != iter_end; ++iter )
					{
						std::cout
							<< "("s
							<< (*iter).fst
							<< ","s
							<< (*iter).snd
							<< ")\n"s
						;
					}
				}
		};
		
	} // namespace task_D
	
} // namespace abc002


int main (void)
{
	/* variables for main process */
	abc002::task_D::Data test_data;


	// STEP.01
	// read out the given test data
	test_data.cin();
	test_data.cout_member();

	// STEP.02
	// output the result

	// STEP.END
	return EXIT_SUCCESS;
}

/* EOF */
