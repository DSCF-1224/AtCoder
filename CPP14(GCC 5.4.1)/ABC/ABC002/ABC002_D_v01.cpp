// contest  : ABC 002
// task     : D
// URL      : https://atcoder.jp/contests/abc002/tasks/abc002_4
// compiler : C++14 (GCC 5.4.1)
// status   : Not Submitted

// - reference
//   - https://abc002.contest.atcoder.jp/submissions/110897

#include <algorithm>
#include <iostream>
#include <string>
#include <vector>

namespace abc002
{
	using namespace std::literals;

	namespace task_D
	{
		struct PairConnection
		{
			/* Data Member */
			public:
				int fst;
				int snd;

			/* Constructor */
			public:
				explicit
					PairConnection (int const & fst, int const & snd)
					{
						this->fst = fst;
						this->snd = snd;
					}

			public:
				explicit
					PairConnection (int const & val)
					{
						this->fst = val;
						this->snd = val;
					}

			public:
				explicit
					PairConnection (void):
						PairConnection(0)
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

			public:
				void cout_member (void) const
				{
					std::cout
						<< "("s
						<< this->fst
						<< ","s
						<< this->snd
						<< ")\n"s
					;
				}
		};

		struct Num
		{
			/* Data Member */
			public:
				std::size_t representative;
				std::size_t connection;

			/* Member function */
			private:
				bool inspector_representative (void) const
				{
					return this->representative > 0;
				}

			private:
				bool inspector_connection (void) const
				{
					return this->connection > 0;
				}

			public:
				void inspector (void) const
				{
					try
					{
						if ( ! this->inspector_representative() )
						{
							throw std::out_of_range("The number of representatives was not positive integer !\n"s);
						}
						else if ( ! this->inspector_connection() )
						{
							throw std::out_of_range("The number of connections was not positive integer !\n"s);
						}
					}
					catch (const std::exception & e)
					{
						std::cerr << e.what();
						std::abort();
					}

					return;
				}

			/* Constructor */
			public:
				explicit
					Num (std::size_t const & representative, std::size_t const & connection)
					{
						this->representative = representative;
						this->connection     = connection;
					}

			public:
				explicit
					Num (void):
						Num(1, 0)
					{/* nothing to do in this block scope */}

			/* Member function */
			public:
				void cin (void)
				{
					std::cin
						>> this->representative
						>> this->connection
					;

					this->inspector();
					
					return;
				}

			public:
				void cout_member (void) const
				{
					std::cout
						<< "representative : "s << this->representative << "\n"s
						<< "relation       : "s << this->connection     << "\n"s
					;
				}
		};

		struct Data:
			public Num,
			public PairConnection
		{
			/* Data Member */
			private:
				Num                            num;
				std::vector<PairConnection>    pair_connection;
				std::vector<std::vector<bool>> stat_connection;

			/* Member Function */
			private:
				void resize_StatConnection (void)
				{
					this->stat_connection.resize( this->num.representative );

					for (auto iter = std::begin( this->stat_connection ), iter_end = std::end( this->stat_connection ); iter != iter_end; ++iter)
					{
						(*iter).resize( this->num.representative );
					}

					return;
				}

			private:
				void resize_PairConnection (void)
				{
					this->pair_connection.resize( this->num.connection );
				}

			/* Constructor */
			public:
				explicit
					Data
					(
						Num                            obj_num,
						std::vector<PairConnection>    obj_pair_connection,
						std::vector<std::vector<bool>> obj_stat_connection
					) {
						// STEP.01.01
						obj_num.inspector();

						// STEP.01.02
						this->num = obj_num;

						// STEP.02.01
						this->resize_PairConnection();

						// STEP.02.02
						std::copy(
							std::begin ( obj_pair_connection   ),
							std::end   ( obj_pair_connection   ),
							std::begin ( this->pair_connection )
						);

						// STEP.03.01
						this->resize_StatConnection();

						// STEP.03.02
						for (std::size_t iter1 = 0; iter1 < obj_num.representative; ++iter1)
						for (std::size_t iter2 = 0; iter2 < obj_num.representative; ++iter2)
						{
							this->stat_connection.at(iter1).at(iter2) = obj_stat_connection.at(iter1).at(iter2);
						}
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
					this->resize_PairConnection();

					// STEP.02.02
					std::for_each (
						std::begin( this->pair_connection ),
						std::end  ( this->pair_connection ),
						[] (auto & iter) { iter.cin(); }
					);

					// STEP.03.01
					this->resize_StatConnection();

					// STEP.03.02
					for (std::size_t iter = 0; iter < this->num.connection; ++iter)
					{
						this->stat_connection.at( this->pair_connection.at(iter).fst - 1 ).at( this->pair_connection.at(iter).snd - 1 ) =
						this->stat_connection.at( this->pair_connection.at(iter).snd - 1 ).at( this->pair_connection.at(iter).fst - 1 ) = true;
					}

					// STEP.TRUE_END
					return;
				}

			public:
				void cout_member (void) const
				{
					// STEP.01
					this->num.cout_member();

					// STEP.02
					std::for_each (
						std::begin( this->pair_connection ),
						std::end  ( this->pair_connection ),
						[] (auto & iter) { iter.cout_member(); }
					);

					// STEP.03
					std::cout << std::noboolalpha;

					for (std::size_t iter = 0; iter < this->num.representative; ++iter)
					{
						std::for_each (
							std::begin( this->stat_connection.at(iter) ),
							std::end  ( this->stat_connection.at(iter) ),
							[](auto obj_iter)
							{
								std::cout << obj_iter;
							}
						);

						std::cout << "\n"s;
					};
				}

			public:
				int MaxFactionalRepresentatives (void) const
				{
					/* return value of this function */
					int max_Representative = 0;

					// STEP.01
					return max_Representative;
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
