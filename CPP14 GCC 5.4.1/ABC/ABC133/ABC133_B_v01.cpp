// [contest]  ABC 133
// [task]     B
// [URL]      https://atcoder.jp/contests/abc133/tasks/abc133_b
// [compiler] C++ 14 (GCC 5.4.1)
// [status]   NOT Submitted

#include <algorithm>
#include <iostream>
#include <vector>

int calculate_distance2 (int val_dimension, std::vector<int> point_orign, std::vector<int> point_target)
{
	// return value of this function
	int distance2;
	int difference;

	distance2 = 0;

	for (int itr = 0; itr < val_dimension; itr++)
	{
		difference  = point_target[itr] - point_orign[itr];
		difference *= difference;
		distance2  += difference;
	}

	return distance2;
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

	for (int itr_orign  = 0;             itr_orign  < num_points - 1; itr_orign ++) {
	for (int itr_target = itr_orign + 1; itr_target < num_points;     itr_target++) {
		std::cout << itr_orign << " " << itr_target << " " << calculate_distance2(val_dimension, coordinate.at(itr_orign), coordinate.at(itr_target)) << std::endl;
	}
	}

	// STEP.END
	return 0;
}

// EOF
