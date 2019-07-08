// [contest]  ABC 133
// [task]     B
// [URL]      https://atcoder.jp/contests/abc133/tasks/abc133_b
// [compiler] C++ 14 (GCC 5.4.1)
// [status]   https://atcoder.jp/contests/abc133/submissions/6313090 : AC

#include <iostream>
#include <vector>

int calculate_distance2 (int const& val_dimension, std::vector<int> const& point_orign, std::vector<int> const& point_target)
{
	// return value of this function
	int distance2;
	int difference;

	distance2 = 0;

	for (int itr = 0; itr < val_dimension; itr++)
	{
		difference  = point_target.at(itr) - point_orign.at(itr);
		difference *= difference;
		distance2  += difference;
	}

	return distance2;
}

bool is_GoodDist (int const& val_dist)
{
	// variables for this function
	int itr_int  = 0;
	int itr_int2 = 0;

	while (itr_int2 <= val_dist)
	{
		if (itr_int2 == val_dist) { return true; }
		itr_int++;
		itr_int2 = itr_int * itr_int;
	}

	return false;
}

int calculate_num_GoodDist (int const& num_points, int const& val_dimension, std::vector<std::vector<int>> const& coordinate)
{
	// variables for this function
	int num_GoodDist;

	// STEP.01
	// initialize the variable
	num_GoodDist = 0;

	for (int itr_orign  = 0;             itr_orign  < num_points - 1; ++itr_orign ) {//
	for (int itr_target = itr_orign + 1; itr_target < num_points;     ++itr_target) {//
		if ( is_GoodDist( calculate_distance2(val_dimension, coordinate.at(itr_orign), coordinate.at(itr_target)) ) ) { num_GoodDist++; }
	}
	}

	return num_GoodDist;
}

int main (void)
{
	// variables for main process
	int num_points;
	int val_dimension;

	// STEP.01
	// read out the given data
	std::cin >> num_points >> val_dimension;

	// STEP.02
	// declare the <vector> object to store the given data
	std::vector<std::vector<int>> coordinate(num_points, std::vector<int>(val_dimension)); ;

	// STEP.03
	// read out the given data
	for (int itr_point = 0; itr_point < num_points;    itr_point++) {//
	for (int itr_dmsn  = 0; itr_dmsn  < val_dimension; itr_dmsn++ ) {//
		std::cin >> coordinate[itr_point][itr_dmsn];
	}
	}

	std::cout << calculate_num_GoodDist (num_points, val_dimension, coordinate) << std::endl;

	// STEP.END
	return 0;
}

// EOF
