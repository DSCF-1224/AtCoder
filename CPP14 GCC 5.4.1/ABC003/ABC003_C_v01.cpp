/* AtCoder Beginner Contest 003 C */
/*

[URL]
https://atcoder.jp/contests/abc001/tasks/abc003_3

[compiler]
C++14 (GCC 5.4.1)

[reference]
<1> https://cpprefjp.github.io/reference/algorithm/sort.html
<2> https://cpprefjp.github.io/reference/algorithm/partial_sort.html
<3> https://cpprefjp.github.io/reference/iomanip/setprecision.html

*/

#include <algorithm>
#include <iomanip>
#include <ios>
#include <iostream>
#include <vector>

double calc_AchievableMaximumRate( std::vector<int>& rate_video, int num_video_watch )
{
	/* local variable for this function */
	double rate;

	// STEP.01
	// sort the values of rate of each video
	std::sort( rate_video.begin(), rate_video.end() );

	// STEP.02
	// calculate the achievable maximum rate
	rate = 0.0;
	for(size_t itr = rate_video.size()-num_video_watch; itr < rate_video.size(); itr++) rate = ( rate+(double)rate_video.at(itr) )/2.0;
	
	// STEP.END
	return rate;
}

int main (void)
{
	// STEP.01
	// read out the number of the videos and ones which he can watch
	int num_video_total;
	int num_video_watch;
	std::cin >> num_video_total >> num_video_watch;

	// STEP.02
	// declare the `std::vector` to store values of rate of each video
	std::vector<int> rate_video(num_video_total);

	// STEP.03
	// read out the values of rate of each video
	for(size_t itr = 0; itr < num_video_total; itr++) std::cin >> rate_video.at(itr);

	// STEP.04
	// output the answer
	std::cout << std::scientific << std::setprecision(10) << calc_AchievableMaximumRate( rate_video, num_video_watch ) << std::endl;

	// STEP.END
	return 0;
}
